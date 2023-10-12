# Splunk-Universal-Forwarder-Install-Script-CentOs

<br />Note the lines below regarding the deployment server configuration, this can be removed/commented out if not applicable. The reason for using echo commands was due to issues with Splunk asking for the password after running "splunk set deploy-poll <IP_address/hostname>:<management_port>". For the sake of simplicity and not storing passwords in plain text, echo gets it done in 2 lines :)
```
Echo the configurations into deploymentclient.conf
echo "[target-broker:deploymentServer]" >> /opt/splunkforwarder/etc/system/local/deploymentclient.conf &&
echo "targetUri = <DS IP ADDRESS>:8089" >> /opt/splunkforwarder/etc/system/local/deploymentclient.conf &&
```
