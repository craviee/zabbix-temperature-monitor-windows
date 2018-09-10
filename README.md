# Monitoring CPU temperature of Windows hosts with Zabbix 3.4

This tutorial was based on [Myopsblog](https://myopsblog.wordpress.com/2016/06/06/cpu-temperature-monitoring-with-zabbix/) that is a translate of original post on [Habr](https://habr.com/post/228095/).

This tutorial won't help you installing and configuring Zabbix Agent on Windows, this needs to be done in advance.

## Creating Item in Zabbix

First you need to create the temperature item in Zabbix, it can be an item directly on host or on template.

![Creating item in Zabbix](https://i.imgur.com/RUL3NlR.png)

## Placing files

Download the **OpenHardwareMonitor** folder and place on C:\
Add the last line of **zabbix_agentd.conf** to your zabbix agent config file:

_UserParameter=Temperature.CPU, type C:\OpenHardwareMonitor\temperature.txt_

## Starting TempMonitoring.bat

The best option is to run this script as Startup program.
You can start manually for testing.

## Obtaining data

After you run the **TempMonitoring.bat** script, just wait some minutes and then your item in Zabbix will gather data:

![Graph showing CPU Temperature](https://i.imgur.com/sOrC94s.png)

### Why this works?

**TempMonitoring.bat** will call **OpenHardwareMonitorReport.exe**, apply some filters, gets the average CPU temperature and save to **temperature.txt** file, sleeps **one minute** and then repeat infinitely. Zabbix Agent will request Temperature.CPU item, which will simple read the file and return to Zabbix Server.

### Changing parameters

You can change the sleep time in seconds of **TempMonitoring.bat** for your need, just change _60_ to your desired value.

You can modify the path as well, just change all **six** occurrences of path at **TempMonitoring.bat** and the path of _UserParameter_ at your zabbix agent config file.
