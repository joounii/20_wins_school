#!/bin/bash

login () {

    clear
    echo "$(yellow "Please enter your name:")"
    read name

    echo "$name" > ./data/login.txt
    home
    
}