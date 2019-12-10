FROM ruby:2.5.3
RUN curl -sL https://deb.nodesource.com/setup_10.x | \
    bash - && apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs

# MySQLをrootで実行する設定に書き換える
RUN sed -e 's/^ *user *= *mysql$/user = root/' -i /etc/mysql/my.cnf

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

