#!/bin/bash

cd /src

SETUP_MARKER_FILE=/pledgecamp/DB_SETUP

/pledgecamp/postgres_wait.sh

if [ -f "$SETUP_MARKER_FILE" ]; then
    echo "No need to bootstrap DB"
else
    poetry run flask db migrate
    poetry run flask db upgrade
    poetry run flask db populate
    touch $SETUP_MARKER_FILE
fi
poetry run python application.py
