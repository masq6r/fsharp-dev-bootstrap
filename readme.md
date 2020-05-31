# F# 开发环境

> F#的容器化开发环境设置工具。本工具需要配合Visual Studio Code使用。容器宿主必须是Linux。

## 使用方法

1. 安装VSCode Remote Development插件。
2. 开启`ssh-agent`服务，并`ssh-add`私有密钥。
3. 设置`git`的`user.email`和`user.name`。
4. 如果开发环境在远程主机上，VSCode配置`docker.host`字段: `"docker.host": "ssh://your-remote-user@your-remote-machine-fqdn-or-ip-here"`。
5. 在需要运行开发环境容器的机器上安装`docker`及`docker-compose`。
6. 打开本项目，并选择Remote Containers: Open in container，等待开发环境设置完毕。