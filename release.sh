#!/bin/bash

TAG=v0.1
rm -rf ./release/$TAG

# create a new git tag and push it
git tag -a $TAG -m "$TAG release"
git push origin $TAG

# darwin - create a macos build
env GOOS=darwin GOARCH=amd64 go build -o ./release/$TAG/darwin/person ./person/main.go
env GOOS=darwin GOARCH=amd64 go build -o ./release/$TAG/darwin/product ./product/main.go
env GOOS=darwin GOARCH=amd64 go build -o ./release/$TAG/darwin/recommendation ./recommendation/main.go
env GOOS=darwin GOARCH=amd64 go build -o ./release/$TAG/darwin/review ./review/main.go

cd release/$TAG/darwin && zip ecommerce-darwin-amd64.zip * && cd ../../../

pwd

# linux - create a linux build
env GOOS=linux GOARCH=amd64 go build -o ./release/$TAG/linux/person ./person/main.go
env GOOS=linux GOARCH=amd64 go build -o ./release/$TAG/linux/product ./product/main.go
env GOOS=linux GOARCH=amd64 go build -o ./release/$TAG/linux/recommendation ./recommendation/main.go
env GOOS=linux GOARCH=amd64 go build -o ./release/$TAG/linux/review ./review/main.go

cd release/$TAG/linux && zip ecommerce-linux-amd64.zip * && cd ../../../

# windows - create a windows build
env GOOS=windows GOARCH=amd64 go build -o ./release/$TAG/windows/person.exe ./person/main.go
env GOOS=windows GOARCH=amd64 go build -o ./release/$TAG/windows/product.exe ./product/main.go
env GOOS=windows GOARCH=amd64 go build -o ./release/$TAG/windows/recommendation.exe ./recommendation/main.go
env GOOS=windows GOARCH=amd64 go build -o ./release/$TAG/windows/review.exe ./review/main.go

cd release/$TAG/windows && zip ecommerce-windows-amd64.zip * && cd ../../../

# create a github release that allows people to download binaries
hub release create \
    -a release/$TAG/darwin/ecommerce-darwin-amd64.zip \
    -a release/$TAG//linux/ecommerce-linux-amd64.zip \
    -a release/$TAG/windows/ecommerce-windows-amd64.zip \
    -m "$TAG" $TAG
