# Personal Blog

A minimal Jekyll blog for https://yekunsong.github.io, ready for new content.

## Local preview

Install Ruby and Bundler, then run:

```sh
bundle install
bundle exec jekyll serve
```

Open http://127.0.0.1:4000. To produce the static site, run
`bundle exec jekyll build`; the output goes into `_site/`.

## Customize

Edit `_config.yml` to change the site title, description, social links, and URL.
Layouts live in `_layouts/`, shared templates in `_includes/`, and styles in
`less/` and `css/`. Generic SVG assets live in `img/`.

The blog starts without posts. To publish one, create a Markdown file in
`_posts/` named `YYYY-MM-DD-title.md` with front matter such as:

```yaml
---
layout: post
title: "My first post"
date: 2026-10-17
author: yekunsong
tags:
  - Notes
---
```

Write the post below the front matter. Comments, analytics, and the service
worker are disabled by default. Configure your own integrations before enabling
them.

## Theme assets

The checked-in CSS and JavaScript work without Node.js. To edit the LESS or
JavaScript sources, install the optional build dependencies with `npm install`,
then run `npm run build` or `npm run watch`.

## Deployment

Publish the `master` branch from the repository root using GitHub Pages.
The included Gemfile uses the GitHub Pages dependency set for local previews.

## Credits and license

The theme is derived from BY Blog by qiubaiying and Hux Blog by Huxpro.
The original license and source notices are retained. See `LICENSE`.
