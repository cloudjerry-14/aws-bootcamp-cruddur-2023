# Week 1 — App Containerization

### Docker is a platform which help desing and develop modern applications. It takes care of the setup to help you focus more on code.

#### Containerizing the CRUDD Application

#### Dockerfile :
 A Dockerfile is a text document that contains all the commands a user could call on the command line to create an image

#### Creating container for backend application :

Change directoy to the back-end app
``` 
cd  backend-flask/
 
```
Setting the env variables 

```
export FRONTEND_URL="*"
export BACKEND_URL="*"
```

Dockerfile for our backend-app

``` 
FROM python:3.10-slim-buster

WORKDIR /backend-flask

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

ENV FLASK_ENV=development

EXPOSE ${PORT}
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=4567"]
```


Building the docker image for our backend app

``` 
docker build -t  backend-flask-app ./backend-flask
```

 <img width="907" alt="image" src="https://user-images.githubusercontent.com/71233890/221491740-2a868479-7fb4-4f00-ae85-bfadc710ea4a.png">

Start the container by executing the below command, this will run the conatiner in background

```
docker container run --rm -p 4567:4567 -d backend-flask
```

Verify the container is running by executing the command 
```
docker ps
```
check the logs 
container id : a7dff7c7764c47f8c21cff052fd315061090f15fe520b52351e31d88d917c16e
```
docker logs CONTAINER_ID -f
```

<img width="952" alt="image" src="https://user-images.githubusercontent.com/71233890/221492274-38af8c63-01fc-4dbb-8124-d7a98888386c.png">


#### Creating container for frontend application

Change the directory and do npm install
```
cd frontend-react-js
npm install
```

Dockerfile for frontend
```
FROM node:16.18

ENV PORT=3000

COPY . /frontend-react-js
WORKDIR /frontend-react-js
RUN npm install
EXPOSE ${PORT}
CMD ["npm", "start"]

```
Building the docker image for our frontend app
```
docker build -t frontend-react-js-app ./frontend-react-js
```
![image](https://user-images.githubusercontent.com/71233890/221502303-9525763e-8561-487c-8006-760d159b5fb1.png)

 Running the container 
 ```
 docker run -p 3000:3000 -d frontend-react-js
 ```
 ![image](https://user-images.githubusercontent.com/71233890/221502325-90827059-633d-41ce-ae86-c8055ba5780f.png)
 
 frontend UI
![image](https://user-images.githubusercontent.com/71233890/221502333-aac39026-ed89-49db-95e1-e0d074fd98d3.png)

#### Docker compose : It is a tool which helps in defining and running multi-container Docker applications.

Creating a docker-compose.yml file for our containers and defining the frontend and backend services along with database services and volumes.
```
version: "3.8"
services:

  backend-flask:
    environment:
      FRONTEND_URL: "https://3000-${GITPOD_WORKSPACE_ID}.${GITPOD_WORKSPACE_CLUSTER_HOST}"
      BACKEND_URL: "https://4567-${GITPOD_WORKSPACE_ID}.${GITPOD_WORKSPACE_CLUSTER_HOST}"
    build: ./backend-flask
    ports:
      - "4567:4567"
    volumes:
      - ./backend-flask:/backend-flask

  frontend-react-js:
    environment:
      REACT_APP_BACKEND_URL: "https://4567-${GITPOD_WORKSPACE_ID}.${GITPOD_WORKSPACE_CLUSTER_HOST}"
    build: ./frontend-react-js
    ports:
      - "3000:3000"
    volumes:
      - ./frontend-react-js:/frontend-react-js

  dynamodb-local:
    # https://stackoverflow.com/questions/67533058/persist-local-dynamodb-data-in-volumes-lack-permission-unable-to-open-databa
    # We needed to add user:root to get this working.
    user: root
    command: "-jar DynamoDBLocal.jar -sharedDb -dbPath ./data"
    image: "amazon/dynamodb-local:latest"
    container_name: dynamodb-local
    ports:
      - "8000:8000"
    volumes:
      - "./docker/dynamodb:/home/dynamodblocal/data"
    working_dir: /home/dynamodblocal

  db:
    image: postgres:13-alpine
    restart: always
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=password
    ports:
      - '5432:5432'
    volumes: 
      - db:/var/lib/postgresql/data

# the name flag is a hack to change the default prepend folder
# name when outputting the image names
networks: 
  internal-network:
    driver: bridge
    name: cruddur

volumes:
  db:
    driver: local
```

Running multiple containers using docker-compose 
```
docker compose up
```
<img width="919" alt="image" src="https://user-images.githubusercontent.com/71233890/221503350-fc19eba1-f8d7-4f51-b209-4d13799dd4c7.png">


#### CRUDD App

<img width="953" alt="image" src="https://user-images.githubusercontent.com/71233890/221505594-88323357-2f7a-45d1-a9db-a4366223d2e4.png">



#### Notification Page :

![image](https://user-images.githubusercontent.com/71233890/221431155-9330bcff-9846-4f6d-8a65-74928bdae58e.png)

#### Vulnerability testing using Snyk
<img width="782" alt="image" src="https://user-images.githubusercontent.com/71233890/221670275-8f89fae7-9f02-43af-82e8-0614cd2e9f36.png">

### Pushing images to Docker registry (DockerHub)

login to docker registry 
```
docker login
```

Build the image with registry tag 
```
docker build -t cloudjerry14/imagepush .
```
![image](https://user-images.githubusercontent.com/71233890/221677744-92af291d-1c63-45eb-81bc-23f3a7e5fbd1.png)

verify image is built
```
docker images
```

push to dockerhub
```
docker push cloudjerry14/imagepush
```
![image](https://user-images.githubusercontent.com/71233890/221677788-f1d19a3a-62b7-4804-850d-7283723ceaba.png)

#### Dockerhub

<img width="960" alt="image" src="https://user-images.githubusercontent.com/71233890/221678199-d6bbd245-9f95-4a60-8c33-251628c0d1f6.png">


#### Launching an EC2 instance, installing docker, creating a script that will build the image and run the container
update packages
```
sudo apt-get update
```
install docker
```
sudo apt-get install docker.io
```

![image](https://user-images.githubusercontent.com/71233890/221687197-d58f9346-625d-4c94-b7ed-8e415d3b2054.png)

cd into backend-app
```
cd aws-bootcamp-cruddur-2023/backend-flask/
```
Give executable permission to our script file
```
chmod +x run.sh
```
run the script to build the image and start the container in background

```
./run.sh

```
![image](https://user-images.githubusercontent.com/71233890/221687307-ae72c506-1a0a-4f95-8ede-b6171db30cd6.png)

Verify container is runnng 
```
sudo docker ps

```
![image](https://user-images.githubusercontent.com/71233890/221687282-a8af9b37-0b95-47bc-b520-84d02611f82d.png)


