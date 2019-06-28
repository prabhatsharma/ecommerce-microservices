#!/bin/bash

kubectl delete -f person/deployment.yaml
kubectl delete -f product/deployment.yaml
kubectl delete -f recommendation/deployment-v6.yaml
kubectl delete -f recommendation/deployment-v7.yaml
kubectl delete -f recommendation/service.yaml
kubectl delete -f review/deployment-v6.yaml
kubectl delete -f review/deployment-v7.yaml
kubectl delete -f review/service.yaml