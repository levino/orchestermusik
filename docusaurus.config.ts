import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

const config: Config = {
  title: 'Orchestermusik',
  tagline: 'LilyPond Noten zum Teilen, Nutzen und Bearbeiten',
  favicon: 'img/favicon.ico',

  future: {
    v4: true,
    experimental_faster: true,
  },

  url: 'https://orchestermusik.pages.dev',
  baseUrl: '/',

  organizationName: 'levino',
  projectName: 'orchestermusik',

  onBrokenLinks: 'throw',

  i18n: {
    defaultLocale: 'de',
    locales: ['de'],
  },

  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: './sidebars.ts',
          routeBasePath: '/',
          editUrl: 'https://github.com/levino/orchestermusik/tree/main/',
        },
        blog: false,
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],

  themeConfig: {
    colorMode: {
      respectPrefersColorScheme: true,
    },
    navbar: {
      title: 'Orchestermusik',
      logo: {
        alt: 'Orchestermusik Logo',
        src: 'img/logo.svg',
      },
      items: [
        {
          type: 'docSidebar',
          sidebarId: 'tutorialSidebar',
          position: 'left',
          label: 'Noten',
        },
        {
          href: 'https://github.com/levino/orchestermusik',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: 'Noten',
          items: [
            {
              label: 'Einführung',
              to: '/',
            },
          ],
        },
        {
          title: 'Mehr',
          items: [
            {
              label: 'GitHub',
              href: 'https://github.com/levino/orchestermusik',
            },
          ],
        },
      ],
      copyright: `CC0 1.0 Universal - Erstellt mit Docusaurus.`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
