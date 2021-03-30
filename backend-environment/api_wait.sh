#!/bin/bash

echo -ne "Waiting for API"
until $(curl --output /dev/null --silent --head --fail http://localhost:5000/api/healthcheck/); do
    echo -ne '.'
    sleep 1
done
echo "OK"
