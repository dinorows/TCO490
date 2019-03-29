# Deployment of WordPress+MySQL Containers with Docker Compose


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fdocker-wordpress-mysql%2Fazuredeploy.json" target="_blank">
	<img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fdocker-wordpress-mysql%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template allows you to deploy an Ubuntu Server 16.04.0-LTS VM with Docker (using the [Docker Extension][ext])
and starts a WordPress container listening an port 80 which uses MySQL database running
in a separate but linked Docker container, which are created using [Docker Compose][compose]
capabilities of the [Azure Docker Extension][ext].

This template is configured for AzureUSGovernment, and specifically for MI TCO490, Spring 2019. Will not work outside of that subscription, sorry.

Command line (remove CRs):

az group deployment validate --resource-group dinoarmtest01 --template-uri 
https://raw.githubusercontent.com/dinorows/TCO490/master/docker-wordpress-mysql/azuredeployi.json 
--parameters "{'newStorageAccountName': {'value': 'dinovhds01'},'mysqlPassword': {'value': 
'My5q1P@s5w0rd!'},'adminUsername': {'value': 'dino'},'adminPassword': {'value':'passw0rd12345!'},
'dnsNameForPublicIP': {'value': 'dinopublicip617'}}"

[ext]: https://github.com/Azure/azure-docker-extension
[compose]: https://docs.docker.com/compose
