ssh登录
#进入homeproxy目录
cd /etc/homeproxy
#新建空文件
touch LatestUpdate


上传updatechecker.sh到目录
/etc/homeproxy/scripts/
赋予执行权限


openwrt里添加计划任务
*/5 * * * * /etc/homeproxy/scripts/updatechecker.sh

