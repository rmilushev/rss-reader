FROM ruby:2.6.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# https://github.com/nodesource/distributions#installation-instructions
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs

RUN mkdir /rss
WORKDIR /rss

COPY Gemfile /rss/Gemfile
COPY Gemfile.lock /rss/Gemfile.lock

RUN bundle install

ADD . /rss

CMD RAILS_ENV=${RAILS_ENV} bundle exec rails db:create db:migrate db:seed && bundle exec rails s -p ${PORT} -b '0.0.0.0'
