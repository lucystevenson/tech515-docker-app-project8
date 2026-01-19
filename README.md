# Day 2 - Use Docker for App Deployment

# Task: Run Sparta test app in a container


Task: Run Sparta test app in a container

Aim: Run Node JS v20 Sparta test app in a Docker container (frontpage only)

Timing: 1 hour

1. Create a new folder for this task (because you can only have one Dockerfile per folder)

folder name 'tech515-docker-app-project8'

2. Put your 'app' folder in the that folder

- Sparta app runs with Node.js v20
- The app listens on port 3000
- Folder name is app

3. Create a new Dockerfile

4. Steps for the Dockerfile:
```
# from which image
FROM node:20

# label
LABEL maintainer="lucy stevenson"

# set the default working directory to /usr/src/app
WORKDIR /usr/src/app

# copy app folder (to same place as Dockerfile, then copy to default location in container)
COPY app /usr/src/app

# COPY package*.json ./
COPY app/package*.json ./

# install dependencies with npm
RUN npm install

# expose port
EXPOSE 3000

# CMD [node app.js or npm start]
CMD ["node", "app.js"] / CMD ["npm", "start"]
```

5. You should be able to run three docker commands to get the app running at port 3000 (as well as get the container image which is build pushed to Docker Hub):

```
docker build

docker run

docker push
```

- build the Docker image `docker build -t lucysteve/tech515-sparta-app:v1 .`
- run the container `docker run -d -p 3000:3000 --name sparta-app lucysteve/tech515-sparta-app:v1`
- push image to docker hub
`docker login`
`docker push lucysteve/tech515-sparta-app:v1`

The app is now deployable anywhere.

6. Force docker to pull a fresh image from Docker Hub to re-run your own app image

- Stop & remove local container
`docker rm -f sparta-app`

- Remove local image
`docker rmi lucysteve/tech515-sparta-app:v1`

- re run 
`docker run -d -p 3000:3000 --name sparta-app lucysteve/tech515-sparta-app:v1`


check: http://localhost:3000/

![alt text](images/docker_container_sparta_test_app.jpg)

---

<br>
<br>

# Task: Research Docker Compose

✅ Summary

Docker Compose allows you to:
- Define multi-container apps in one file
- Run everything with one command
- Manage services efficiently
- Maintain consistency across environments

# 📦 Docker Compose – Research

## Why use Docker Compose?

Docker Compose is a tool that allows you to **define and run multi-container Docker applications** using a single configuration file.

Instead of running multiple long `docker run` commands, Docker Compose allows you to:
- Define **multiple services** (e.g. web app, database)
- Define **networks and volumes**
- Start and stop everything with **one command**

### Benefits
- Simplifies **multi-container application management**
- Ensures **consistent environments**
- Reduces command complexity
- Ideal for **local development, testing, and CI/CD**

---

## How to use Docker Compose

Docker Compose uses a YAML configuration file (usually `docker-compose.yml`) to define:
- Services (containers)
- Images or build instructions
- Port mappings
- Volumes
- Environment variables
- Networks

---

### What do you need to install for it to work?

#### Windows / macOS
- **Docker Desktop**
- Docker Compose **v2 is included by default**

#### Linux
- Docker Engine
- Docker Compose plugin

Check installation:

bash: `docker compose version`

⚠️ Note:
- docker compose (space) = v2 (current)
- docker-compose (hyphen) = v1 (deprecated)

### How to store your Docker Compose file
- File name: `docker-compose.yml`

- Location:
  - Store in the root of your project
  - Usually alongside your Dockerfile

- Example project structure:

```
project/
├── app/
├── Dockerfile
└── docker-compose.yml
```

### Docker Compose Commands

#### 🛠 Manage your application
```
docker compose up
docker compose down
```
#### ▶ Start the application (without detached mode)
`docker compose up`

- Runs in the foreground
- Displays logs in real time
- Stops when CTRL + C is pressed

#### ▶ Start the application (in detached mode)

`docker compose up -d`

- Runs in the background
- Terminal remains free
- Containers continue running

❓ Difference between detached and non-detached mode
Mode	Description
Non-detached	Logs visible, terminal blocked
Detached (-d)	Runs in background

#### ⏹ Stop the application

`docker compose down`
- Stops all containers
- Removes containers and networks
- Does not remove images by default

#### 🔍 Check services running with Docker Compose

`docker compose ps`

#### 📜 View logs in real-time

`docker compose logs -f`

#### Specific service logs:

`docker compose logs -f web`

#### 🖼 View Docker Compose images

`docker compose images`

---

<br>
<br>

# Task: Use Docker Compose to run app and database containers