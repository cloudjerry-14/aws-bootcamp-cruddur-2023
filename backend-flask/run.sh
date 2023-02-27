#!/bin/bash

read imageName
echo "Enter Image Name to be given"
docker build -t $imageName .
docker container run -d $imageName
