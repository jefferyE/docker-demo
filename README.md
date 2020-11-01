# docker 配置文件（必须）
- 根目录下新增 Dockerfile 文件，用来配置 docker，具体参数请参考 /docs/DOCKER.md 文件
*** 配置文件 Dockerfile 必须大写开头，否则无法打包镜像 ***

# docker 文件忽略配置（可选）
- 根目录下新增 dockerignore 文件，用来配置 docker 打包镜像时忽略的文件，类似于 gitignore

# docker 镜像打包
```cmd
  docker image build -t docker/koa-server .
```

# docker 容器启动
```cmd
  docker container run -p 8000:3000 -t docker/koa-server --rm
```
*** 每次运行都会重新创建一个容器，如果需要对同一个容器操作，请使用 `docker start/restart <id>` 命令 ***
*** 可增加-d参数，指定容器后台运行 ***

# 停止 docker
```cmd
  docker stop/kill <id>
```

# 重启 docker
```cmd
  docker start/restart <id>
```