在创建Dockerfile的时候，RUN和CMD都是很重要的命令。它们各自的作用分别如下：

### RUN
RUN命令是创建Docker镜像（image）的步骤，RUN命令对Docker容器（ container）造成的改变是会被反映到创建的Docker镜像上的。一个Dockerfile中可以有许多个RUN命令。

### CMD
CMD命令是当Docker镜像被启动后Docker容器将会默认执行的命令。一个Dockerfile中只能有一个CMD命令。通过执行docker run $image $other_command启动镜像可以重载CMD命令。