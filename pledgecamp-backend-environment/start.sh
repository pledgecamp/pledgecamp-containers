#!/bin/bash

cd /src

FILE=/pledgecamp/DB_SETUP

/pledgecamp/postgres_wait.sh

if [ -f "$FILE" ]; then
    echo "No need to bootstrap DB"
else
    rm -rf migrations/
    pipenv run python manage.py db init
    mv ./temp.mako migrations/script.py.mako
    pipenv run python manage.py db migrate
    pipenv run python manage.py db upgrade
    pipenv run python "./scripts/db_populate.py"
    pipenv run python "./scripts/cache_warmup.py"
    touch /pledgecamp/DB_SETUP
fi
pipenv run python application.py
