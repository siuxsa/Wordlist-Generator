# Wordlist Maker

![Bash](https://img.shields.io/badge/Language-Bash-4EAA25) ![Contributions](https://img.shields.io/badge/Contributions-Welcome-brightgreen)

A Bash script to extract unique words from URLs, perfect for creating custom wordlists for penetration testing or data analysis.

## Features

- **URL Parsing**: Extracts path segments after the domain (third `/`).
- **Extension Removal**: Strips common file extensions (e.g., `.js`, `.php`, `.html`).
- **Duplicate Filtering**: Automatically removes duplicate entries.
- **Input/Output Support**: Specify custom input and output files.
- **User-Friendly**: Includes a help menu and execution banner.

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/siuxsa/Wordlist-Generator.git
   cd Wordlist-Generator
   ```

2. **Make the Script Executable**:
   ```bash
   chmod +x wordlist maker.sh
   ```
3. **Usage**
   ```bash
   ./wordlist maker.sh -l <input_file> -o <output_file>
   ```
## How It Works

 - Extract Paths: Removes the domain (everything before the third /).

 - Remove Extensions: Strips file extensions like .js, .jpg, etc.

 - Split Words: Breaks path segments into words using /, -, and _ as delimiters.

 - Deduplicate: Sorts and removes duplicates for a clean output.
