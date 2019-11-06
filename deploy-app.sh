#!/bin/bash

kubectl apply -f ns.yaml
kubectl apply -f person/deployment.yaml

kubectl apply -f product/deployment.yaml

kubectl apply -f recommendation/deployment-v1.yaml
kubectl apply -f recommendation/service.yaml


kubectl apply -f review/deployment-v1.yaml
kubectl apply -f review/service.yaml