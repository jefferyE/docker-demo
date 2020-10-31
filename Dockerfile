# 指定基础镜像node及版本10.16.3
FROM node:10.16.3

# 设置环境变量
ENV NODE_ENV production

# 设置容器的工作目录为/app
WORKDIR /app

# 把 package.json package-lock.json 复制到/app目录下，为了npm install可以缓存
COPY package*.json /app

# 运行的脚本命令（每一个指令都会执行一个镜像，多个命令会导致包过大，考虑将命令串联）
RUN npm install --registry=https://registry.npm.taobao.org

COPY . /app

# 执行的CMD命令，容器启动运行时执行的命令
# CMD ["node", "index.js"]
# CMD ["npm", "start"]
CMD ["npm", "run", "debug"]

# 向外暴露的端口号
EXPOSE 3000
