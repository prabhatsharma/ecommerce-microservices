#!/bin/bash

TAG=v0.1
rm -rf ./release/$TAG

git tag -a $TAG -m "$TAG release"
git push origin $TAG

# darwin
env GOOS=darwin GOARCH=amd64 go build -o ./release/$TAG/darwin/person ./person/main.go
env GOOS=darwin GOARCH=amd64 go build -o ./release/$TAG/darwin/product ./product/main.go
env GOOS=darwin GOARCH=amd64 go build -o ./release/$TAG/darwin/recommendation ./recommendation/main.go
env GOOS=darwin GOARCH=amd64 go build -o ./release/$TAG/darwin/review ./review/main.go

cd release/$TAG/darwin && zip ecommerce-darwin-amd64.zip * && cd ../../../

pwd

# linux
env GOOS=linux GOARCH=amd64 go build -o ./release/$TAG/linux/person ./person/main.go
env GOOS=linux GOARCH=amd64 go build -o ./release/$TAG/linux/product ./product/main.go
env GOOS=linux GOARCH=amd64 go build -o ./release/$TAG/linux/recommendation ./recommendation/main.go
env GOOS=linux GOARCH=amd64 go build -o ./release/$TAG/linux/review ./review/main.go

cd release/$TAG/linux && zip ecommerce-linux-amd64.zip * && cd ../../../

# windows
env GOOS=windows GOARCH=amd64 go build -o ./release/$TAG/windows/person.exe ./person/main.go
env GOOS=windows GOARCH=amd64 go build -o ./release/$TAG/windows/product.exe ./product/main.go
env GOOS=windows GOARCH=amd64 go build -o ./release/$TAG/windows/recommendation.exe ./recommendation/main.go
env GOOS=windows GOARCH=amd64 go build -o ./release/$TAG/windows/review.exe ./review/main.go

cd release/$TAG/windows && zip ecommerce-windows-amd64.zip * && cd ../../../

# # create a release
hub release create \
    -a release/$TAG/ecommerce-darwin-amd64.zip \
    -a release/$TAG/ecommerce-linux-amd64.zip \
    -a release/$TAG/ecommerce-windows-amd64.zip \
    -m "$TAG" $TAG


# mkdir binaries/releases/$TAG

# # darwin
# rm -rf binaries/darwin/
# env GOOS=darwin GOARCH=amd64 go build -o binaries/darwin/eksuser
# zip binaries/releases/$TAG/eksuser-darwin-amd64.zip binaries/darwin/eksuser

# # linux
# rm -rf binaries/linux/
# env GOOS=linux GOARCH=amd64 go build -o binaries/linux/eksuser
# zip binaries/releases/$TAG/eksuser-linux-amd64.zip binaries/linux/eksuser

# # windows
# rm -rf binaries/windows/
# env GOOS=windows GOARCH=amd64 go build -o binaries/windows/eksuser.exe
# zip binaries/releases/$TAG/eksuser-windows-amd64.zip binaries/windows/eksuser.exe

# # copy to current path
# # cp binaries/darwin/eksuser ~/bin/

# # create a release
# hub release create \
#     -a binaries/releases/$TAG/eksuser-darwin-amd64.zip \
#     -a binaries/releases/$TAG/eksuser-linux-amd64.zip \
#     -a binaries/releases/$TAG/eksuser-windows-amd64.zip \
#     -m "$TAG" $TAG