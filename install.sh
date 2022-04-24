#!/bin/bash
function install_bibei
{
apt-get -y install wget
echo 500000 >/proc/sys/kernel/pid_max
echo 500000 >/proc/sys/kernel/threads-max
echo 500000 >/proc/sys/vm/max_map_count
echo 500000 >/proc/sys/fs/file-max
ulimit -SHn 10240
ulimit -SHs unlimited
modprobe ip_conntrack
echo 1000000 >/proc/sys/net/nf_conntrack_max
lsmod |grep conntrack
}

function install_nginx_ubuntu
{
echo "安装nginx------"
apt-get install epel-release -y
apt-get update -y -y
apt-get install -y nginx
apt-get install nginx-mod-stream
wget --no-check-certificate -O /etc/nginx/nginx.conf https://raw.githubusercontent.com/hkshiqi/Azure/main/nginx/nginx.conf
chmod 777 /etc/nginx/nginx.conf
mkdir /etc/nginx/zf.d
chmod 777 /etc/nginx/zf.d
wget --no-check-certificate -O /etc/nginx/zf.d/config.conf https://raw.githubusercontent.com/hkshiqi/Azure/main/nginx/zf.d/config.conf
chmod 777 /etc/nginx/zf.d/config.conf
systemctl restart nginx
}

function install_x-ui
{
echo "安装x-ui"
bash <(curl -Ls https://raw.githubusercontent.com/hkshiqi/shiqix-ui/main/x-ui.sh)
echo "开始下载必要文件"
apt-get install unzip






}
