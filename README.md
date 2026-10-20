# Soykng

A bilingual Jekyll personal site and blog at https://yekunsong.github.io.

## Preview

On Windows, use Ruby+Devkit 3.3 from [RubyInstaller](https://rubyinstaller.org/downloads/).
The preview script also detects a checkout-local Ruby installation at `.tools/ruby`.
From PowerShell in the repository root, run:

```powershell
.\scripts\preview.ps1
```

It installs missing gems into `vendor/bundle` and starts Jekyll with live reload.
Open http://127.0.0.1:4000/zh/ for Chinese or http://127.0.0.1:4000/ for English.
Keep the terminal open; press Ctrl+C to stop. Use `-Port 4001` to choose another port,
or `-BuildOnly` to check the build without starting a server.

On other platforms, install Ruby and Bundler, then run:

```sh
bundle install
bundle exec jekyll serve
```

Open http://127.0.0.1:4000. Run `bundle exec jekyll build` to generate `_site/`.

## Content and layout

- `_data/profile.yml` and `_data/profile_zh.yml`: English and Chinese profile content.
- `_data/ui.yml`: translated labels and navigation.
- `_data/research.yml`: research topics and their related project IDs.
- `_layouts/profile.html`: shared site layout.
- `_layouts/post.html`: article layout.
- `_includes/`: current page sections.
- `_includes/site-motion.html`: directional page transitions and one-time scroll reveals.
- `css/profile.css`: shared styling and CSS interactions.
- `css/syntax.css`: article code highlighting.
- `img/archive-study.svg`: original vector artwork for the archive opening.

Education includes the subject, study period, CGPA, distinctions, and coursework.
The institution name is not included in the site data or rendered pages.
Project names are Chatrix in English and 言矩 in Chinese.

English pages use `/`, `/about/`, `/projects/`, `/blog/`, and `/tags/`.
Chinese pages use the `/zh/` prefix. Language links open the corresponding page.

The site uses plain CSS and system fonts. It has no Node.js build step, browser
JavaScript dependencies, or service worker. Stylesheet URLs include the build time
so updated pages load matching styles. Navigation between sections slides left or
right according to the header order, and the selected underline moves with it.
The current page exits over 160ms before its content and title are replaced; the
next page then enters over 560ms, moving 64px on desktop or 40px on mobile.
Navigation links persist within the same language so their selected state and
underline move continuously. Interrupted transitions resume from the current
visual state. Below-fold content rises by 24px over 560ms on first scroll into
view; initial page loads have no entrance animation. Motion settings are defined
in `css/profile.css`.
The inline script uses the same Web Animations implementation in every browser.
It loads same-origin HTML pages, updates the shared layout and page metadata, and
preserves history, scroll positions, language links, and anchors. Failed requests
fall back to normal navigation; external links, downloads, and new tabs keep their
standard behavior. Page content containing scripts also uses normal navigation.
Motion is controlled by the website and stays enabled regardless of the system's
reduced-motion preference.

## Posts

Create `_posts/YYYY-MM-DD-title.md`:

```yaml
---
layout: post
lang: en
title: "My first post"
date: 2026-10-17
tags:
  - Notes
---
```

Write Markdown below the front matter. English is the default language;
use `lang: zh` for Chinese. Each language's blog and tag pages show its own posts.
Code fences support syntax highlighting. The author defaults to Soykng.

For a translated article, add `translation_url` and `translation_lang` to link
its counterpart. No language switch appears on untranslated articles.

## Deployment

Publish the `master` branch from the repository root with GitHub Pages.
The Gemfile uses the GitHub Pages dependency set for local builds.

## Credits and license

Originally derived from BY Blog by qiubaiying and Hux Blog by Huxpro.
The original MIT license is retained in `LICENSE`.
