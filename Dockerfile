FROM ruby:3.2.2-slim-buster

ARG RAILS_MASTER_KEY

ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

ENV RAILS_ENV production
ENV NODE_ENV production
ENV RAILS_ROOT /usr/src/app
ENV EDITOR vim

RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential \
    pkg-config \
    gnupg2 \
    wget \
    unzip \
    cmake \
    vim \
    libgtk2.0-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log \
  && mkdir -p /usr/local/share/fonts \
  && cd /usr/local/share/fonts \
  && wget https://storage.googleapis.com/mitas-dev-pub/fonts/kalpurush-unicode-bangla-font.zip \
  && unzip kalpurush-unicode-bangla-font.zip \
  && rm kalpurush-unicode-bangla-font.zip \
  && gem update --system \
  && gem install bundler \
  && bundle config set --global force_ruby_platform true

WORKDIR $RAILS_ROOT

COPY Gemfile* ./
RUN bundle install

COPY . $RAILS_ROOT
