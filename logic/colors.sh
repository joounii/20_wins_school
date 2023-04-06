ESC=$(printf '\033') RESET="${ESC}[0m" BLACK="${ESC}[30m" RED="${ESC}[31m" GREEN="${ESC}[32m" YELLOW="${ESC}[33m" BLUE="${ESC}[34m" MAGENTA="${ESC}[35m" CYAN="${ESC}[36m" WHITE="${ESC}[37m" DEFAULT="${ESC}[39m" USER="${ESC}[91m"

green () { printf "${GREEN}%s${RESET}\n" "$1"; }
blue () { printf "${BLUE}%s${RESET}\n" "$1"; }
red() { printf "${RED}%s${RESET}\n" "$1"; }
yellow() { printf "${YELLOW}%s${RESET}\n" "$1"; }
magenta() { printf "${MAGENTA}%s${RESET}\n" "$1"; }
cyan() { printf "${CYAN}%s${RESET}\n" "$1"; }
user() { printf "${USER}%s${RESET}\n" "$1"; }
