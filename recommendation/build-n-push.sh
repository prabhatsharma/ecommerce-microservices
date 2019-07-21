#!/bin/bash

docker build . -t hiprabhat/ecommerce-recommendation:v2
docker push hiprabhat/ecommerce-recommendation:v2
docker tag hiprabhat/ecommerce-recommendation:v2 hiprabhat/ecommerce-recommendation:latest
docker push hiprabhat/ecommerce-recommendation:latest


