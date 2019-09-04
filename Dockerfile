FROM ruby:2.5.3
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs

# 作業ディレクトリの作成、設定
RUN mkdir /myapp
ENV APP_ROOT /myapp
WORKDIR $APP_ROOT

# Gemfileを追加する
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileからインストール
RUN bundle install
ADD . $APP_ROOT

