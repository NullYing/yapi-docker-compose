# yapi-docker-compose

## 简介

使用docker-compose一键部署yapi

- 优点
  - 基于node alpine版本，且使用了多阶段构建，体积小
  - 使用了[wait](https://github.com/ufoscout/docker-compose-wait)，能确保启动顺序正确
  - 使用volumes加载配置，修改配置更灵活

## 使用

- `git clone git@github.com:huajiejin/yapi-docker-compose.git`
- [可选的] 编辑配置 `vi config.json`
- [可选的] 下载指定的yapi版本
  - `wget -c -O yapi.tgz http://registry.npm.taobao.org/yapi-vendor/download/yapi-vendor-1.9.1.tgz`
- `docker-compose up -d`
- 访问 http://localhost:3000
- [可选的] 配置Nginx反向代理，参考[nginx.conf](./nginx.conf)

## 感谢

- [YApi](https://github.com/YMFE/yapi)
- [使用 alpine 版 docker 镜像快速部署 yapi](https://www.jianshu.com/p/a97d2efb23c5)
- [使用DockerCompose构建部署Yapi](https://github.com/MyHerux/daily-code/blob/master/Program/%E5%B7%A5%E5%85%B7%E7%AF%87/Yapi/%E4%BD%BF%E7%94%A8DockerCompose%E6%9E%84%E5%BB%BA%E9%83%A8%E7%BD%B2Yapi.md)
- [Dockerfile 详解](https://zhuanlan.zhihu.com/p/79142391)
- [Docker —— 从入门到实践](https://yeasy.gitbook.io/docker_practice/)

## License

[MIT](http://opensource.org/licenses/MIT)

Copyright (c) 2020-present, Huajie (Jay) Jin
