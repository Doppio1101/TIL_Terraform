#!/bin/bash

# 계정 추가
sudo useradd jhjang
sudo echo 'jhjang:Jhjang1101!!)!' | chpasswd

# root Password 수정 및 root 로그인 가능하도록 허용
# root 접속 허용하여 SSH 접속하여 재설정
sudo echo 'root:JHCorp!!01' | chpasswd
sudo sed -i 's/^#*PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

sudo systemctl restart sshd
