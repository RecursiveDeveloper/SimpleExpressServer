#!/bin/bash

ENV_FILE=.env.dev

echo -e "\n**************************************************"
echo "Creating resources declared in docker compose"
echo -e "**************************************************\n"
sudo docker compose --env-file $ENV_FILE up     
