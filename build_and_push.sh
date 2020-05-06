#!/bin/bash

echo ''
echo ''
echo '##############'
echo '### PYTHON ###'
echo '##############'
echo ''
cd pledgecamp-python \
  && docker build -t pledgecamp/python . \
  && docker push pledgecamp/python \
  && cd  ..

echo ''
echo ''
echo '###########################'
echo '### BACKEND ENVIRONMENT ###'
echo '###########################'
echo ''
cd pledgecamp-backend-environment \
  && docker build -t pledgecamp/python:environment . \
  && docker push pledgecamp/python:environment \
  && cd  ..

echo ''
echo ''
echo '##############'
echo '### NODEJS ###'
echo '##############'
echo ''
cd pledgecamp-nodejs \
  && docker build -t pledgecamp/nodejs . \
  && docker push pledgecamp/nodejs \
  && cd  ..

echo ''
echo ''
echo '############'
echo '### HUGO ###'
echo '############'
echo ''
cd pledgecamp-hugo \
  && docker build -t pledgecamp/hugo . \
  && docker push pledgecamp/hugo \
  && cd  ..