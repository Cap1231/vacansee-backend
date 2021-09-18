FROM ruby:3.0

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev nodejs

WORKDIR /myapp

COPY ["Gemfile", "Gemfile.lock", "./"]
RUN bundle install

COPY . .

# 特定のserver.pidファイルが存在するときにサーバーが再起動しないようにするRails固有の問題を修正するエントリポイントスクリプトを提供します。
# このスクリプトは、コンテナが開始されるたびに実行されます。
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
