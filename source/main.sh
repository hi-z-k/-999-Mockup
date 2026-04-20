#!/bin/bash

# Import modules (to be created by other members)
source ./menu.sh
source ./voice.sh
source ./balance.sh
source ./utils.sh

# Initialize data if not exists
if [ ! -f "data.txt" ]; then
    echo "500" > data.txt # Starting balance of 500 Birr
fi

if [ ! -f "history.txt" ]; then
    touch history.txt
fi

# Clear screen and start the USSD simulation
clear
show_main_menu