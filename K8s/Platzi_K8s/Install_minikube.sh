#!/bin/bash

echo -e "\nDownloading binary\n"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

echo -e "\nInstalling binary\n"
sudo install minikube-linux-amd64 /usr/local/bin/minikube

echo -e "\nDeleting binary\n"
sudo rm -f minikube-linux-amd64
