# FROM <IMAGE> 或者 <IMAGE>:<TAG>。作为基础镜像，必须位于第一条，as为构建阶段命名，可以通过--target=builder指定只构建此阶段
FROM node:12-alpine as builder

# 更新Alpine的软件源为国内（清华大学）的站点
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories

# RUN <command> (shell模式) 或者 RUN [ "executable", "param1", "param2" ] (exec模式)。构建时添加依赖
RUN apk update && apk upgrade && apk add --no-cache git python make openssl tar gcc

# 将文件或目录复制到Dockerfile构建的镜像中，类似ADD（包含了解压功能），源文件使用相对路径，目标路径使用绝对路径
COPY yapi.tgz /home

RUN cd /home && tar zxvf yapi.tgz && mkdir /app && mv /home/package /app/vendors

RUN cd /app/vendors && \
    npm install --production --registry https://registry.npm.taobao.org

# 多阶段构建，解决镜像层次多，镜像体积较大，部署时间变长，源代码存在泄露的风险
FROM node:12-alpine

RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories

# [可选] 安装curl
RUN apk update && apk upgrade && apk add --no-cache curl && rm -rf /var/cache/apk/*

LABEL email="huajiejin@qq.com"

# 设置环境变量，ENV <KEY> <VALUE> 或 ENV <KEY>=<VALUE>
ENV TZ="Asia/Shanghai" HOME="/"

# 设置容器内部工作目录，这样ENTRYPOINT和CMD指定的命令都会在容器中这个目录下进行
WORKDIR ${HOME}

# --from=0从上一阶段复制
COPY --from=builder /app/vendors /app/vendors

COPY config.json /app

# 指定运行该镜像的容器使用的端口，可以是多个。目的是告诉应用程序容器内应用程序会使用的端口。出于安全目的不会自动打开端口。运行时用-p映射
EXPOSE 3000

COPY docker-entrypoint.sh /app/
RUN chmod 755 /app/docker-entrypoint.sh

# 等待工具
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.7.3/wait /wait
RUN chmod +x /wait

# 类似CMD，指定运行的命令，docker run时如需覆盖用--entrypoint选项，有shell模式和exec模式
ENTRYPOINT ["sh", "-c", "/wait && /app/docker-entrypoint.sh"]
