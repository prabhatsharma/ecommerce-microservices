#!/bin/bash

kubectl apply -f person/deployment.yaml

kubectl apply -f product/deployment.yaml

kubectl apply -f recommendation/deployment-v1.yaml
kubectl apply -f recommendation/deployment-v2.yaml
kubectl apply -f recommendation/service.yaml
kubectl apply -f recommendation/istio-vs.yaml
kubectl apply -f recommendation/istio-dr.yaml


kubectl apply -f review/deployment-v1.yaml
kubectl apply -f review/deployment-v2.yaml
kubectl apply -f review/service.yaml
kubectl apply -f review/istio-dr.yaml
kubectl apply -f review/istio-vs.yaml
