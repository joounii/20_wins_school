#!/bin/bash

easy_turn () {
    if [ $x == 4 ] || [ $x == 7 ] || [ $x == 10 ] || [ $x == 13 ] || [ $x == 16 ] || [ $x == 19 ]; then
        pc=2
    else 
        pc=1
    fi

    x=$(( x + pc ))
}

pve_easy () {
    key=""
    stop_loop=false
    declare -i transport=0
    declare -i x=0
    declare -i pc=0
    text="$(green "The current number is") $(blue "$x")$(green ". Do you want to add") $(blue "1") $(green "or") $(blue "2") $(green "?")"

    while [ $x -lt 20 ] && [ $stop_loop != true ]
    do
        
        easy_turn

        text="$(green "PC added") $(blue "$pc")$(green ". The current number is") $(blue "$x")"

        if [ $x -ge 20 ]; then
                echo -e "$text"
                echo "$(yellow "PC won!")"
                statistics_pc_won=$((statistics_pc_won + 1))
                jq --arg name "$name" '.users |= map(if .name == $name then .pve_easy[0].lose += 1 else . end)' ./data/user_statistics.json > tmpfile && mv tmpfile ./data/user_statistics.json
                save_statistics
                break
        fi

        text="$(green "PC added") $(blue "$pc")$(green ".\nThe current number is") $(blue "$x")$(green ". Do you want to add") $(blue "1") $(green "or") $(blue "2") $(green "?")"

        player_trun

        if [ $x -ge 20 ]; then
                echo "$(yellow "You won!")"
                statistics_player_won=$((statistics_player_won + 1))s
                jq --arg name "$name" '.users |= map(if .name == $name then .pve_easy[0].win += 1 else . end)' ./data/user_statistics.json > tmpfile && mv tmpfile ./data/user_statistics.json
                save_statistics
                break
        fi
    done
    
    read -n 1 -s -r -p "Press any key to continue"
    home
}
