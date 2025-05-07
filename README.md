passwall使用建议:


	节点订阅，添加
		备注：myfreenode
		网址：https://raw.dgithub.xyz/ATang007ZH/freenode/refs/heads/main/freenode-base64
		开启自动更新订阅：勾选
		更新模式：循环
		更新间隔：1小时
		订阅网址访问方式：直连	【不要选自动，会用代理，导致无法更新】

	规则列表，直连列表，添加: dgithub.xyz




	【配置多节点自动切换：】
	1、基本设置，Socks配置，添加
		第一个节点，选最好的的节点
		Socks 监听端口：1081
		自动切换：勾选
		多久检测一次：60
		超时秒数：5
		超时重试次数：5
		【注意以上  超时秒数 * （超时重试次数+1）要小于于  60(多久检测一次)  ，否则永远不会超时】

		备用节点的列表，选上其他节点
		恢复切换：勾选
		探测网址：YouTube

	2、节点列表，添加
		节点备注：mynode-auto
		类型：Socks
		地址：127.0.0.1
		端口：1081	【参考上面的】

	3、基本设置，主要，TCP节点，选刚刚添加的节点：Socks：[mynode-auto] 127.0.0.1:1081
	【配置多节点自动切换：配置完成】
  

updatechecker-pw.sh是passwall用的
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
