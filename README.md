# Day 2 - Use Docker for App Deployment

# Task: Run Sparta test app in a container


Task: Run Sparta test app in a container

Aim: Run Node JS v20 Sparta test app in a Docker container (frontpage only)

Timing: 1 hour

1. Create a new folder for this task (because you can only have one Dockerfile per folder)

2. Put your 'app' folder in the that folder

3. Create a new Dockerfile

4. Steps for the Dockerfile:
```
# from which image


# label


# set the default working directory to /usr/src/app


# copy app folder (to same place as Dockerfile, then copy to default location in container)

# COPY app /usr/src/app

# COPY package*.json ./


# install dependencies with npm


# expose port


# CMD [node app.js or npm start]

```

5. You should be able to run three docker commands to get the app running at port 3000 (as well as get the container image which is build pushed to Docker Hub):

```
docker build

docker run

docker push
```

1. Force docker to pull a fresh image from Docker Hub to re-run your own app image



# Task: Research Docker Compose

# Task: Use Docker Compose to run app and database containers