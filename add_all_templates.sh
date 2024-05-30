#!/usr/bin/bash

: '
    Description :
        This script will add or update all templates in the current directory and its subdirectories.
'

# This script will add or update all templates in the current directory and its subdirectories
process_directory() {

    local dir="$1"

    for d in "$dir"/*; do

        if [ -d "$d" ]; then

            if [ -d "$d/template" ] || [ -f "$d/project.json" ]; then

                echo "Adding template: $d"
                template_name=$(basename "$d")
                echo "With template name: $d"

                # Save the template to boilr
                boilr template save -f "$d" "$template_name"

            else

                echo "Entering $d"
                cd "$d" || exit
                cd ..
                process_directory "$d"

            fi
        fi
    done
}

# Start processing the current directory
process_directory .
