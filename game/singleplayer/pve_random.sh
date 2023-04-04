#!/bin/bash

player_trun () {

    selected_item=0
    menu_items=("$(magenta "Add_1")" "$(magenta "Add_2")" "$(blue "Back")")

    run_menu "$selected_item" "${menu_items[@]}"
    menu_result="$?"

    echo

    case "$menu_result"
    in
        0)
            x=$(( x + 1 ))
            ;;
        1)
            x=$(( x + 2 ))
            ;;
        2)
            stop_loop=true
            ;;
    esac
    
}

pc_turn () {
    pc=$((1 + RANDOM % 2))
    x=$((x + pc))
}

pve_random () {
    key=""
    stop_loop=false
    declare -i transport=0
    declare -i x=0
    declare -i pc=0
    text="$(green "The current number is") $(blue "$x")$(green ". Do you want to add") $(blue "1") $(green "or") $(blue "2") $(green "?")"

    while [ $x -lt 20 ] && [ $stop_loop != true ]
    do
        player_trun

        if [ $x -ge 20 ]; then
                echo "$(yellow "You won!")"
                statistics_player_won=$((statistics_player_won + 1))
                jq --arg name "$name" '.users |= map(if .name == $name then .pve_random[0].win += 1 else . end)' ./data/user_statistics.json > tmpfile && mv tmpfile ./data/user_statistics.json
                save_statistics
                break
        fi

        pc_turn
        text="$(green "PC added") $(blue "$pc")$(green ". The current number is") $(blue "$x")"

        if [ $x -ge 20 ]; then
                echo -e "$text"
                echo "$(yellow "PC won!")"
                statistics_pc_won=$((statistics_pc_won + 1))
                jq --arg name "$name" '.users |= map(if .name == $name then .pve_random[0].lose += 1 else . end)' ./data/user_statistics.json > tmpfile && mv tmpfile ./data/user_statistics.json
                save_statistics
                break
        fi

        text="$(green "PC added") $(blue "$pc")$(green ".\nThe current number is") $(blue "$x")$(green ". Do you want to add") $(blue "1") $(green "or") $(blue "2") $(green "?")"
    done
    
    read -n 1 -s -r -p "Press any key to continue"
    home
}
