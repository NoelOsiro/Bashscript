#!/bin/bash

repo=$1
file=$2
GREEN="\e[92m"
STOP="\e[0m"
if [ -z "$repo" ] || [ -z "$file" ]; then
    echo ERROR: Please include repo name followed by filename or \* \(glob\) for entire directory.
  exit 1
fi

git status;
 
read -p "Would you like to push changes now?: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
        git add .
    elif [[ $REPLY =~ ^[Nn]$ ]]; then
        printf "\nCanceled"
        sleep 2
        exit
    fi

printf "\nInsert Commit message\n"
read -r message

    git commit -m "$message"
    git push git@github.com:NoelOsiro/"$repo".git;
    printf "${GREEN}"
    figlet "Pushing Ps"
    printf "${STOP}"
    sleep 2
    exit

