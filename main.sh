#!/bin/bash

if [ "$1" != "-a" ] && [ "$1" != "-t" ]; then
    echo "To use the program $0 you must give the following flags:"
    echo "-a for agile"
    echo "-t for traditional"
    exit 1
fi

submenu(){
    local method=$1
    echo "You are in ${method} section, please select an option:"
    options=("Add Information" "Search" "Delete Information" "Read base of information" "Go back to main menu" "Exit app")
    select option in "${options[@]}"; do
        case $REPLY in
            1)
                echo "Add info to ${method}"
                ;;
            2) 
                echo "Search info in ${method}"
                ;;
            3)
                echo "Delete concept in ${method}"
                ;;
            4)
                echo "read base of info in ${method}"
                ;;
            5)
                echo "Back to main menu"
                ;;
            6)
                echo "Byeeeee"
                exit 0
                ;;
            *) 
                echo "Invalid option"
                ;;
        esac
    done


}

agileMethods=("SCRUM" "XP" "Kanban" "Crystal" "EXIT")
traditionalMethods=("Cascade" "Spiral" "V Model" "EXIT")

if [ "$1" == "-a" ]; then
    echo "Welcome to the Agile methodologies fast guide, to continue please choose a theme:"
    select method in "${agileMethods[@]}"; do
        case $REPLY in
            1|2|3|4)
                echo "You choosed ${method}"
                submenu "$method"
                ;;
            5)
                echo "Thank you for choosing us"
                echo "Bye"
                exit 0
                ;;
            *)
                echo "Invalid option"
                echo "Please choose an option from 1 to 5"
                ;;
        esac
    done
fi

if [ "$1" == "-t" ]; then
    echo "Welcome to the traditional methodologies fast guide, to continue please choose a theme:"
    select method in "${traditionalMethods[@]}"; do
        case $REPLY in
            1|2|3)
                echo "You choosed ${method}"
                submenu "$method"
                ;;
            4)
                echo "Thank you for seeing Trad methods"
                echo "Bye"
                ;;
            *)
                echo "That's not a valid option"
                echo "Please try again"
                ;;
        esac
    done
fi