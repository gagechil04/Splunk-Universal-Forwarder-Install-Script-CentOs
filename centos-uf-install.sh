#!/bin/bash

## Downloading the Splunk Universal Forwarder Software
cd /tmp &&
wget -O splunkforwarder-9.1.0-1c86ca0bacc3-Linux-x86_64.tgz "https://download.splunk.com/products/universalforwarder/releases/9.1.0/linux/splunkforwarder-9.1.0-1c86ca0bacc3-Linux-x86_64.tgz" &&
sleep 30

## Assign Splunk permissions
chown -R splunk:splunk /tmp/splunkforwarder-9.1.0-1c86ca0bacc3-Linux-x86_64.tgz &&
mkdir /opt/splunkforwarder &&

#Extracting splunk
sudo tar -zxvf /tmp/splunkforwarder-9.1.0-1c86ca0bacc3-Linux-x86_64.tgz -C /opt &&
sleep 25

#Assign Splunk permissions
chown -R splunk:splunk /opt/splunkforwarder &&

#Install Splunk
/opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --no-promt --SPLUNKUSERNAME=splunk --gen-and-print-passwd &&
sleep 40

#Configure the Splunk universal forwarder - Create deploymentclient.conf
touch /opt/splunkforwarder/etc/system/local/deploymentclient.conf &&

#Echo the configurations into deploymentclient.conf
echo "[target-broker:deploymentServer]" >> /opt/splunkforwarder/etc/system/local/deploymentclient.conf &&
echo "targetUri = <DS IP ADDRESS>:8089" >> /opt/splunkforwarder/etc/system/local/deploymentclient.conf &&

#Stop the UF service to enable boot start
/opt/splunkforwarder/bin/splunk stop &&
sleep 30

#Enable boot start
/opt/splunkforwarder/bin/splunk enable boot-start &&
sleep 10

#Start Splunk
/opt/splunkforwarder/bin/splunk restart &&
sleep 30
