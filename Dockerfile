FROM ruby:3.2.2-alpine3.18

ENV BUILD_PACKAGES="build-base bash postgresql-dev gcompat libssl1.1" \
  DEV_PACKAGES="curl tzdata vim git htop" \
  RUBY_PACKAGES="" \
  PAGER="more"

RUN apk update && \
  apk upgrade && \
  apk add --update\
  $BUILD_PACKAGES \
  $DEV_PACKAGES \
  $RUBY_PACKAGES && \
  rm -rf /var/cache/apk/*

RUN gem update --system && gem install bundler:2.5.4

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile* ./
RUN bundle install -j4

COPY . ./

CMD bash -c "rm -rf tmp/pids/server.pid && bundle exec rails db:migrate && bundle exec rails s -p 80 -b '0.0.0.0'"

