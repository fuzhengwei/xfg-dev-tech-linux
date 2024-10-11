#!/bin/bash

# 定义变量
SOURCE_ZIP="/dev-ops/maven/apache-maven-3.8.8.zip"
TARGET_DIR="/usr/local/maven"
MAVEN_DIR_NAME="apache-maven-3.8.8"
MAVEN_HOME="$TARGET_DIR/$MAVEN_DIR_NAME"

# 确保目标目录存在
mkdir -p $TARGET_DIR

# 复制zip文件到目标目录
cp $SOURCE_ZIP $TARGET_DIR

# 进入目标目录
cd $TARGET_DIR

# 解压缩文件
unzip $SOURCE_ZIP

# 配置环境变量并写入到 /etc/profile
echo "export MAVEN_HOME=$MAVEN_HOME" >> /etc/profile
echo 'export PATH=$PATH:$MAVEN_HOME/bin' >> /etc/profile

# 使环境变量配置立即生效
source /etc/profile

# 输出安装完成信息
echo "Maven installation completed."

# 显示Maven版本
mvn -version
