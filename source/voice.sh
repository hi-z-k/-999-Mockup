#!/bin/bash

# Daily Voice Package Management
daily_voice_package() {
    echo "Daily Voice Packages: "
    echo "1. 5 birr - 20 minutes with 10 minute free night package"
    echo "2. 10 birr - 42 minutes with 21 minute free night package"
    echo "3. 15 birr - 65 minutes with 33 minute free night package"
    echo "4. 20 birr - 88 minutes with 44 minute free night package"
    echo "*. Return"
    echo "**. Main Menu"

    read choice

    case $choice in
        1) process_selection 20 5 ;;
        2) process_selection 42 10 ;;
        3) process_selection 65 15 ;;
        4) process_selection 88 20 ;;
        \*) handle_voice_menu ;;   # go back
        \*\*) show_main_menu ;;    # go to main menu
        *) echo "Invalid choice."
        daily_voice_package ;;
    esac
}

#Weekly Voice Package Management
weekly_voice_package() {
    echo "Weekly Voice Packages: "
    echo "1. 25 birr - 70 minutes with 35 minute free night package"
    echo "2. 35 birr - 110 minutes with 55 minute free night package"
    echo "3. 45 birr - 145 minutes with 73 minute free night package"
    echo "*. Return"
    echo "**. Main Menu"
    read choice

    case $choice in
        1) process_selection 70 25 ;;
        2) process_selection 110 35 ;;
        3) process_selection 145 45 ;;
        \*) handle_voice_menu ;;   # go back
        \*\*) show_main_menu ;;    # go to main menu
        *) echo "Invalid choice." 
        weekly_voice_package ;;
    esac
}

# Shared Function
process_selection() {
    minutes="$1"
    cost="$2"

    echo "You selected a package with $minutes minutes at a cost of $cost birr."
    echo "1. Confirm"
    echo "2. Cancel"

    read confirm

    if [ "$confirm" = "1" ]; then
        deduct_balance "$cost" "$PHONE_NUMBER"

        if [ $? -eq 0 ]; then
            echo "Package purchased successfully! You have $minutes minutes available."

            save_history "Bought $minutes minutes - $cost birr"
        elif [ $? -eq 1 ]; then
            echo "Phone number not found."
        elif [ $? -eq 2 ]; then
            echo "Insufficient balance."
        else
            echo "An error occurred while processing your request."
        fi
    else
        echo "Package purchase cancelled."
    fi
}