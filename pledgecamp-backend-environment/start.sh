#!/bin/bash

cd /src

FILE=/pledgecamp/DB_SETUP

/pledgecamp/postgres_wait.sh

if [ -f "$FILE" ]; then
    echo "No need to bootstrap DB"
else
    echo "running DB migrations and setup by fixtures"
    pipenv run python manage.py db migrate
    pipenv run python manage.py db upgrade
    pipenv run python "./scripts/db_populate.py"
    touch /pledgecamp/DB_SETUP
fi
echo "Warm up cache"
pipenv run python "./scripts/cache_warmup.py"
echo "Run application"
pipenv run python application.py
