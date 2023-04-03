#!/bin/bash

. ./logic/create_menu.sh
. ./logic/colors.sh

declare -i x=0
declare -i pc=0
text="$(green "The current number is") $(blue "$x")$(green ". Do you want to add") $(blue "1") $(green "or") $(blue "2") $(green "?")"

player_trun () {

    selected_item=0
    menu_items=("$(magenta "add_1")" "$(magenta "add_2")")

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
    esac
}

pc_turn () {
    pc=$((1 + RANDOM % 2))
    x=$((x + pc))
}

while [ $x -lt 20 ]
do
    player_trun

    if [ $x -ge 20 ]; then
            echo "$(yellow "You won!")"
            break
    fi

    pc_turn
    text="$(green "PC added") $(blue "$pc")$(green ". The current number is") $(blue "$x")"

    if [ $x -ge 20 ]; then
            echo -e "$text"
            echo "$(yellow "PC won!")"
            break
    fi

    text="$(green "PC added") $(blue "$pc")$(green ".\nThe current number is") $(blue "$x")$(green ". Do you want to add") $(blue "1") $(green "or") $(blue "2") $(green "?")"
done
