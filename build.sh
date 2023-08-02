#!/bin/sh

version="0.17.1"
docker build . --build-arg pocket_version="$version" --tag "pocketbase:${version}" --tag "pocketbase:latest"
