# syntax=docker/dockerfile:1
# link: https://docs.docker.com/engine/reference/builder/
#       https://docs.docker.com/develop/develop-images/dockerfile_best-practices/


FROM python:alpine
WORKDIR /usr/src/app

#RUN apt-get update && apt-get install -y tini
#RUN apt update
#RUN apt install python3-dev python3-pip python3-venv
COPY requirements requirements
RUN pip install pip --upgrade pip
RUN pip install --no-cache-dir -r requirements

EXPOSE 7777
COPY . .

VOLUME ./database

CMD ["python", "./your-daemon-or-script.py"]





# FROM: <IMAGE>:<VERSION> llok at Docker Hub
#FROM python:alpine

# LABEL <KEY>=<VALUE>
#LABEL version="0.0.1-beta"

# WORKDIR
#WORKDIR /usr/src/app

# RUN <COMMAND+ARGS> && <COMMAND+ARGS>
# Always combine RUN apt-get update with apt-get install in the same RUN statement
#RUN apt-get upgrade && apt-get install -y \
#    <packages>
# USING PIPES: RUN wget -O - https://some.site | wc -l > /number

#CMD ["executable", "param1", "param2"…]
#CMD ["python", "manage.py", "runserver"]

# EXPOSE: HTTP:80|SMTP:587|MONGO:27017|MYSQL:3306
#EXPOSE 80

# ENV <KEY>=<VALUE>
#ENV PYTHON_DIR=bin/src/app

# ADD or COPY: <FILE-HOST> <FILE-CONTAINER>
# the best use for ADD is local tar file auto-extraction into the image, as in ADD rootfs.tar.xz /.
#ADD https://example.com/big.tar.xz /usr/src/things/
#COPY . /source/
#COPY ./settings/requirements requirements

# ENTRYPOINT: 
#ENTRYPOINT ["s3cmd"]
#CMD ["--help"]

# Postgres Official Image Script ENTRYPOINT
#!/bin/bash
#set -e
#if [ "$1" = 'postgres' ]; then
#    chown -R postgres "$PGDATA"
#    if [ -z "$(ls -A "$PGDATA")" ]; then
#        gosu postgres initdb
#    fi
#    exec gosu postgres "$@"
#fi
#exec "$@"

#VOLUME volume_directory ["volume_directory"]
#OLUME instruction creates a mount point with the specified name and marks it as holding externally mounted volumes from native host or other containers
#VOLUME ["/data"]

#USER <user>[:<group>]
#USER instruction sets the user name (or UID) and optionally the user group (or GID) to use when running the image and for any RUN, CMD and ENTRYPOINT instructions
#USER LeandroAlves

#WORKDIR: always use absolute paths
#WORKDIR instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions
#WORKDIR /path/to/workdir

#ONBUILD command executes after the current Dockerfile build completes. ONBUILD executes in any child image derived FROM the current image.
#ONBUILD ADD . /app/src
#ONBUILD RUN /usr/local/bin/python-build --dir /app/src

#FROM python:alpine
#WORKDIR /usr/src/app
#RUN apt-get update && apt-get install -y tini
#COPY ./library/requirements requirements
#RUN pip install pip --upgrade pip
#RUN pip install --no-cache-dir -r requirements
#EXPOSE 7777
#COPY . .
#CMD ["python", "./your-daemon-or-script.py"]