#!/usr/bin/bash

: '
    Description :
        This script will add or update all templates in the current directory and its subdirectories.
'

# This script will add or update all templates in the current directory and its subdirectories
process_directory() {
  local dir="$1"

  for d in "$dir"/*; do
    [[ -d "$d" ]] || continue

    if [[ -d "$d/template" && -f "$d/project.json" ]]; then
      local template_name
      template_name="$(basename "$d")"

      echo "Adding template: $d"
      echo "Template name: $template_name"

      boilr template save -f "$d" "$template_name"
    else
      process_directory "$d"
    fi
  done
}

process_directory .
