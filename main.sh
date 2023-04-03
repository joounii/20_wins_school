#!/bin/bash
. ./logic/create_menu.sh
. ./logic/colors.sh
. ./game/singleplayer/pve_random.sh
. ./game/choose_difficulty.sh
. ./pages/login.sh

text="$(yellow "Please Log In befor you start playing")"

home () {

    if [ -f "data/login.txt" ]; then
        name=$(cat ./data/login.txt)
        text="$(yellow "Hello $name. What would you like to do?")"
        selected_item=0
        menu_items=("$(magenta "Singelplayer")" "$(cyan "Log_Out")" "$(red "Exit")")

        run_menu "$selected_item" "${menu_items[@]}"
        menu_result="$?"

        echo

        case "$menu_result"
        in
            0)
                choose_difficulty
                ;;
            1)
                rm ./data/login.txt
                home
                ;;
            2)
                clear
                exit 0
                ;;
        esac
    else
        selected_item=0
        menu_items=("$(cyan "Log_In")" "$(red "Exit")")

        run_menu "$selected_item" "${menu_items[@]}"
        menu_result="$?"

        echo

        case "$menu_result"
        in
            0)
                login
                ;;
            1)
                exit 0
                ;;
        esac
    fi
}

home