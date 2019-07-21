#!/bin/bash

docker build . -t hiprabhat/ecommerce-product:v1
docker push hiprabhat/ecommerce-product:v1
docker tag hiprabhat/ecommerce-product:v1 hiprabhat/ecommerce-product:latest
docker push hiprabhat/ecommerce-product:latest
