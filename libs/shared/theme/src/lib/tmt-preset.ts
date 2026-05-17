import { definePreset } from '@primeuix/themes';
import Aura from '@primeuix/themes/aura';
import { colors } from './colors';

const terracottaScale = {
  50: '#fdf0e8',
  100: '#f9ddd0',
  200: '#f3b99d',
  300: '#ec946a',
  400: colors.terracottaLight,
  500: colors.terracotta,
  600: '#a85124',
  700: '#8b401c',
  800: '#6d3116',
  900: '#4f2410',
  950: '#3a1a0c',
};

const sageScale = {
  50: '#f0f4f0',
  100: '#dce5dd',
  200: '#b9c9ba',
  300: colors.sageLight,
  400: '#729674',
  500: colors.sage,
  600: '#4a624c',
  700: '#3b4f3d',
  800: '#2f3f31',
  900: '#243026',
  950: '#1a221b',
};

const goldScale = {
  50: '#fbf5e8',
  100: '#f5e6c4',
  200: '#ebd08a',
  300: '#e0ba56',
  400: '#d9ae5f',
  500: colors.gold,
  600: '#b8913f',
  700: '#967531',
  800: '#755a27',
  900: '#55411c',
  950: '#3d2f14',
};

const surfaceScale = {
  0: colors.cream,
  50: colors.cream,
  100: colors.creamDark,
  200: '#e5dac8',
  300: '#d4c8b4',
  400: '#a89888',
  500: colors.muted,
  600: '#5c5248',
  700: '#453c34',
  800: '#352e28',
  900: colors.charcoal,
  950: '#1f1914',
};

/**
 * PrimeNG preset for Trouver Mon Traiteur (extends Aura).
 */
export const TmtPreset = definePreset(Aura, {
  primitive: {
    terracotta: terracottaScale,
    sage: sageScale,
    gold: goldScale,
    green: sageScale,
    orange: goldScale,
  },
  semantic: {
    primary: terracottaScale,
    focusRing: {
      color: colors.terracotta,
    },
    colorScheme: {
      light: {
        surface: surfaceScale,
        primary: {
          color: colors.terracotta,
          contrastColor: colors.cream,
          hoverColor: colors.terracottaLight,
          activeColor: terracottaScale[600],
        },
        highlight: {
          background: colors.creamDark,
          focusBackground: '#e5dac8',
          color: colors.charcoal,
          focusColor: colors.charcoal,
        },
        text: {
          color: colors.charcoal,
          hoverColor: colors.charcoal,
          mutedColor: colors.muted,
          hoverMutedColor: colors.muted,
        },
        content: {
          background: colors.cream,
          hoverBackground: colors.creamDark,
          borderColor: colors.border,
          color: colors.charcoal,
          hoverColor: colors.charcoal,
        },
        formField: {
          background: colors.cream,
          disabledBackground: colors.creamDark,
          filledBackground: colors.creamDark,
          filledHoverBackground: colors.creamDark,
          filledFocusBackground: colors.cream,
          borderColor: colors.border,
          hoverBorderColor: colors.muted,
          focusBorderColor: colors.terracotta,
          color: colors.charcoal,
          placeholderColor: colors.muted,
          floatLabelColor: colors.muted,
          floatLabelFocusColor: colors.terracotta,
        },
        overlay: {
          select: {
            background: colors.cream,
            borderColor: colors.border,
            color: colors.charcoal,
          },
          popover: {
            background: colors.cream,
            borderColor: colors.border,
            color: colors.charcoal,
          },
          modal: {
            background: colors.cream,
            borderColor: colors.border,
            color: colors.charcoal,
          },
        },
        list: {
          option: {
            focusBackground: colors.creamDark,
            selectedBackground: colors.creamDark,
            selectedFocusBackground: '#e5dac8',
            color: colors.charcoal,
            focusColor: colors.charcoal,
            selectedColor: colors.charcoal,
            selectedFocusColor: colors.charcoal,
          },
        },
        navigation: {
          item: {
            focusBackground: colors.creamDark,
            activeBackground: colors.creamDark,
            color: colors.charcoal,
            focusColor: colors.charcoal,
            activeColor: colors.charcoal,
          },
          submenuLabel: {
            color: colors.muted,
          },
        },
      },
      dark: {
        surface: {
          0: colors.cream,
          50: '#352e28',
          100: '#453c34',
          200: '#5c5248',
          300: colors.muted,
          400: '#a89888',
          500: '#d4c8b4',
          600: '#e5dac8',
          700: colors.creamDark,
          800: colors.cream,
          900: colors.cream,
          950: colors.cream,
        },
        primary: {
          color: colors.terracottaLight,
          contrastColor: colors.cream,
          hoverColor: colors.terracotta,
          activeColor: terracottaScale[600],
        },
        text: {
          color: colors.cream,
          hoverColor: colors.cream,
          mutedColor: '#d4c8b4',
          hoverMutedColor: colors.creamDark,
        },
        content: {
          background: colors.charcoal,
          hoverBackground: '#352e28',
          borderColor: 'rgba(250,246,239,0.12)',
          color: colors.cream,
          hoverColor: colors.cream,
        },
        formField: {
          background: '#352e28',
          borderColor: 'rgba(250,246,239,0.12)',
          focusBorderColor: colors.terracottaLight,
          color: colors.cream,
          placeholderColor: '#d4c8b4',
        },
      },
    },
  },
  components: {
    button: {
      colorScheme: {
        light: {
          root: {
            secondary: {
              background: colors.sage,
              hoverBackground: sageScale[600],
              activeBackground: sageScale[700],
              borderColor: colors.sage,
              hoverBorderColor: sageScale[600],
              activeBorderColor: sageScale[700],
              color: colors.cream,
              hoverColor: colors.cream,
              activeColor: colors.cream,
              focusRing: { color: colors.sage, shadow: 'none' },
            },
            warn: {
              background: colors.gold,
              hoverBackground: goldScale[600],
              activeBackground: goldScale[700],
              borderColor: colors.gold,
              hoverBorderColor: goldScale[600],
              activeBorderColor: goldScale[700],
              color: colors.charcoal,
              hoverColor: colors.charcoal,
              activeColor: colors.charcoal,
              focusRing: { color: colors.gold, shadow: 'none' },
            },
          },
          outlined: {
            secondary: {
              hoverBackground: sageScale[50],
              activeBackground: sageScale[100],
              borderColor: sageScale[200],
              color: colors.sage,
            },
            warn: {
              hoverBackground: goldScale[50],
              activeBackground: goldScale[100],
              borderColor: goldScale[200],
              color: colors.gold,
            },
          },
          text: {
            secondary: {
              hoverBackground: sageScale[50],
              activeBackground: sageScale[100],
              color: colors.sage,
            },
            warn: {
              hoverBackground: goldScale[50],
              activeBackground: goldScale[100],
              color: colors.gold,
            },
          },
        },
      },
    },
    tag: {
      colorScheme: {
        light: {
          success: {
            background: colors.sage,
            color: colors.cream,
          },
          warn: {
            background: colors.gold,
            color: colors.charcoal,
          },
        },
      },
    },
    rating: {
      colorScheme: {
        light: {
          icon: {
            activeColor: colors.gold,
            color: colors.creamDark,
            hoverColor: colors.gold,
          },
        },
      },
    },
    message: {
      colorScheme: {
        light: {
          success: {
            background: sageScale[50],
            borderColor: sageScale[200],
            color: sageScale[700],
            shadow: 'none',
          },
          warn: {
            background: goldScale[50],
            borderColor: goldScale[200],
            color: goldScale[800],
            shadow: 'none',
          },
        },
      },
    },
  },
});
