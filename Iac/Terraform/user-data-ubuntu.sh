#!/bin/bash

echo -e "\n**********************************************"
echo "Installing AWS CLI"
echo -e "**********************************************\n"

sudo apt install -y zip
sudo apt install -y unzip

sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install


echo -e "\n**********************************************"
echo "Installing Docker Engine"
echo -e "**********************************************\n"

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


echo -e "\n**********************************************"
echo "Installing Docker Compose"
echo -e "**********************************************\n"

sudo apt-get update -y
sudo apt-get install docker-compose-plugin


echo -e "\n**********************************************"
echo "Copying files from S3 bucket"
echo -e "**********************************************\n"

#sudo aws s3 cp s3://example-s31 ./ --recursive
git clone https://github.com/RecursiveDeveloper/SimpleExpressServer.git

cd SimpleExpressServer/Docker/Simple_Server_App

sudo bash Services_Up.sh