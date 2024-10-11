#!/bin/bash

# 定义变量
TARGET_DIR="/usr/local/maven"
MAVEN_DIR_NAME="apache-maven-3.8.8"
MAVEN_HOME="$TARGET_DIR/$MAVEN_DIR_NAME"

# 删除 Maven 目录
if [ -d "$MAVEN_HOME" ]; then
    rm -rf "$MAVEN_HOME"
    echo "Maven directory $MAVEN_HOME has been removed."
else
    echo "Maven directory $MAVEN_HOME does not exist."
fi

# 备份 /etc/profile
cp /etc/profile /etc/profile.bak

# 从 /etc/profile 中移除 Maven 环境变量
sed -i '/MAVEN_HOME/d' /etc/profile
sed -i '/$MAVEN_HOME\/bin/d' /etc/profile

# 重新加载 /etc/profile
source /etc/profile

# 输出卸载完成信息
echo "Maven has been uninstalled."
