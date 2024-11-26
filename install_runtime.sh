#!/bin/bash

NAME=${whoami}
echo "Hello ${NAME}"

### CONFIGURATION
REPOSITORY="https://github.com/jkanclerz/computer-programming-4-2024.git"
APP_NAME=${APP_NAME:-"ecommerce"}
VERSION=main
TMP_DEST=/tmp/${APP_NAME}

DEST=/opt/${APP_NAME}
USERNAME=${APP_NAME}

OS_DEPENDENCIES="git mc cowsay tree"


### SYSTEM UPGRADE
dnf update && dnf upgrade
### Install git & os dependencies
dnf install ${OS_DEPENDENCIES} -y -q

### Java dependencies
dnf install -y -q   java-17-amazon-corretto 

# -p oznacza
mkdir -p ${DEST}
adduser ${USERNAME} || true

mv ${TMP_DEST}/target/*.jar ${DEST}/app.jar
chown -R ${USERNAME}:${USERNAME} ${DEST}

echo 'java -Dserver.port=8080 -jar /opt/ecommerce/app.jar'

### Reszta przeniesiona do CI/CD GITHUB ACTIONS