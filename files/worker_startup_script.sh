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