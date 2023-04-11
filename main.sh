#!/bin/bash
. ./logic/create_menu.sh
. ./logic/colors.sh
. ./game/singleplayer/pve_easy.sh
. ./game/singleplayer/pve_hard.sh
. ./game/singleplayer/pve_random.sh
. ./game/singleplayer/pve_impossible.sh
. ./game/choose_difficulty.sh
. ./pages/login.sh
. ./data/statistics.sh
. ./initialize/install_utilities.sh
. ./pages/home.sh
. ./pages/statistics.sh
. ./game/multiplayer/pvp.sh

install_utilities
home