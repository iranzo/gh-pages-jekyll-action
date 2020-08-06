#!/bin/bash

set -e

echo "REPO: $GITHUB_REPOSITORY"
echo "ACTOR: $GITHUB_ACTOR"

echo '=================== Prepare bundle ==================='
chmod 777 /github/workspace/

touch /github/workspace/${SOURCE_FOLDER:=.}/Gemfile.lock
chmod 666 /github/workspace/${SOURCE_FOLDER:=.}/Gemfile.lock


mkdir -p /github/workspace/${SOURCE_FOLDER:=.}/.jekyll-cache
chmod 777 /github/workspace/${SOURCE_FOLDER:=.}/.jekyll-cache

mkdir -p /github/workspace/_site
chmod 777 /github/workspace/_site

bundle install

if [ -f build.sh ]; then
    echo '=================== Running extra setup ==================='
    bash build.sh
fi

# Get  into source folder
cd ${SOURCE_FOLDER:=.}

echo '=================== Build site ==================='
bundle exec jekyll build -s ${SOURCE_FOLDER}

echo '=================== Publish to GitHub Pages ==================='
cd _site
remote_repo="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
remote_branch=${GH_PAGES_BRANCH:=gh-pages}
git init
git remote add deploy "$remote_repo"
git checkout $remote_branch || git checkout --orphan $remote_branch
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add .
echo -n 'Files to Commit:' && ls -l | wc -l
timestamp=$(date +%s%3N)
git commit -m "[ci skip] Automated deployment to GitHub Pages on $timestamp"
git push deploy $remote_branch --force
rm -fr .git
cd ../
echo '=================== Done  ==================='
