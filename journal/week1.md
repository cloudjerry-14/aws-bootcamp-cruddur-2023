# Week 1 — App Containerization

## Docker : Docker is a platform which help desing and develop modern applications. It takes care of the setup to help you focus more on code.

### Containerizing the CRUDD Application

#### Dockerfile : A Dockerfile is a text document that contains all the commands a user could call on the command line to create an image

#### Dockerfile for backend application

Change directoy to the back-end app
``` cd  backend-flask/
 
```

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

Run the below command to build the docker image for our back-end app

``` docker build -t  backend-flask-app ./backend-flask ```

Check if enviroment variables are set

Unsetting the env variables if they are set 



# Notification Page :

![image](https://user-images.githubusercontent.com/71233890/221431155-9330bcff-9846-4f6d-8a65-74928bdae58e.png)
