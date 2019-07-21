#!/bin/bash

docker build . -t hiprabhat/ecommerce-review:v2
docker push hiprabhat/ecommerce-review:v2
docker tag hiprabhat/ecommerce-review:v2 hiprabhat/ecommerce-review:latest
docker push hiprabhat/ecommerce-review:latest


