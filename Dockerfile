ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION

ARG SOLARGRAPH_VERSION
ENV SOLARGRAPH_VERSION=$SOLARGRAPH_VERSION

WORKDIR /app

COPY Gemfile .
RUN bundle install

EXPOSE 7658
