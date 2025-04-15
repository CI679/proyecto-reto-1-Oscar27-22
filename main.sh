#!/bin/bash

source bootstrap
source add_info

if [[ "$1" != "-a"  &&  "$1" != "-t" ]]; then
    echo "To use the program $0 you must give the following flags:"
    echo "-a for agile"
    echo "-t for traditional"
    exit 1
fi

bootstrap

submenu(){
    local method=$1
    echo "You are in the ${method} section, please select an option:"
    options=("Add Information" "Search" "Delete Information" "Read base of information" "Go back to main menu" "Exit app")
    select option in "${options[@]}"; do
        case $REPLY in
            1)
                echo "Add info to ${method}"
                read -p "Enter a concept: " concept
                read -p "Enter the definition: " definition
                echo "concept: ${concept}"
                echo "definition: ${definition}"
                add_info "$concept" "$definition" "$method"
                ;;
            2)
                echo "Search info in ${method}"
                read -p "Enter the identifier to search: " searchID
                echo "Searching ${searchID}"
                ;;
            3)
                echo "Delete concept in ${method}"
                read -p "Enter the identifier to delete: " deleteID
                echo "Searching ${deleteID}"
                ;;
            4)
                echo "read base of info in ${method}"
                ;;
            5)
                echo "Back to main menu"
                return
                ;;
            6)
                echo "Thank you for choosing us"
                echo "Have a good day"
                exit 0
                ;;
            *)
                echo "Invalid option"
                ;;
        esac
        echo -e "\nPress Enter to continue"
        read
        echo ""
        echo "You are in ${method} section, please select an option:"
    done

}

agileMethods=("SCRUM" "XP" "Kanban" "Crystal" "EXIT")
traditionalMethods=("Cascade" "Spiral" "V Model" "EXIT")

if [[ "$1" == "-a" ]]; then
    echo "Welcome to the Agile methodologies fast guide, to continue please choose a theme:"
    select method in "${agileMethods[@]}"; do
        case $REPLY in
            1|2|3|4)
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
        echo -e "\nTo continue please Press ENTER"
        read
        echo "Welcome to the Agile methodologies fast guide, to continue please choose a theme:"
    done
fi

if [[ "$1" == "-t" ]]; then
    echo "Welcome to the traditional methodologies fast guide, to continue please choose a theme:"
    select method in "${traditionalMethods[@]}"; do
        case $REPLY in
            1|2|3)
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
        echo -e "\nTo continue please Press ENTER"
        read
        echo "Welcome to the Traditional methodologies fast guide, to continue please choose a theme:"
    done
fi
