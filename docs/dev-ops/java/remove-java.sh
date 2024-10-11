#!/bin/sh

# 定义JDK目标目录
JDK_DST="/usr/local/java"

# 获取JDK目录名称
if [ -d "$JDK_DST" ]; then
    JDK_DIR=$(ls "$JDK_DST" | grep 'jdk' | head -n 1)
else
    echo "JDK 目录不存在: $JDK_DST"
    exit 1
fi

# 删除JDK目录
echo "正在删除JDK目录..."
rm -rf "$JDK_DST/$JDK_DIR"

# 检查是否删除成功
if [ -d "$JDK_DST/$JDK_DIR" ]; then
    echo "JDK 目录删除失败."
    exit 1
else
    echo "JDK 目录已删除."
fi

# 移除环境变量配置
echo "正在移除环境变量配置..."
sed -i '/JAVA_HOME/d' /etc/profile
sed -i '/CLASSPATH/d' /etc/profile

# 重新加载环境变量
source /etc/profile

# 输出卸载完成
echo "Java remove completed."

# 结束脚本
exit 0
