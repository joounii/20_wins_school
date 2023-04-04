#!/bin/bash

statistic_page () {

    clear
    echo "$(yellow "Please enter the name of the user you want to see the statistics for:")"
    read get_name

    if jq --arg name "$get_name" '.users[].name == $name' ./data/user_statistics.json | grep -q true; then
        win=$(jq --arg get_name "$get_name" '.users[] | select(.get_name == $get_name) | .pve_random[].win' ./data/user_statistics.json)
        lose=$(jq --arg get_name "$get_name" '.users[] | select(.get_name == $get_name) | .pve_random[].lose' ./data/user_statistics.json)

        clear
        echo -e "Here are the statistics for the user $get_name\n\n"
        echo -e "Random bot:\n  wins: $win\n  loses: $lose\n\n"
    else
        echo "User $get_name does not exist"
    fi


    read -n 1 -s -r -p "Press any key to go back"
    home
}