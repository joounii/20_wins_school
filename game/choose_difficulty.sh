#!/bin/bash

text="$(yellow "Choose the difficulty for this game!")"

choose_difficulty () {

    declare -i transport=0

    selected_item=0
    menu_items=("$(magenta "Easy")" "$(magenta "Hard")" "$(magenta "Random")" "$(magenta "Impossible")" "$(blue "Back")")

    run_menu "$selected_item" "${menu_items[@]}"
    menu_result="$?"

    echo

    case "$menu_result"
    in
        0)
            pve_easy
            ;;
        1)
            pve_hard
            ;;
        2)
            pve_random
            ;;
        3)
            pve_impossible
            ;;
        4)
            home
            ;;
    esac
}
