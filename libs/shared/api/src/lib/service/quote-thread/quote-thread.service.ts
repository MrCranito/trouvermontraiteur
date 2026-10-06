import { inject, Injectable } from '@angular/core';
import {
  listLocalQuoteThread,
  QuoteThreadMessage,
  saveLocalQuoteThreadMessage,
} from '@trouvermontraiteur/models';
import { SUPABASE_CLIENT } from '../../supabase/supabase.token';

interface QuoteThreadRow {
  id: string;
  quote_id: string;
  author: QuoteThreadMessage['author'];
  body: string;
  attachments: QuoteThreadMessage['attachments'];
  created_at: string;
}

@Injectable({ providedIn: 'root' })
export class QuoteThreadService {
  private readonly supabase = inject(SUPABASE_CLIENT);
  private remoteAvailable: boolean | null = null;

  async list(quoteId: string): Promise<QuoteThreadMessage[]> {
    const local = listLocalQuoteThread(quoteId);
    const remote = await this.listRemote(quoteId);
    if (!remote) {
      return local;
    }

    const byId = new Map<string, QuoteThreadMessage>();
    for (const message of [...remote, ...local]) {
      byId.set(message.id, message);
    }
    return [...byId.values()].sort((a, b) =>
      a.createdAt.localeCompare(b.createdAt),
    );
  }

  async send(
    message: Omit<QuoteThreadMessage, 'id' | 'createdAt'> & {
      id?: string;
      createdAt?: string;
    },
  ): Promise<QuoteThreadMessage> {
    const saved = saveLocalQuoteThreadMessage({
      id: message.id ?? crypto.randomUUID(),
      quoteId: message.quoteId,
      author: message.author,
      body: message.body.trim(),
      createdAt: message.createdAt ?? new Date().toISOString(),
      attachments: message.attachments,
    });

    if (this.remoteAvailable !== false) {
      const { error } = await this.supabase.from('quote_thread_messages').insert({
        id: saved.id,
        quote_id: saved.quoteId,
        author: saved.author,
        body: saved.body,
        attachments: saved.attachments,
        created_at: saved.createdAt,
      });
      if (error) {
        if (this.isMissingTable(error)) {
          this.remoteAvailable = false;
        }
      } else {
        this.remoteAvailable = true;
      }
    }

    return saved;
  }

  private async listRemote(
    quoteId: string,
  ): Promise<QuoteThreadMessage[] | null> {
    if (this.remoteAvailable === false) {
      return null;
    }

    const { data, error } = await this.supabase
      .from('quote_thread_messages')
      .select('id, quote_id, author, body, attachments, created_at')
      .eq('quote_id', quoteId)
      .order('created_at', { ascending: true });

    if (error) {
      if (this.isMissingTable(error)) {
        this.remoteAvailable = false;
      }
      return null;
    }

    this.remoteAvailable = true;
    return ((data ?? []) as QuoteThreadRow[]).map((row) => ({
      id: row.id,
      quoteId: row.quote_id,
      author: row.author,
      body: row.body ?? '',
      createdAt: row.created_at,
      attachments: Array.isArray(row.attachments) ? row.attachments : [],
    }));
  }

  private isMissingTable(error: { code?: string; message?: string }): boolean {
    const message = error.message ?? '';
    return (
      error.code === '42P01' ||
      error.code === 'PGRST205' ||
      /does not exist|schema cache|Could not find the table/i.test(message)
    );
  }
}
