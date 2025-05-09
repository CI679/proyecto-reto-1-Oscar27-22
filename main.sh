#!/bin/bash

parse_line() {
  local line="$1"

  # we do a little of black magic, also called Bash string manipulation
  definition="${line#*.- }" # find last ".- "

  concept="${line%]*}" # find first "]"
  concept="${concept#[}" # find last "["
}

bootstrap() {
  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  dir="$script_dir"/methods
  [[ ! -d "$dir" ]] && mkdir -p "$dir"

  files=("$dir/scrum.inf" "$dir/xp.inf" "$dir/kanban.inf" "$dir/kanban.inf" "$dir/crystal.inf" "$dir/cascade.inf" "$dir/spiral.inf" "$dir/v_model.inf")
  create=()
  for file in "${files[@]}"; do
    [[ ! -f "$file" ]] && create+=("$file")
  done

  [[ ${#create[@]} -eq 0 ]] && return

  echo "The following files were created for the execution of the program:"
  for file in "${create[@]}"; do
    [[ ! -f "$file" ]] && touch "$file" && echo "- Created: $file"
  done
  echo -e "\nTo continue please Press ENTER"
  read
}

add_info() {
  local concept=$1
  local definition=$2
  local method=$3
  local dir=$4

  echo "[$concept] .- $definition " >> "$dir"/"$method".inf &&\
  echo "Entry added:" && echo &&\
  echo "Method: $method" &&\
  echo "Concept: $concept" &&\
  echo "Definition: $definition"
}

search_info() {
  local pattern=$1
  local method=$2
  local dir=$3
  local file="$dir"/"$method".inf

  matches=$(grep -i -E "\[$pattern\]" "$file")

  if [[ -z "$matches" ]]; then
    echo "No resulting matches"
    return
  fi

  echo "Matches found:"
  echo

  while IFS= read -r line; do
    parse_line "$line"
    echo "   $concept"
    echo "   $definition"; echo
  done <<< "$matches"
}

delete_info() {
  local pattern=$1
  local method=$2
  local dir=$3
  local file="$dir"/"$method".inf

  result=$(search_info "$pattern" "$method" "$dir")
  [[ "$result" == "No resulting matches" ]] && echo "No resulting matches" && return

  sed -i "/\[$pattern\] .- /d" "$file"
  echo "$pattern deleted"
}

content_info() {
  local method=$1
  local dir=$2
  local file="$dir"/"$method".inf

  while IFS= read -r line; do
    parse_line "$line"
    echo "Concept:   $concept"
    echo "Definition $definition"; echo
  done < "$file"
}

if [[ "$1" != "-a"  &&  "$1" != "-t" ]]; then
    echo "To use the program $0 you must give the following flags:"
    echo "-a for agile"
    echo "-t for traditional"
    exit 1
fi

bootstrap

submenu(){
    local method=$1
    method_arg=$(echo "$method" | tr '[:upper:]' '[:lower:]')  
    options=("Add Information" "Search" "Delete Information" "Read base of information" "Go back to main menu" "Exit app")

    echo "You are in the ${method} section, please select an option:"
    select option in "${options[@]}"; do
        case $REPLY in
            1)
                echo "Add info to ${method}"; echo
                read -p "Enter a concept: " concept
                read -p "Enter the definition: " definition
                add_info "$concept" "$definition" "$method_arg" "$dir"
                ;;
            2)
                echo "Search info in ${method}"; echo
                read -p "Enter a pattern to search: " pattern
                echo "Searching '${pattern}'..."
                search_info "$pattern" "$method_arg" "$dir"
                ;;
            3)
                echo "Delete concept in ${method}"; echo
                read -p "Enter the identifier to delete: " pattern
                echo "Searching ${pattern}..."
                delete_info "$pattern" "$method_arg" "$dir"
                ;;
            4)
                echo "Contents in ${method}:"; echo
                content_info "$method_arg" "$dir"
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
        echo -e "\nPress Enter to continue\n"; read
        echo "You are in ${method} section, please select an option:"
    done
}

agileMethods=("SCRUM" "XP" "Kanban" "Crystal" "EXIT")
traditionalMethods=("Cascade" "Spiral" "V_Model" "EXIT")

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
