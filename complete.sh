#!/bin/bash
set -eEuo pipefail

#--------------------
# Error handling
#--------------------

trap 'echo -e "\e[1;31m Error occurred in script: $BASH_SOURCE at line $LINENO. Command: $BASH_COMMAND\e[0m"' ERR

#--------------------
# Get the directory where this script is located
#--------------------

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/WorryDolls/AsciiEscapeColorNord/color"
PREP_DIR="$SCRIPT_DIR/preflight"
export PATH="$SCRIPT_DIR/bin:$PATH"

#--------------------
# ASCII Logo
#--------------------

x3ck_LOGO="
${NORD10}            ░██████             ░██       
${NORD10}           ░██   ░██            ░██       
${NORD9}░██    ░██       ░██  ░███████  ░██    ░██
${NORD9} ░██  ░██    ░█████  ░██    ░██ ░██   ░██ 
${NORD4}  ░█████         ░██ ░██        ░███████  
${NORD4} ░██  ░██  ░██   ░██ ░██    ░██ ░██   ░██ 
${NORD4}░██    ░██  ░██████   ░███████  ░██    ░██
${RESET}                                          
"
#--------------------
# Print logo first
#--------------------

printf "%b\n" "$x3ck_LOGO"

source "$SCRIPT_DIR/WorryDolls/scripts/greeting"
#--------------------
# Ask for sudo password once at the beginning (cache it)
#--------------------

sudo -v

#--------------------
# Ensure yay is installed
#--------------------
source "$PREP_DIR/yayinstall"
source "$PREP_DIR/apps.sh"
source "$SCRIPT_DIR/TeddyBear/config"
source "$SCRIPT_DIR/TeddyBear/rc"
source "$SCRIPT_DIR/TeddyBear/fonts"
source "$SCRIPT_DIR/TeddyBear/scripts"
