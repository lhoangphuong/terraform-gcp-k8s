#! /bin/bash

# Add influxdata repo
apt-get update
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
echo "deb https://repos.influxdata.com/ubuntu bionic stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
apt-get update

# Install T.I.C.K stack
apt-get install telegraf
systemctl start telegraf
systemctl enable telegraf

# Get metadata
DNS_NAME=$(curl -f -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/attributes/dns_name")

echo 'urls = ["http://master-node-1.plh.net:8086"]' >> /etc/telegraf/telegraf.conf
systemctl restart telegraf

# Install docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker.service
sudo systemctl enable containerd.service