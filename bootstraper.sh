#!/bin/bash
TZ=Europe/Athens && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
apt install -y nano tar wget lz4 zip jq runit build-essential git make gcc nvme-cli htop tmux bash-completion vim curl
runsvdir -P /etc/service &
wget https://go.dev/dl/go1.20.1.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.20.1.linux-amd64.tar.gz
PATH=$PATH:/usr/local/go/bin
echo $PATH
go version
sleep 2
echo 'export PATH='$PATH:/usr/local/go/bin >> /root/.bashrc
go version
if [[ -n $SSH_PASS ]]
then 
apt install -y ssh
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && (echo ${SSH_PASS}; echo ${SSH_PASS}) | passwd root && service ssh restart
fi