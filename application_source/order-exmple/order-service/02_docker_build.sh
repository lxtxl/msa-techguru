#!/bin/bash

PROJECT_NAME=order-service
TAG_NAME=latest
docker build -t ${PROJECT_NAME}:${TAG_NAME} .
