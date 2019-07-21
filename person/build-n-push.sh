#!/bin/bash

docker build . -t hiprabhat/ecommerce-person:v1
docker push hiprabhat/ecommerce-person:v1
docker tag hiprabhat/ecommerce-person:v1 hiprabhat/ecommerce-person:latest
docker push hiprabhat/ecommerce-person:latest
