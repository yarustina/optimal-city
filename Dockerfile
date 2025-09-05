FROM ruby:3.3.1 AS builder

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs yarn && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v 2.6.3 && \
    bundle config set deployment true && \
    bundle config set path 'vendor/bundle' && \
    bundle install --jobs 4 --retry 3

COPY . .

FROM ruby:3.3.1

RUN apt-get update -qq && \
    apt-get install -y libpq-dev nodejs yarn && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=builder /app /app

ENV RAILS_ENV=production
ENV PORT=3000
ENV BUNDLE_PATH=/app/vendor/bundle

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]


