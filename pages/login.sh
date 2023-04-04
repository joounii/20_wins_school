#!/bin/bash

login () {

    clear
    echo "$(yellow "Please enter your name:")"
    read name

    echo "$name" > ./data/login.txt
    
    if jq --arg name "$name" '.users[].name == $name' ./data/user_statistics.json | grep -q "true"; then
        echo "User $name already exists"
    else
        # Add the new user
        jq --arg name "$name" '.users += [{"name": $name, "pve_random": [{"win": 0, "lose": 0}]}]' ./data/user_statistics.json > ./data/user_statistics.tmp && mv ./data/user_statistics.tmp ./data/user_statistics.json
        echo "User $name added"
    fi

    home
}