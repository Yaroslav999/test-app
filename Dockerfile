# Вибираємо базовий образ з Ruby
FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.5.23
RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
