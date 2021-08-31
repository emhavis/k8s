#! /bin/bash
#
#
echo '----------------------------------------------------------------------------------'
echo 'This script will install below items'
echo "1. openssh server"
echo "2. docker.io"
echo "3. https curl"
echo "4. add source packages of kubernetes-xenial main"
echo '----------------------------------------------------------------------------------'
read -p "Please review the parameter and Press any key to continue or ctrl-C to cancel"
echo ""
echo ""
#
#
#
sudo apt-get install openssh-server
sudo apt-get update
sudo apt-get install -y docker.io
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
sudo -su root 
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
sudo cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" \
| sudo tee -a /etc/apt/sources.list.d/kubernetes.list \
&& sudo apt-get update
apt-get install -y kubelet kubeadm kubectl
exit
