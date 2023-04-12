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
        win_easy=$(jq --arg get_name "$get_name" '.users[] | select(.name == $get_name) | .pve_easy[].win' ./data/user_statistics.json)
        lose_easy=$(jq --arg get_name "$get_name" '.users[] | select(.name == $get_name) | .pve_easy[].lose' ./data/user_statistics.json)
        win_hard=$(jq --arg get_name "$get_name" '.users[] | select(.name == $get_name) | .pve_hard[].win' ./data/user_statistics.json)
        lose_hard=$(jq --arg get_name "$get_name" '.users[] | select(.name == $get_name) | .pve_hard[].lose' ./data/user_statistics.json)
        win_pvp=$(jq --arg get_name "$get_name" '.users[] | select(.name == $get_name) | .pve_pvp[].win' ./data/user_statistics.json)
        lose_pvp=$(jq --arg get_name "$get_name" '.users[] | select(.name == $get_name) | .pve_pvp[].lose' ./data/user_statistics.json)

        clear
        echo -e "Here are the statistics for the user $get_name\n\n"
        echo -e "Easy bot:\n  wins: $win_impossible\n  loses: $lose_impossible\n"
        echo -e "Hard bot:\n  wins: $win_impossible\n  loses: $lose_impossible\n"
        echo -e "Random bot:\n  wins: $win_random\n  loses: $lose_random\n"
        echo -e "Impossible bot:\n  wins: $win_impossible\n  loses: $lose_impossible\n"
        echo -e "PVP:\n  wins: $win_impossible\n  loses: $lose_impossible\n"
    else
        echo "User $get_name does not exist"
    fi


    read -n 1 -s -r -p "Press any key to go back"
    home
}