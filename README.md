# yapi-docker-compose

## 简介

使用 docker-compose 一键部署 YApi

- 优点
  - 体积小：基于 node alpine 版本，且使用了多阶段构建
  - 安全：本地编译 YApi 镜像
  - 使用简单：下载后一键启动即可
  - 能确保启动顺序正确：使用了[docker-compose-wait](https://github.com/ufoscout/docker-compose-wait)
  - 修改配置更灵活：使用 volumes 挂载 YApi config.json
  - 数据备份恢复简单：使用 volumes 挂载 MongoDB 数据卷

## 使用

- **1. 下载** `git clone git@github.com:huajiejin/yapi-docker-compose.git && cd yapi-docker-compose`
- [可选的] 编辑配置 `vi config.json`
- [可选的] 使用指定的 YApi 版本，下载并替换 yapi.tgz 文件后构建即可 `wget -c -O yapi.tgz http://registry.npm.taobao.org/yapi-vendor/download/yapi-vendor-1.9.1.tgz`
- **2. 启动** `docker-compose up -d`
- 访问 http://localhost:3000
- [可选的] 配置 Nginx 反向代理，参考[nginx.conf](./nginx.conf)

## 感谢

- [YApi](https://github.com/YMFE/yapi)
- [使用 alpine 版 docker 镜像快速部署 yapi](https://www.jianshu.com/p/a97d2efb23c5)
- [使用DockerCompose构建部署Yapi](https://github.com/MyHerux/daily-code/blob/master/Program/%E5%B7%A5%E5%85%B7%E7%AF%87/Yapi/%E4%BD%BF%E7%94%A8DockerCompose%E6%9E%84%E5%BB%BA%E9%83%A8%E7%BD%B2Yapi.md)
- [Dockerfile 详解](https://zhuanlan.zhihu.com/p/79142391)
- [Docker —— 从入门到实践](https://yeasy.gitbook.io/docker_practice/)

## License

[MIT](http://opensource.org/licenses/MIT)

Copyright (c) 2020-present, Huajie (Jay) Jin
