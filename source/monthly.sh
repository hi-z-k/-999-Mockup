#!/bin/bash

monthly_voice_package_p1() {
    echo "Monthly"
    echo "1. Birr 50 for 125 Min+63 Min Night bonus"
    echo "2. Birr 75 for 190 Min+95 Min Night bonus"
    echo "3. Birr 100 for 270 Min+135 Min Night bonus"
    echo "#. Next page"

    read choice

    case $choice in
        1) process_selection 125 50 ;;
        2) process_selection 190 75 ;;
        3) process_selection 270 100 ;;
        \#) monthly_voice_package_p2 ;;
        \*) handle_voice_menu ;;   
        \*\*) show_main_menu ;;    
        *) echo "Invalid choice."
        monthly_voice_package_p1 ;;
    esac
}


monthly_voice_package_p2() {
    echo "4. Birr 165 fo 525Min+263 Min Night bonus"
    echo "5. Birr 250 for 810Min+405 Min Night bonus"
    echo "6. Birr 555 for 2000Min+1000 Min Night bonus"
    echo "*. Back"
    echo "**. Main Menu"
    echo "##. Previous page"

    read choice

    case $choice in
        4) process_selection 525 165 ;;
        5) process_selection 810 250 ;;
        6) process_selection 2000 555 ;;
        \*) handle_voice_menu ;;             
        \*\*) show_main_menu ;;               
        \#\#) monthly_voice_package_p1 ;;     
        *) echo "Invalid choice."
        monthly_voice_package_p2 ;;
    esac
}


nightly_voice_package() {
    echo "Nightly Voice Packages: "
    echo "1. 5 birr - 30 minutes (Night Only)"
    echo "2. 10 birr - 70 minutes (Night Only)"
    echo "*. Return"
    echo "**. Main Menu"

    read choice

    case $choice in
        1) process_selection 30 5 ;;
        2) process_selection 70 10 ;;
        \*) handle_voice_menu ;;   
        \*\*) show_main_menu ;;    
        *) echo "Invalid choice."
        nightly_voice_package ;;
    esac
}
