FROM ruby:2.5-alpine3.10

WORKDIR /app

demo-rb:
  COPY ./Gemfile /app
  RUN bundle
  SAVE IMAGE demo-rb:latest

host:
  FROM +demo-rb
  COPY "./start_server.sh" "/app"
  COPY "./perform_request.rb" "/app"
  COPY "./perform_request.sh" "/app"
  COPY "./config.ru" "/app"
  ENV APP_HOST http://host:50190
  EXPOSE 50190
  ENV SELENIUM_REMOTE_URL 'http://selenium:4444/wd/hub'
  ENTRYPOINT ["./perform_request.sh"]

integration:
  FROM earthly/dind:alpine
  COPY ./docker-compose.earthly.yml /app/
  WITH DOCKER --compose /app/docker-compose.earthly.yml --load test:latest=+host
    RUN docker run --rm --network test-network --network-alias host -P test
  END