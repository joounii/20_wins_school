#!/bin/bash

login () {

    clear

    #lore start
    echo "$(yellow "... - ")Goodmorning"
    echo "$(yellow "... - ")you were asleep for a long time."
    echo "$(yellow "Mr. Mornigan - ")My name is Mr. Mornigan"
    echo "$(yellow "Mr. Mornigan - ")do you remember what happened?"
    echo "$()"
    echo "$(user "you - ")no everything is blurred, where am I..."
    echo "$()"
    echo "$(yellow "Mr. Mornigan - ")I found you behind the barracks this was three weeks ago."
    #lore end

    echo "$(yellow "Mr. Mornigan - ")But do you remember what your name is?"
    read name

    echo "$name" > ./data/login.txt
    
    if jq --arg name "$name" '.users[].name == $name' ./data/user_statistics.json | grep -q "true"; then
        echo "User $name already exists"
    else
        # Add the new user
        jq --arg name "$name" '.users += [{"name": $name, "pve_random": [{"win": 0, "lose": 0}], "pve_impossible": [{"win": 0, "lose": 0}]}]' ./data/user_statistics.json > ./data/temp.json && mv ./data/temp.json ./data/user_statistics.json
        echo "User $name added"
    fi

    home
}