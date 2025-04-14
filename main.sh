#!/bin/bash

if [ "$1" != "-a" ] && [ "$1" != "-t" ]; then
    echo "To use the program $0 you must give the following flags:"
    echo "-a for agile"
    echo "-t for traditional"
    exit 1
fi

agileMethods=("SCRUM" "XP" "Kanban" "Crystal" "EXIT")
traditionalMethods=("Cascade" "Spiral" "V Model" "EXIT")

if [ "$1" == "-a" ]; then
    select method in "${agileMethods[@]}"; do
        case $REPLY in
            1|2|3|4)
                echo "You choosed ${method}"
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
    select method in "${traditionalMethods[@]}"; do
        case $REPLY in
            1|2|3)
                echo "Youd choose ${method}"
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