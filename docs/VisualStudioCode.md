# Dockerfile 配置修改
- 修改 Dockerfile 中的 CMD 为 package.json 中的 scripts 命令
- CMD ["npm", "run", "debug"]

# 新增 scripts 命令
- scripts中新增 "debug": "node --inspect=0.0.0.0 app.js""

# 重新打包 docker 镜像
```cmd
  npm run docker:build
```
*** 只针对此项目，package.json 中配置了该命令 ***

# 启动 docker 容器
*** 启用Visual Studio Code调试，还必须转发端口9229 ***
```cmd
  npm run docker:debug
```
*** 只针对此项目，package.json 中配置了该命令 ***
*** docker container run -p 8000:3000 -p 9229:9229 -t docker/koa-server ***

# 配置 launch.json 文件
- 打开它，请按Command+Shift+P ，然后选择“ Debug: Open launch.json
- 用以下代码片段替换launch.json文件的内容：

```cmd
{
  "version" : "0.2.0" ,
  "configurations" : [
      {
          "name" : "Docker: Attach to Node" ,
          "type" : "node" ,
          "request" : "attach" ,
          "port" : 9229,
          "address" : "localhost" ,
          "localRoot" : " ${workspaceFolder} " ,
          "remoteRoot" : "/app" , // 根据实际情况修改
          "protocol" : "inspector" ,
          "skipFiles" : [  // 使用skipFiles属性来避免单步执行node_modules目录和Node.js的内置核心模块中的代码
            " ${workspaceFolder} /node_modules/**/*.js" ,
            "<node_internals>/**/*.js"
          ]
      }
  ]
}
```

- 输入Shift+Command+D切换到“ Debug视图。 然后，单击“ Debug and Run按钮
- 切换到浏览器窗口，然后刷新重新加载页面