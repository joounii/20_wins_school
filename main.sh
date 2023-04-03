#!/bin/bash

. ./logic/create_menu.sh
. ./logic/colors.sh
. ./game/choose_difficulty.sh

home () {
    selected_item=0
    menu_items=('Login' 'Register' 'Guest' 'Exit')

    run_menu "$selected_item" "${menu_items[@]}"
    menu_result="$?"

    echo

    case "$menu_result"
    in
        0)
            echo 'Login item selected'
            ;;
        1)
            echo 'Register item selected'
            ;;
        2)
            echo 'Guest item selected'
            ;;
        3)
            echo 'Exit item selected'
            ;;
    esac
}