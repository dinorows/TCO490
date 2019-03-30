#!/bin/bash

# just in case you wand to install dotnet core..
#sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ trusty main" > /etc/apt/sources.list.d/dotnetdev.list'
#sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
#sudo apt-get update
#sudo apt-get install -y dotnet-dev-1.0.0-preview2-003121

# ..and download your web app
#sudo wget https://raw.githubusercontent.com/dinorows/TCO490/master/docker-wordpress-mysql/README.md/myapp/myapp-pub.tar /
#sudo mkdir /opt/myapp
#sudo tar -xf myapp-pub.tar -C /opt/myapp

#
# All we're going to do here is download pre-fab containers and hook them up with docker-compose
#

# Create an empty project directory and download the .yml docker-compose script from my github
mkdir my_wordpress && cd my_wordpress
#sudo apt-get install lynx
#lynx -dump https://raw.githubusercontent.com/dinorows/TCO490/master/docker-wordpress-mysql/docker-compose.yml > docker-compose.yml
sudo wget https://raw.githubusercontent.com/dinorows/TCO490/master/docker-wordpress-mysql/docker-compose.yml

# update
sudo apt-get update
sudo apt-get -y -q install curl

# install docker
#sudo curl -fsSL https://get.docker.com/ | sh
sudo apt-get -y -q install docker.io

# You can check that the installation was successful with the following test program:
#sudo docker run hello-world

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo systemctl restart docker

# docker-compose comes with command completion for the bash and zsh shell.
# Install command completion
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.23.2/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

# run docker-compose to download and then hook up wordpress and mysql containers, 
# as specified in script docker-compose.yml
sudo docker-compose up -d

# to check on container ops:
#docker ps -all

# At this point, WordPress should be running on port 8000 of your Docker Host, and you can 
# complete the “famous five-minute installation” as a WordPress administrator.

# Note: The WordPress site is not immediately available on port 8000 because the containers are 
# still being initialized and may take a couple of minutes before the first load.

# If you are using Docker Machine, you can run the command docker-machine ip MACHINE_VM to get 
# the machine address, and then open http://MACHINE_VM_IP:8000 in a web browser.

# wordpress:
#http://<vm-publicip>:8000 to access first time and configure
#http://<vm-publicip>:8000/wp-admin/ to administer