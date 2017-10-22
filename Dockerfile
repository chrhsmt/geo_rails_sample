FROM ruby:2.2.3

# 必要なライブラリインストール 
# libpq-dev
RUN apt-get update -qq && apt-get install -y build-essential

# ワークディレクトリ設定
ENV ROOT_PATH /app
RUN mkdir $ROOT_PATH
WORKDIR $ROOT_PATH
ADD Gemfile $ROOT_PATH/Gemfile
ADD Gemfile.lock $ROOT_PATH/Gemfile.lock
RUN bundle install
ADD . $ROOT_PATH
