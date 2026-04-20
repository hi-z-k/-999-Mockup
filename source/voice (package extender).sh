#!/bin/bash

# Package extender
package_extender() {
    echo "Voice extender for 5 days"
    echo "1. Br.22 for 80min"
    echo "*. Back"
    echo "**. Main Menu"

    read -p "Selection: " choice

    case $choice in
        1)
            cost=22
            minutes=80

            # Confirmation screen (from image)
            echo "You have chosen to purchase a package"
            echo "To confirm press 1"
            echo "To cancel press other key"
            echo "**. Main menu"

            read -p "Selection: " confirm

            if [ "$confirm" = "1" ]; then

              
                deduct_balance "$cost" "$PHONE_NUMBER"

                if [ $? -eq 0 ]; then
                    echo "Your package is extended by 5 days with $minutes minutes."

                    save_history "Extended package: $minutes minutes - $cost birr"

                elif [ $? -eq 1 ]; then
                    echo "Phone number not found."

                elif [ $? -eq 2 ]; then
                    echo "Insufficient balance."

                else
                    echo "An error occurred while processing your request."
                fi

            elif [ "$confirm" = "**" ]; then
                show_main_menu

            else
                echo "Package extension cancelled."
            fi

            ;;
        "*")
            handle_voice_menu
            ;;
        "**")
            show_main_menu
            ;;
        *)
            echo "Invalid option"
            sleep 1
            package_extender
            ;;
    esac
}