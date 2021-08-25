FROM ruby:2.5-alpine3.10

WORKDIR /app
COPY ./Gemfile /app
RUN bundle
COPY "./start_server.sh" "/app"
COPY "./perform_request.rb" "/app"
COPY "./perform_request.sh" "/app"
COPY "./config.ru" "/app"
ENV APP_HOST http://integration:50190
EXPOSE 50190
ENV SELENIUM_REMOTE_URL 'http://selenium:4444/wd/hub'
ENTRYPOINT ["./perform_request.sh"]