#!/bin/bash

output_file="dup.txt"

while true; do
    clear
    echo "Duplicate File Finder "
    echo "------------------------------------"
    echo "1) Scan Directory for Duplicates"
    echo "2) Show Duplicate Files"
    echo "3) Exit"
    echo "------------------------------------"
    read -p "Enter your choice (1-3): " choice

    case $choice in
        1)
            read -p "Enter folder path to scan: " folder
            echo "Scanning for duplicate files..."
            tempfile=$(mktemp)
            find "$folder" -type f -exec md5 {} \; | awk -F'= ' '{print $2 "  " $1}' | sort > "$tempfile"
            awk '{
                if ($1 == prev_hash) {
                    print prev_file "\n" $2 "\n"
                }
                prev_hash=$1
                prev_file=$2
            }' "$tempfile" > "$output_file"
            echo "Scan complete. Results saved to $output_file."
            ;;
        2)
            if [ -s "$output_file" ]; then
                echo "Duplicate Files Found:"
                cat "$output_file"
            else
                echo "No duplicates found or scan not run yet."
            fi
            ;;
        3)
            echo "Exiting program."
            break
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac

    echo ""
    read -p "Press Enter to continue..."
done
