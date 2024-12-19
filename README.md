
1. 获取网页内容
2. 正则表达式获取节点内容
```bash
(?<=data-snippet-clipboard-copy-content=").+(?="><pre>)
```
3. base64编码，写入文件
```bash
- name: Some name
  uses: RollyPeres/base64-to-path@v1
  with:
    filePath: ${{ github.workspace }}/somefile.someextension
    encodedString: ${{ secrets.SOME_GITHUB_SECRET }}
```
