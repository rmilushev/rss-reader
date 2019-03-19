# README

This is a basic implementation of RSS reader in Ruby on Rails.

* Ruby version: 2.6.0

* Ruby on Rails 5.2, PostgresSQL, Bootstrap 4

* Run the test suite: `bin/rspec`

 Docker configuration:
  1. Add `.env` file, for example:

         RAILS_ENV="development"
         PORT=3000
         DATABASE_URL="postgres://postgres@db:5432/rss?encoding=utf8&pool=5&timeout=5000"

  2. `docker-compose build`
  3. `docker-compose run web rails db:create db:migrate`
  4. `docker-compose up`

  Then the application is expected to run on `localhost:3000`.
