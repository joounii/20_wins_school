#!/bin/bash

home () {

    text="$(yellow "Please Log In befor you start playing")"

    if [ -f "data/login.txt" ]; then
        name=$(cat ./data/login.txt)
        text="$(yellow "Hello $name. What would you like to do?")"
        selected_item=0
        menu_items=("$(magenta "Singelplayer")" "$(magenta "PVP")" "$(cyan "Statistics")" "$(blue "Log_Out")" "$(red "Exit")")

        run_menu "$selected_item" "${menu_items[@]}"
        menu_result="$?"

        echo

        case "$menu_result"
        in
            0)
                choose_difficulty
                ;;
            1)
                pvp_start
                ;;
            2)
                statistic_page
                ;;
            3)
                rm ./data/login.txt
                home
                ;;
            4)
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