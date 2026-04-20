#!/bin/bash

# Function for the root *999# menu
show_main_menu() {
    while true; do
        echo "--------------------------"
        echo "      Ethio Telecom       "
        echo "--------------------------"
        echo "1. Voice package"
        echo "2. Internet package"
        echo "3. My plan"
        echo "--------------------------"
        read -p "Enter choice: " choice

        case $choice in
            1)
                # Calls Member 2, 3, & 4's module
                handle_voice_menu 
                ;;
            2)
                echo "Internet packages coming soon..."
                sleep 2
                clear
                ;;
            3)
                echo "My plan details coming soon..."
                sleep 2
                clear
                ;;
            *)
                echo "Invalid selection."
                sleep 1
                clear
                ;;
        esac
    done
}

# The Voice Package Navigation Flow
handle_voice_menu() {
    clear
    echo "Voice package"
    echo "1. Daily"
    echo "2. Weekly"
    echo "3. Monthly"
    echo "4. No expiry date package"
    echo "5. Package Extender"
    echo "6. Night"
    echo "*. Back"
    echo "**. Main menu"
    echo "--------------------------"
    read -p "Selection: " v_choice

    case $v_choice in
        "*") return ;; # Back to main
        "**") show_main_menu ;;
        1|2|3|4|5|6)
            # This function will be defined in voice.sh (Members 2-4)
            # It should return the price of the selected package
            package_price=$(get_package_details $v_choice)
            
            if [ "$package_price" == "back" ]; then
                handle_voice_menu
            else
                process_phone_entry "$package_price"
            fi
            ;;
        *)
            echo "Invalid option"
            sleep 1
            handle_voice_menu
            ;;
    esac
}

# The "Enter Number" and Confirmation Flow
process_phone_entry() {
    local price=$1
    clear
    echo "Please enter the number"
    echo "**. Main menu"
    read -p "Number: " phone_num

    if [ "$phone_num" == "**" ]; then show_main_menu; fi

    # Confirmation Screen
    while true; do
        clear
        echo "You have entered $phone_num"
        echo "1. Continue"
        echo "2. Change"
        echo "**. Main menu"
        read -p "Selection: " confirm_choice

        case $confirm_choice in
            1)
                # Final Transaction Logic (Connecting to Member 5 & 6)
                current_balance=$(get_balance)
                
                if [ "$current_balance" -ge "$price" ]; then
                    deduct_balance $price
                    save_history "Purchased package for $phone_num - Cost: $price Birr"
                    clear
                    echo "Dear Customer, your order is successfully submitted. You will get SMS notification shortly for confirmation. ethio telecom"
                    read -p "Press OK to exit..."
                    exit 0
                else
                    clear
                    echo "Your balance is insufficient for the package, please recharge and try again later."
                    read -p "Press OK to exit..."
                    exit 0
                fi
                ;;
            2)
                process_phone_entry "$price" # Restart phone entry
                return
                ;;
            "**")
                show_main_menu
                ;;
        esac
    done
}