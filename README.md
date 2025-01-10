updatechecker-pw.sh是passwall用的
----------------------------------------------


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
