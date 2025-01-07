ssh登录



上传updatechecker-hp.sh到目录
/etc/homeproxy/scripts/
赋予执行权限


openwrt里添加计划任务
*/15 * * * * /etc/homeproxy/scripts/updatechecker-hp.sh

