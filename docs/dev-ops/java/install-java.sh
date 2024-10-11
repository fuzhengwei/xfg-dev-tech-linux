#!/bin/sh

# 定义JDK源文件和目标目录
JDK_SRC="/dev-ops/java/jdk-8u202-linux-x64.tar.gz"
JDK_DST="/usr/local/java"

# 检查JDK源文件是否存在
if [ ! -f "$JDK_SRC" ]; then
    echo "JDK 安装文件不存在: $JDK_SRC"
    exit 1
fi

# 创建目标目录
mkdir -p "$JDK_DST"

# 复制JDK压缩包到目标目录
cp "$JDK_SRC" "$JDK_DST"

# 进入目标目录
cd "$JDK_DST"

# 解压JDK压缩包
tar -zxvf "jdk-8u202-linux-x64.tar.gz"

# 获取解压后的JDK目录名称
JDK_DIR=$(tar -tzf "jdk-8u202-linux-x64.tar.gz" | head -1 | cut -f1 -d"/")

# 配置环境变量
echo "export JAVA_HOME=$JDK_DST/$JDK_DIR" >> /etc/profile
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> /etc/profile
echo "export CLASSPATH=\$JAVA_HOME/jre/lib/ext:\$JAVA_HOME/lib/tools.jar" >> /etc/profile

# 使环境变量立即生效
source /etc/profile

# 输出安装完成
echo "Java installation completed."

# 输出Java版本
java -version

# 结束脚本
exit 0