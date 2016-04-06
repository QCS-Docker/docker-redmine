# docker-redmine


### 在SQLite3中运行
```sh
docker run -d --name some-redmine slsay/docker-redmine
```

### 在MySQL中运行
#### 1.启动MySQL
```sh
docker run -d --name some-mysql -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=redmine slsay/docker-mysql
```
#### 2. 运行redmine
```sh
docker run -d --name some-redmine --link some-mysql:slsay/docker-mysql slsay/docker-redmine
```
