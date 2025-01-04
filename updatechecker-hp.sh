#!/bin/sh

# 定义变量
REMOTE_FILE_URL="https://raw.dgithub.xyz/ATang007ZH/freenode/refs/heads/main/freenode-base64" # 远程文件URL
LOCAL_FILE_PATH="/etc/homeproxy/LatestUpdate"                    # 本地文件路径
COMPARE_TOOL="md5sum"                                        # 比较工具，例如：md5sum, sha256sum等
#进行节点更新
SCRIPTS_DIR="/etc/homeproxy/scripts"                 # 要执行的命令或脚本路径


# 获取远程文件并保存为临时文件
TEMP_FILE_PATH=$(mktemp)
wget -q -O "$TEMP_FILE_PATH" "$REMOTE_FILE_URL"

# 如果下载成功则继续
if [ $? -eq 0 ]; then
    # 计算两个文件的哈希值并进行比较
    LOCAL_HASH=$($COMPARE_TOOL "$LOCAL_FILE_PATH" | cut -d ' ' -f 1)
    REMOTE_HASH=$($COMPARE_TOOL "$TEMP_FILE_PATH" | cut -d ' ' -f 1)

    # 如果哈希值不同，则执行命令
    if [ "$LOCAL_HASH" != "$REMOTE_HASH" ]; then
        "$SCRIPTS_DIR"/update_subscriptions.uc
        
        # 可选：更新本地文件（如果你希望用新的远程文件替换旧的本地文件）
        mv "$TEMP_FILE_PATH" "$LOCAL_FILE_PATH"
    else
        echo "No changes detected."
    fi
    
    # 清理临时文件（仅当没有移动该文件来更新本地文件时需要）
    [ -f "$TEMP_FILE_PATH" ] && rm -f "$TEMP_FILE_PATH"
else
    echo "Failed to download the remote file."
fi
