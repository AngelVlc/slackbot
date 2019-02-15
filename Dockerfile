FROM ruby:2.6.1

RUN bundle config --global frozen 1

ENV APP /bot
RUN mkdir -p $APP

COPY Gemfile Gemfile.lock $APP/
RUN gem install bundler:2.0.1
COPY . $APP

WORKDIR $APP
RUN bundle install
