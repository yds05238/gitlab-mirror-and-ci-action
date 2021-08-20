FROM python:3.7-slim-buster

# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y netcat
RUN apt-get install -y build-essential curl jq 
# RUN apt install -y texlive-latex-base
# RUN apt-get install -y texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended 
# RUN apt install -y latexmk 

# RUN pip install --upgrade pip

LABEL "com.github.actions.name"="Mirror to GitLab and run GitLab CI"
LABEL "com.github.actions.description"="Automate mirroring of git commits to GitLab, trigger GitLab CI and post results back to GitHub"
LABEL "com.github.actions.icon"="git-commit"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/yds05238/gitlab-mirror-and-ci-action"
LABEL "homepage"="https://github.com/yds05238/gitlab-mirror-and-ci-action"
LABEL "maintainer"="yds05238 <jy392@cornell.edu>"

COPY entrypoint.sh /entrypoint.sh
COPY cred-helper.sh /cred-helper.sh
ENTRYPOINT ["/entrypoint.sh"]
