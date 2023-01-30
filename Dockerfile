FROM ruby:3.2.0-alpine
LABEL maintainer="georg@ledermann.dev"

WORKDIR /senec-importer

COPY Gemfile* /senec-importer/
RUN bundle config --local frozen 1 && \
    bundle config --local without 'development test' && \
    bundle install -j4 --retry 3 && \
    bundle clean --force

COPY . /senec-importer/

ENTRYPOINT bundle exec src/main.rb
