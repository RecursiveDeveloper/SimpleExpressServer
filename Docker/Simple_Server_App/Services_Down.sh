#!/bin/bash

ENV_FILE=.env.dev

echo -e "\n**************************************************"
echo "Removing resources (except volumes) created by docker compose"
echo -e "**************************************************\n"
sudo docker compose --env-file $ENV_FILE down -v --rmi all
