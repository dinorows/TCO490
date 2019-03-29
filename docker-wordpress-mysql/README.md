# Deployment of WordPress + MySQL Containers with Docker Compose

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fdocker-wordpress-mysql%2Fazuredeploy.json" target="_blank">
	<img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fdocker-wordpress-mysql%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template allows you to deploy an Ubuntu Server 16.04.0-LTS VM with Docker (without using the 
[Docker Extension][ext], but with a custom dino script instead) and start a WordPress container 
listening an port 8000 which uses MySQL database running in a separate but linked Docker container, 
which are created using [Docker Compose].

This template is configured for AzureUSGovernment, and specifically for MI TCO490, Spring 2019. Will 
probably work work outside of that subscription, but if it doesn't I don't know who wrote this :-)

Command line (remove CRs):

az group deployment validate --resource-group dinoarmtest01 --template-uri 
https://raw.githubusercontent.com/dinorows/TCO490/master/docker-wordpress-mysql/azuredeployi.json 
--parameters "{'newStorageAccountName': {'value': 'dinovhds01'},'mysqlPassword': {'value': 
'My5q1P@s5w0rd!'},'adminUsername': {'value': 'dino'},'adminPassword': {'value':'passw0rd12345!'},
'dnsNameForPublicIP': {'value': 'dinopublicip617'}}"

Note that the azure deploy template contains a custom script extension version 2 for Linux machines
that installs docker and docker-compose, as well as references a custom docker-compose .yml script 
to install and hook up a wordpress and a mysql container! See here: 
https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-linux

After deployment and following container install and initialization, WordPress should be running on 
port 8000 of your Docker Host, and you can complete the “famous five-minute installation” as a 
WordPress administrator.

To access first time and configure: http://<vm-publicip>:8000 

To administer thereafter: http://<vm-publicip>:8000/wp-admin/