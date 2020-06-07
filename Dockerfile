FROM ruby:2.7-alpine

RUN apk update && \
    apk add build-base libc-dev git

RUN gem update bundler

RUN mkdir /data
WORKDIR /data
COPY Gemfile* ./
ENV BUNDLE_JOBS=4
RUN bundle install
COPY . ./

CMD ["bundle", "exec", "rackup"]