FROM ruby:2.5.3

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - &&\
    apt-get update -qq &&\
    apt-get install -y nodejs

# Configuring main directory
RUN mkdir -p /jwt_auth_api
WORKDIR /jwt_auth_api

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
ENV BUNDLER_VERSION 2.0.1
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Adding project files
EXPOSE 3000

