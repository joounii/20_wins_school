#!/bin/bash
. ./logic/create_menu.sh
. ./logic/colors.sh
. ./game/singleplayer/pve_random.sh

text1="$(yellow "Choose the difficulty for this game!")"

choose_difficulty () {

    declare -i transport=0

    selected_item=0
    menu_items=("$(magenta "Random")" "$(blue "Back")")

    run_menu "$selected_item" "${menu_items[@]}"
    menu_result="$?"

    echo

    case "$menu_result"
    in
        0)
            pve_random
            ;;
        1)
            home
            ;;
    esac
}

choose_difficulty