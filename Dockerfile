FROM jekyll/jekyll

LABEL "com.github.actions.name"="Jekyll for GitHub Pages"
LABEL "com.github.actions.description"="Builds and deploys the Jekyll project to GitHub Pages"
LABEL "com.github.actions.icon"="home"
LABEL "com.github.actions.color"="red"

LABEL "Name"="Jekyll for GitHub Pages"
LABEL "Version"="0.0.1"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
