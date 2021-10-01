#! /bin/bash

apt-get update

curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -

echo "deb https://repos.influxdata.com/ubuntu bionic stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

apt-get update

apt-get install telegraf
systemctl start telegraf
systemctl enable telegraf