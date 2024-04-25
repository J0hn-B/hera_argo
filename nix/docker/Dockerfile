FROM jetpackio/devbox-root-user:latest

# Installing your devbox project
WORKDIR /code
COPY devbox.json devbox.json
COPY devbox.lock devbox.lock
COPY src src

CMD ["devbox", "shell"]

# This is a sample Dockerfile for a devbox project.

# Build the docker image: |  docker build -t my-devbox .

# Run the docker image:   |  docker run -it my-devbox /bin/bash
