#!/bin/bash
# NanoPad utility helps you to manage notes in MD format from CLI.
# Created with help from ChatGPT.

notes_dir="$HOME/.nanopad"
mkdir -p "$notes_dir"

# Function to display note explorer
function show_explorer() {
    clear
    echo "Note Explorer"
    echo "-------------"
    local file_list=($(find "$notes_dir" -type f -name "*.md" | sort -r))
    if [ ${#file_list[@]} -eq 0 ]; then
        echo "No notes found. Create a new one."
        read -p "Enter note name: " note_name
        save_path="$notes_dir/$note_name"
        if [[ $note_name != *.md ]]; then
            save_path="$notes_dir/$note_name.md"
        fi
        nano "$save_path"
    else
        PS3="Select note to edit or choose an action: "
        options=("Create New Note")
        for file in "${file_list[@]}"; do
            relative_path=${file#$notes_dir/}
            modified_date=$(date -r "$file" "+%Y-%m-%d %H:%M:%S")
            options+=("$relative_path - Last Modified: $modified_date")
        done
        options+=("Remove Note" "Quit")
        select option in "${options[@]}"; do
            case $option in
                "Create New Note")
                    read -p "Enter note name: " note_name
                    save_path="$notes_dir/$note_name"
                    if [[ $note_name != *.md ]]; then
                        save_path="$notes_dir/$note_name.md"
                    fi
                    nano "$save_path"
                    break
                    ;;
                "Remove Note")
                    remove_note
                    break
                    ;;
                "Quit")
                    break 2
                    ;;
                *)
                    file_path=$(echo "$option" | cut -d' ' -f1)
                    nano "$notes_dir/$file_path"
                    break
                    ;;
            esac
        done
    fi
}

# Function to remove a note
function remove_note() {
    clear
    echo "Remove Note"
    echo "-----------"
    local file_list=($(find "$notes_dir" -type f -name "*.md" | sort -r))
    if [ ${#file_list[@]} -eq 0 ]; then
        echo "No notes to remove."
    else
        PS3="Select note to remove or go back: "
        options=()
        for file in "${file_list[@]}"; do
            relative_path=${file#$notes_dir/}
            options+=("$relative_path")
        done
        options+=("Go Back")
        select option in "${options[@]}"; do
            case $option in
                "Go Back")
                    break
                    ;;
                *)
                    rm "$notes_dir/$option"
                    echo "Note removed: $option"
                    break
                    ;;
            esac
        done
    fi
}

# Main logic
if [ $# -eq 0 ]; then
    while true; do
        show_explorer
    done
else
    note_path="$1"
    if [ ! -f "$notes_dir/$note_path" ]; then
        mkdir -p "$(dirname "$notes_dir/$note_path")"
        touch "$notes_dir/$note_path"
    fi
    nano "$notes_dir/$note_path"
    show_explorer
fi
