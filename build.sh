#!/bin/sh

version="0.17.1"
docker build . --tag "pocketbase:${version}" --tag "pocketbase:latest"
