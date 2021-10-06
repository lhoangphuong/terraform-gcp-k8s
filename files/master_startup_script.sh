#! /bin/bash


# Add influxdata repo
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
echo "deb https://repos.influxdata.com/ubuntu bionic stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
apt-get -y update 


# Install T.I.C.K stack
apt-get -y install telegraf influxdb kapacitor chronograf
systemctl start telegraf influxdb kapacitor chronograf
systemctl enable telegraf influxdb kapacitor chronograf


# Install docker
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get -y update
apt-get -y install docker-ce docker-ce-cli containerd.io
systemctl enable docker.service
systemctl enable containerd.service
usermod -aG docker plh_gcp_k8s # Default: sudo usermod -aG docker $USER
newgrp docker


# Install kubeadm
## Letting iptables see bridged traffic
modprobe br_netfilter
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
echo 1 > /proc/sys/net/ipv4/ip_forward
sudo sysctl --system

## Installing kubeadm, kubelet and kubectl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

## Configure container runtimes
cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF
systemctl enable docker
systemctl daemon-reload
systemctl restart docker

kubeadm init --pod-network-cidr=192.168.0.0/16 # create k8s cluster using adm

# apply k8s configs for root
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u ):$(id -g) $HOME/.kube/config

# apply k8s configs for default user
mkdir -p /home/plh_gcp_k8s/.kube
cp -i /etc/kubernetes/admin.conf /home/plh_gcp_k8s/.kube/config
chown -R $(id -u plh_gcp_k8s):$(id -g plh_gcp_k8s) /home/plh_gcp_k8s/.kube

# install Calico - Container Network Interface (CNI) based Pod network add-on
kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml
kubectl create -f https://docs.projectcalico.org/manifests/custom-resources.yaml

wall """
Run below command on k8s worker nodes to join them into the cluster:
kubeadm token create --print-join-command
"""