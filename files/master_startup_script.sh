#! /bin/bash

# Add influxdata repo
apt-get update
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
echo "deb https://repos.influxdata.com/ubuntu bionic stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
apt-get update

# Install T.I.C.K stack
apt-get install telegraf influxdb kapacitor chronograf
systemctl start telegraf influxdb kapacitor chronograf
systemctl enable telegraf influxdb kapacitor chronograf

