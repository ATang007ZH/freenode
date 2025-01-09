#!/bin/sh

# 定义变量
REMOTE_FILE_URL="https://raw.dgithub.xyz/ATang007ZH/freenode/refs/heads/main/freenode-base64" # 远程文件URL
LOCAL_FILE_PATH="/etc/LatestUpdate"                    # 本地文件路径
COMPARE_TOOL="md5sum"                                  # 比较工具，例如：md5sum, sha256sum等
SUBSCRIBE_SCRIPT_PATH="/usr/share/passwall/subscribe.lua" # 订阅脚本路径

# 创建临时文件并清理函数
cleanup() {
    [ -f "$TEMP_FILE_PATH" ] && rm -f "$TEMP_FILE_PATH"
}

trap 'cleanup; exit' EXIT INT TERM

# 获取远程文件并保存为临时文件
TEMP_FILE_PATH=$(mktemp)
if ! wget -q -O "$TEMP_FILE_PATH" "$REMOTE_FILE_URL"; then
    echo "Failed to download the remote file."
    exit 1
fi

# 如果本地文件不存在，则直接进行后续处理
if [ ! -f "$LOCAL_FILE_PATH" ]; then
    touch "$LOCAL_FILE_PATH"
fi

# 计算两个文件的哈希值并进行比较
LOCAL_HASH=$($COMPARE_TOOL "$LOCAL_FILE_PATH" | awk '{print $1}')
REMOTE_HASH=$($COMPARE_TOOL "$TEMP_FILE_PATH" | awk '{print $1}')

# 如果哈希值不同，则执行订阅更新
if [ "$LOCAL_HASH" != "$REMOTE_HASH" ]; then
    if lua "$SUBSCRIBE_SCRIPT_PATH" start > /dev/null 2>&1 &; then
        mv "$TEMP_FILE_PATH" "$LOCAL_FILE_PATH"
        echo "Node update completed."
    else
        echo "Failed to execute subscription update."
        exit 1
    fi
else
    echo "No changes detected."
fi
