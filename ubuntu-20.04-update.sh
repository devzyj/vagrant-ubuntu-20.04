#!/bin/bash

# 更新软件
sudo echo "apt update"
sudo apt-get update

# 设置 Vagrant SSH 公钥
sudo echo "Set Vagrant SSH"
sudo rm -rf /home/vagrant/.ssh/authorized_keys
sudo mkdir -p /home/vagrant/.ssh
###sudo wget --no-check-certificate https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/authorized_keys
sudo echo "ssh-rsa \
AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8\
+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8\
HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0j\
MZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehU\
c9c9WhQ== vagrant insecure public key" > /home/vagrant/.ssh/authorized_keys
sudo chmod 700 /home/vagrant/.ssh
sudo chmod 600 /home/vagrant/.ssh/authorized_keys
sudo chown -R vagrant:vagrant /home/vagrant/.ssh

# 磁盘整理
sudo echo "dd if=/dev/zero of=/EMPTY bs=1M"
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY

# 清除安装缓存
sudo echo "apt-get clean"
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*
sudo rm -rf /tmp/*