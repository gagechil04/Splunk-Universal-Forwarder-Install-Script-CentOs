# Splunk-Universal-Forwarder-Install-Script-CentOs

<br>This script will install/configure the Splunk Universal Forwarder service on a Cent OS host as well as point and essentially be a completely hands off install. Ideally, you could push this out via third party tool to cover a mass amount of UF hosts.

<br />Note the lines below regarding the deployment server configuration, this can be removed/commented out if not applicable. The reason for using echo commands was due to issues with Splunk asking for the password after running "splunk set deploy-poll <IP_address/hostname>:<management_port>". For the sake of simplicity and not storing passwords in plain text, echo gets it done in 2 lines :)
<br /><br />You will need to make a couple modifications within the script such as:
<br />Pasting the IP Address of the Deployment Server you want to the Cent Os hosts to report to:
```
Echo the configurations into deploymentclient.conf
echo "[target-broker:deploymentServer]" >> /opt/splunkforwarder/etc/system/local/deploymentclient.conf &&
echo "targetUri = <DS IP ADDRESS>:8089" >> /opt/splunkforwarder/etc/system/local/deploymentclient.conf &&
```


<br />pasting the wget link for the installer from splunk
