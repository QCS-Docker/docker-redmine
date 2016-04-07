# docker-redmine


### 在SQLite3中运行
```sh
docker run --name some-redmine -d slsay/docker-redmine
```

### 在MySQL中运行
#### 1.启动MySQL
```sh
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=redmine -d slsay/docker-mysql
```
#### 2. 运行redmine
```sh
docker run --name some-redmine --link some-mysql:mysql -p 3000:3000 -d slsay/docker-redmine
```

### 登录容器
```sh
docker exec -it some-redmine bash
```
