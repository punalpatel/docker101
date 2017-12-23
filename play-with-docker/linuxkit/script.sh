#!/bin/sh
#Install dependencies for the build
apt-get update
apt-get install apt-transport-https  ca-certificates curl software-properties-common build-essential git

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce

# Install Go
wget https://redirector.gvt1.com/edgedl/go/go1.9.2.linux-amd64.tar.gz
tar xvf go1.9.2.linux-amd64.tar.gz
chown -R root:root ./go
sudo mv go /usr/local
echo "export GOPATH=$HOME/work" >> ~/.profile
echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> ~/.profile
source ~/.profile

# Install Moby
go get -u github.com/moby/tool/cmd/moby

# Install Linux Kit
git clone https://github.com/linuxkit/linuxkit
cd ./linuxkit
make
make install
