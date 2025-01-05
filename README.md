ssh登录



上传updatechecker.sh到目录
/etc/homeproxy/scripts/
赋予执行权限


openwrt里添加计划任务
*/5 * * * * /etc/homeproxy/scripts/updatechecker-hp.sh

