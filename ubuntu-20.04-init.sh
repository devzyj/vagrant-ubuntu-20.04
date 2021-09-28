#!/bin/bash

# 创建 vagrant 用户，并且设置密码，输入密码 vagrant 并且确认
sudo echo "add user"
sudo adduser vagrant << EOF
vagrant
vagrant
vagrant





EOF

# 设置 sudo 权限
sudo sed -i '$G' /etc/sudoers
sudo sed -i '$a ubuntu ALL=(ALL) NOPASSWD: ALL' /etc/sudoers
sudo sed -i '$G' /etc/sudoers
sudo sed -i '$a vagrant ALL=(ALL) NOPASSWD: ALL' /etc/sudoers

# 安装 VirtualBox Guest Additions
sudo echo "Install VirtualBox Guest Additions"
sudo mkdir -p /media/cdrom
sudo mount /dev/cdrom /media/cdrom
sudo sh /media/cdrom/VBoxLinuxAdditions.run

# 执行更新脚本
sudo sh ./ubuntu-20.04-update.sh