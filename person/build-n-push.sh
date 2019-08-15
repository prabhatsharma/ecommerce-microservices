#!/bin/bash

docker build . -t hiprabhat/ecommerce-person:v2 -t hiprabhat/ecommerce-person:latest
docker push hiprabhat/ecommerce-person:v2
docker push hiprabhat/ecommerce-person:latest
