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
  ; cd  ..

echo ''
echo ''
echo '##############'
echo '### GoLang ###'
echo '##############'
echo ''
cd pledgecamp-golang \
  && docker build -t pledgecamp/golang . \
  && docker push pledgecamp/golang \
  ; cd  ..

echo ''
echo ''
echo '##############'
echo '### NODEJS ###'
echo '##############'
echo ''
cd pledgecamp-nodejs \
  && docker build -t pledgecamp/nodejs . \
  && docker push pledgecamp/nodejs \
  ; cd  ..

echo ''
echo ''
echo '##########################'
echo '### NODEJS WITH CYPRESS###'
echo '##########################'
echo ''
cd pledgecamp-nodejs-cypress \
  && docker build -t pledgecamp/nodejs:cypress . \
  && docker push pledgecamp/nodejs:cypress \
  ; cd  ..

echo ''
echo ''
echo '############'
echo '### HUGO ###'
echo '############'
echo ''
cd pledgecamp-hugo \
  && docker build -t pledgecamp/hugo . \
  && docker push pledgecamp/hugo \
  ; cd  ..