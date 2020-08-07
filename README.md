# GitHub Pages Jekyll Action

This action builds a Jekyll site and deploys it on github pages

Make sure that requirements such as `Gemfile` are up to date.

If there's an existing `build.sh` it will be executed to set up extra steps before 'building' with Jekyll the site (additional steps, other external programs, etc)

## Environment variables

- `GH_PAGES_BRANCH` (optional): override the default `gh-pages` deployment branch
- `SOURCE_FOLDER` (optional): override the default `./` folder for building the site
