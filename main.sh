#!/bin/bash
. ./logic/create_menu.sh
. ./logic/colors.sh
. ./game/singleplayer/pve_random.sh
. ./game/choose_difficulty.sh
. ./pages/login.sh
. ./data/statistics.sh
. ./initialize/install_utilities.sh
. ./pages/home.sh
. ./pages/statistics.sh

save_statistics() {
    for i in "${!statistics_@}"; do
        printf '%s=%q\n' "$i" "${!i}"
    done > data/statistics.sh
}

save_user_statistics() {
    for i in "${!user_@[@]}"; do
        printf '%s=%q\n' "$i" "${!i}"
    done > data/user_statistics.sh

}

install_utilities
save_statistics
home