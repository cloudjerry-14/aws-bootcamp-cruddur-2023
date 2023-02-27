#!/bin/bash

read imageName
echo "Enter Image Name to be given"
sudo docker build -t $imageName .
sudo docker container run -d $imageName
