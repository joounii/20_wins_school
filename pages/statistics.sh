#!/bin/bash

statistic_page () {

    clear
    echo "$(yellow "Please enter the name of the user you want to see the statistics for:")"
    read get_name

    if jq --arg name "$get_name" '.users[].name == $name' ./data/user_statistics.json | grep -q true; then
        win_random=$(jq --arg get_name "$get_name" '.users[] | select(.name == $get_name) | .pve_random[].win' ./data/user_statistics.json)
        lose_random=$(jq --arg get_name "$get_name" '.users[] | select(.name == $get_name) | .pve_random[].lose' ./data/user_statistics.json)
        win_impossible=$(jq --arg get_name "$get_name" '.users[] | select(.name == $get_name) | .pve_impossible[].win' ./data/user_statistics.json)
        lose_impossible=$(jq --arg get_name "$get_name" '.users[] | select(.name == $get_name) | .pve_impossible[].lose' ./data/user_statistics.json)

        clear
        echo -e "Here are the statistics for the user $get_name\n\n"
        echo -e "Random bot:\n  wins: $win_random\n  loses: $lose_random"
        echo -e "Impossible bot:\n  wins: $win_impossible\n  loses: $lose_impossible\n"
    else
        echo "User $get_name does not exist"
    fi


    read -n 1 -s -r -p "Press any key to go back"
    home
}