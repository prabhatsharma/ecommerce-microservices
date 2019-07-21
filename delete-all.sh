#!/bin/bash

kubectl delete -f person/deployment.yaml

kubectl delete -f product/deployment.yaml

kubectl delete -f recommendation/deployment-v1.yaml
kubectl delete -f recommendation/deployment-v2.yaml
kubectl delete -f recommendation/service.yaml
kubectl apply -f recommendation/istio-vs.yaml
kubectl apply -f recommendation/istio-dr.yaml

kubectl delete -f review/deployment-v1.yaml
kubectl delete -f review/deployment-v2.yaml
kubectl delete -f review/service.yaml
kubectl apply -f review/istio-dr.yaml
kubectl apply -f review/istio-vs.yaml
