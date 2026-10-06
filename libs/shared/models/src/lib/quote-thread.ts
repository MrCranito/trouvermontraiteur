export type QuoteThreadAuthor = 'client' | 'craftsman';

export interface QuoteThreadAttachment {
  id: string;
  name: string;
  mimeType: string;
  dataUrl: string;
}

export interface QuoteThreadMessage {
  id: string;
  quoteId: string;
  author: QuoteThreadAuthor;
  body: string;
  createdAt: string;
  attachments: QuoteThreadAttachment[];
}

const STORAGE_KEY = 'tmt:quote-threads:v1';
const MAX_EDGE = 1280;
const MAX_DOCUMENT_BYTES = 1_500_000;

export function isQuoteThreadImage(mimeType: string): boolean {
  return mimeType.startsWith('image/');
}

export function listLocalQuoteThread(quoteId: string): QuoteThreadMessage[] {
  return readAll()
    .filter((message) => message.quoteId === quoteId)
    .sort((a, b) => a.createdAt.localeCompare(b.createdAt));
}

export function saveLocalQuoteThreadMessage(
  message: QuoteThreadMessage,
): QuoteThreadMessage {
  const all = readAll().filter((item) => item.id !== message.id);
  all.push(message);
  writeAll(all);
  return message;
}

export async function fileToQuoteAttachment(
  file: File,
): Promise<QuoteThreadAttachment> {
  const dataUrl = file.type.startsWith('image/')
    ? await compressImage(file)
    : await readDocument(file);

  return {
    id: crypto.randomUUID(),
    name: file.name,
    mimeType: file.type.startsWith('image/')
      ? 'image/jpeg'
      : file.type || 'application/octet-stream',
    dataUrl,
  };
}

function readAll(): QuoteThreadMessage[] {
  if (typeof localStorage === 'undefined') {
    return [];
  }
  const raw = localStorage.getItem(STORAGE_KEY);
  if (!raw) {
    return [];
  }
  try {
    const parsed = JSON.parse(raw) as QuoteThreadMessage[];
    return Array.isArray(parsed) ? parsed : [];
  } catch {
    return [];
  }
}

function writeAll(messages: QuoteThreadMessage[]): void {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(messages));
}

function readDocument(file: File): Promise<string> {
  if (file.size > MAX_DOCUMENT_BYTES) {
    return Promise.reject(
      new Error('Fichier trop volumineux (1,5 Mo maximum).'),
    );
  }
  return readAsDataUrl(file);
}

function readAsDataUrl(file: Blob): Promise<string> {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onload = () => resolve(String(reader.result ?? ''));
    reader.onerror = () => reject(new Error('Lecture du fichier impossible.'));
    reader.readAsDataURL(file);
  });
}

function compressImage(file: File): Promise<string> {
  return new Promise((resolve, reject) => {
    const url = URL.createObjectURL(file);
    const image = new Image();
    image.onload = () => {
      const scale = Math.min(1, MAX_EDGE / Math.max(image.width, image.height));
      const canvas = document.createElement('canvas');
      canvas.width = Math.max(1, Math.round(image.width * scale));
      canvas.height = Math.max(1, Math.round(image.height * scale));
      const context = canvas.getContext('2d');
      if (!context) {
        URL.revokeObjectURL(url);
        reject(new Error('Image illisible.'));
        return;
      }
      context.drawImage(image, 0, 0, canvas.width, canvas.height);
      URL.revokeObjectURL(url);
      resolve(canvas.toDataURL('image/jpeg', 0.72));
    };
    image.onerror = () => {
      URL.revokeObjectURL(url);
      reject(new Error('Image illisible.'));
    };
    image.src = url;
  });
}
