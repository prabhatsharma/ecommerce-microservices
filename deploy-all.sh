#!/bin/bash

kubectl apply -f person/deployment.yaml
kubectl apply -f product/deployment.yaml
kubectl apply -f recommendation/deployment-v6.yaml
kubectl apply -f recommendation/deployment-v7.yaml
kubectl apply -f recommendation/service.yaml
kubectl apply -f review/deployment-v6.yaml
kubectl apply -f review/deployment-v7.yaml
kubectl apply -f review/service.yaml
