# 起動方法

```
$ git clone https://github.com/sora33/rails-docker-mysql.git
$ cd rails-docker-mysql
$ docker-compose build
$ docker-compose up -d
```

初回起動の際には別タブを開いて以下のコマンドを実行する

```
$ docker-compose run app rails db:create
```

# Railsコンテナに入る

```
$ docker-compose exec -it app bash
```

# MySQLコンテナに入いる

```
$ docker-compose exec -it db bash
```
