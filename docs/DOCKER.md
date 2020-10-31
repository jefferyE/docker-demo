# 指定基础镜像及版本，不设置默认:latest
FROM node:10.16.3

# 设置环境变量
ENV NAME World

# 将当前文件夹下的哪些文件添加到镜像中，.代表所有文件，可以在dockerignore文件中设置忽略文件，类似于gitignore
ADD . /app/

# 将当前目录下的所有文件复制到容器的/app中
COPY . /app/

# 向外暴露的端口号
EXPOSE 3000

# 设置容器的工作目录为/app(当前目录，如果/app不存在，WORKDIR会创建/app文件夹)
WORKDIR /app

# 运行的脚本命令（每一个指令都会执行一个镜像，多个命令会导致包过大，考虑将命令串联）
# Docker映像通常由多层组成，并且每一层基本上都是只读文件系统。 这种工作方式是，Docker为在Dockerfile中找到的每条指令创建一个层，并将其放置在先前层的顶部。 放置经常更改的应用程序代码靠近文件底部被认为是一种好习惯。
RUN npm install && npm run build

# 执行的CMD命令，容器启动运行时执行的命令
CMD ["node", "start"]

# 配置docker命令


#### RUN 与 CMD 区别参考 DIFF.md 说明