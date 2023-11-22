[参考代码](https://github.com/vykes-mac/labalaba)
[使用 RethinkDB 构建应用程序](https://stackoverflow.com/questions/60875233/is-it-possible-for-a-flutter-application-to-use-rethinkdb)

### 运行步骤

1、[在 MacOS X 上安装 RethinkDB](https://rethinkdb.com/docs/install/osx/)

```
➜  ~ brew install rethinkdb
```

2、[启动 rethinkdb](https://www.cnblogs.com/sc912/p/14484788.html)
[RethinkDB 命令行选项](https://rethinkdb.com/docs/cli-options/)
让 rethinkdb 在后台运行，且关闭终端后持续运行;

```
➜  flutter_chat_app git:(main) ✗ sh start_rethinkdb.sh
start...
appending output to nohup.out
```

浏览器输入：http://127.0.0.1:8080/ 进行查看

3、启动 图片上传 Server
在 Server 文件夹下，

```
➜ server git:(main) ✗ npm i
➜ server git:(main) ✗ node app.js
Started file uploader server on port 3000

```
