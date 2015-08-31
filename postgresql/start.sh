#!/bin/sh

CONTAINER_NAME="postgresql"

if test ! $(docker ps -afq "name=postgresql")
then
  docker run --name $CONTAINER_NAME -e POSTGRES_PASSWORD=postgres -p 5432 postgres
else
  docker start $CONTAINER_NAME
fi
