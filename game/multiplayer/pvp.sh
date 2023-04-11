#!/bin/bash

pvp_start () {
    declare -i x=0
    clear
    echo "$(yellow "Please enter the name of the second:")"
    read player_two
    
    if jq --arg name "$player_two" '.users[].name == $name' ./data/user_statistics.json | grep -q "true"; then
        echo "User $player_two already exists"
    else
        # Add the new user
        jq --arg name "$player_two" '.users += [{"name": $name, "pve_easy": [{"win": 0, "lose": 0}], "pve_hard": [{"win": 0, "lose": 0}], "pve_random": [{"win": 0, "lose": 0}], "pve_impossible": [{"win": 0, "lose": 0}]}]' ./data/user_statistics.json > ./data/temp.json && mv ./data/temp.json ./data/user_statistics.json
        echo "User $player_two added"
    fi

    who_starts=$((1 + RANDOM % 2))
    echo $who_starts
    if [ $who_starts == 1 ]; then
        player_one
    else
        player_two
    fi
}

player_one () {
    text="$(green "It's $name's turn")\n$(green "The current number is") $(blue "$x")$(green ". Do you want to add") $(blue "1") $(green "or") $(blue "2") $(green "?")"

    player_trun

    text="$(yellow "$name won!")"

    if [ $x -ge 20 ]; then
        echo -e "$text"
        statistics_pc_won=$((statistics_pc_won + 1))
        jq --arg name "$name" '.users |= map(if .name == $name then .pvp[0].win += 1 else . end)' ./data/user_statistics.json > tmpfile && mv tmpfile ./data/user_statistics.json
        jq --arg name "$player_two" '.users |= map(if .name == $name then .pvp[0].lose += 1 else . end)' ./data/user_statistics.json > tmpfile && mv tmpfile ./data/user_statistics.json
        
        read -n 1 -s -r -p "Press any key to continue"
        home
    else
        player_two
    fi
}

player_two () {
    text="$(green "It's $player_two's turn")\n$(green "The current number is") $(blue "$x")$(green ". Do you want to add") $(blue "1") $(green "or") $(blue "2") $(green "?")"

    player_trun

    text="$(yellow "$player_two won!")"

    if [ $x -ge 20 ]; then
        echo -e "$text"
        statistics_pc_won=$((statistics_pc_won + 1))
        jq --arg name "$player_two" '.users |= map(if .name == $name then .pvp[0].win += 1 else . end)' ./data/user_statistics.json > tmpfile && mv tmpfile ./data/user_statistics.json
        jq --arg name "$name" '.users |= map(if .name == $name then .pvp[0].lose += 1 else . end)' ./data/user_statistics.json > tmpfile && mv tmpfile ./data/user_statistics.json
        
        read -n 1 -s -r -p "Press any key to continue"
        home
    else
        player_one
    fi
}
