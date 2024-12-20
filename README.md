
1. curl获取网页内容
2. 正则表达式过滤获取节点内容
```bash
(?<=data-snippet-clipboard-copy-content=").+(?="><pre>)
```
3. base64编码，写入文件
4. 发布到当前Repositories根目录中
