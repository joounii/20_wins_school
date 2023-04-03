#!/bin/bash
. ./logic/create_menu.sh
. ./logic/colors.sh
. ./game/singleplayer/pve_random.sh
. ./game/choose_difficulty.sh

text="$(yellow "Choose the difficulty for this game!")"

home () {

    selected_item=0
    menu_items=("$(magenta "Singleplayer")" "$(red "Exit")")

    run_menu "$selected_item" "${menu_items[@]}"
    menu_result="$?"

    echo

    case "$menu_result"
    in
        0)
            choose_difficulty
            ;;
        1)
            exit 0
            ;;
    esac
}

home