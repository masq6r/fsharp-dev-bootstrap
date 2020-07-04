FROM mcr.microsoft.com/dotnet/core/sdk:3.1-bionic

ARG USERNAME=fsharp
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN sed -i "s/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list \
    && apt-get clean \
    && apt-get -y update \
    # Add sudo support for the non-root user
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    # Add some tools
    && apt-get -y install curl \
    && apt-get -y install wget \
    && apt-get -y install software-properties-common \
    && apt-get -y install apt-utils \
    && apt-get -y install zsh \
    && apt-get -y install inetutils-ping \
    && apt-get -y install net-tools \
    # MariaDB client tool installation
    && apt-get -y install mariadb-client \
    # Git installation
    && apt-get -y install git \
    # Python3 installation
    && apt-get -y install python3 \
    && apt-get -y install python3-pip \
    # Node.js & Yarn installation
    && curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
    && apt-get -y install nodejs \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get -y update \
    && apt-get -y install yarn \
    # Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # SSH setup
    && mkdir /home/$USERNAME/.ssh \
    && ssh-keyscan github.com >> /home/$USERNAME/githubkey \
    && echo `cat /home/$USERNAME/githubkey` >> /home/$USERNAME/.ssh/known_hosts \
    && chmod 600 /home/$USERNAME/.ssh/known_hosts \
    && chmod 700 /home/$USERNAME/.ssh \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh \
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm /home/$USERNAME/githubkey \
    && rm -rf /var/lib/apt/lists/*

# Script to run when container is up
COPY init.sh /home/$USERNAME/
COPY paket.dependencies /home/$USERNAME/
COPY package.json /home/$USERNAME/
COPY webpack.config.web-dev.js /home/$USERNAME/
COPY webpack.config.web.js /home/$USERNAME/

USER $USERNAME   