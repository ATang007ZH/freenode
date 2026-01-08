passwall使用建议:


	节点订阅，添加
		备注：myfreenode
		网址：https://raw.bgithub.xyz/ATang007ZH/freenode/refs/heads/main/freenode-base64
		开启自动更新订阅：勾选
		更新模式：循环
		更新间隔：1小时
		订阅网址访问方式：直连	【不要选自动，会用代理；直连里添加bgithub.xyz，否则会自动走代理导致无法更新。】

	规则列表，直连列表，添加: dgithub.xyz




	【配置多节点自动切换：】设置方法: https://github.com/ATang007ZH/Action-237-immortalwrt-mt798x-24.10/discussions/16 
	
  

~~updatechecker-pw.sh是passwall用的~~
----------------------------------------------
passwall新版代码已改进为先检测，有变化才执行更新。
且本身支持每小时更新。

所以passwall可以不用此代码了。

2025-1-13



updatechecker-hp.sh是homeproxy用的
----------------------------------------------
updatechecker-hp.sh使用方法：（-pw的类似）

ssh登录



上传updatechecker-hp.sh到目录：

/etc/homeproxy/scripts/

赋予执行权限

chmod +x /etc/homeproxy/scripts/updatechecker-hp.sh

openwrt里

添加计划任务：

*/15 * * * * /etc/homeproxy/scripts/updatechecker-hp.sh


备份，配置，里添加此文件：

/etc/homeproxy/scripts/updatechecker-hp.sh
