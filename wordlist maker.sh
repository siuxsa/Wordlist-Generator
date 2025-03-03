#!/bin/bash

# ASCII Banner
banner() {
    echo -e "${CYAN}"
    echo "███████╗  ██╗  ██╗  ██████╗  ███████╗ ██╗  ███████╗ "
    echo "██╔════╝  ██║  ██║ ██╔═══██╗ ██╔══██╝ ██║  ██╔════╝ "
    echo "███████╗  ███████║ ██║   ██║ ███████╗ ██║  ███████╗  "
    echo "╚════██║  ██╔══██║ ██║   ██║ ██╔══██║ ██║  ██╔════╝ "
    echo "███████║  ██║  ██║ ╚██████╔╝ ██║  ██║ ██║  ██║      "
    echo "╚══════╝  ╚═╝  ╚═╝  ╚═════╝  ╚═╝  ╚═╝ ╚═╝  ╚═╝       "
    echo -e "${RESET}"
    echo -e "${YELLOW}Wordlist Making Tool By SA_SHORIF${RESET}" 
}

show_help() {
    echo "Usage: $0 -l <input_file> -o <output_file>"
    echo "Options:"
    echo "  -l    Specify the input file containing URLs"
    echo "  -o    Specify the output file name"
    echo "  -h    Show this help message"
    exit 0
}

# Show banner when the tool runs
banner

# Check if no arguments are provided
if [ $# -eq 0 ]; then
    show_help
fi

while getopts "l:o:h" opt; do
    case $opt in
        l) input_file="$OPTARG" ;;
        o) output_file="$OPTARG" ;;
        h) show_help ;;
        *) show_help ;;
    esac
done

if [ -z "$input_file" ]; then
    echo "Error: Input file is required."
    show_help
fi

declare -A unique_words

while read -r url; do
    path="${url#*://}"
    path="${path#*/}"
    
    IFS='/' read -ra parts <<< "$path"
    if [ ${#parts[@]} -gt 3 ]; then
        for ((i=3; i<${#parts[@]}; i++)); do
            word="${parts[i]}"
            word="${word%%.*}"  # Remove file extensions
            unique_words["$word"]=1
        done
    fi

done < "$input_file"

if [ -n "$output_file" ]; then
    printf "%s\n" "${!unique_words[@]}" | sort > "$output_file"
    echo "Wordlist saved to $output_file"
else
    printf "%s\n" "${!unique_words[@]}" | sort
fi
