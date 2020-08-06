# GitHub Pages Jekyll Action

This action builds a Jekyll site an deploys it on github pages

Make sure that requirements such as `Gemfile` are up to date.

If there's an existing `build.sh` it will be executed to setup extra steps before 'building' with Jekyll the site (additional steps, other external programs, etc)

## Environment variables

- `GH_PAGES_BRANCH` (optional): override the default `gh-pages` deployment branch
