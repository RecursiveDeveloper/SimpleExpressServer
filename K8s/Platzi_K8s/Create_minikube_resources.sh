#!/bin/bash

echo -e "\nCreating new resources\n"
minikube start -n 2 -p demo

echo -e "\nCreating new deployment resources\n"
kubectl create deployment redis --image=redis
kubectl create deployment hasher --image=dockercoins/hasher:v0.1
kubectl create deployment rng --image=dockercoins/rng:v0.1
kubectl create deployment webui --image=dockercoins/webui:v0.1
kubectl create deployment worker --image=dockercoins/worker:v0.1

echo -e "\nExposing services\n"
kubectl expose deployment redis --port 6379 
kubectl expose deployment rng --port 80
kubectl expose deployment hasher --port 80
kubectl expose deploy/webui --type=NodePort --port 80

echo -e "\nExpose minikube service\n"
minikube -p demo service webui

echo -e "\nCreated resources information\n"
kubectl get all
