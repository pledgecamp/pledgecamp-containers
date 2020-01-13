#!/bin/bash

# Wait until postgres is ready
echo -ne "Waiting for PostgreSQL"
until pg_isready
do
    echo -ne "."
    sleep 1
done
echo "OK"
