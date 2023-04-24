#!/bin/bash

echo -e "\n**************************************************"
echo "Removing resources (except volumes) created by docker compose"
echo -e "**************************************************\n"
docker compose down -v --rmi all
