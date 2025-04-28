# Custom Command (mygrep.sh)
`mygrep.sh` is a Bash script designed to mimic a simplified version of the `grep` command. \
It provides basic functionality for searching a string within a single file and printing matching lines. 

### Features
- Basic Search: Search for a string (case-insensitive by default) within a file.
- Show Line Numbers: Optionally display the line numbers of matches.
- Invert Match: Optionally display lines that do not match the search pattern.
- Help Menu: Provide usage instructions.

### Command Options 
|Option	|Description|
|-------|-----------|
|`-n`	|Show line numbers for each matching line|
|`-v`	|Invert match (display non-matching lines)|
|`-h`	|Display help message and usage instructions|

## Argument and Option Handling
The script uses the `getopts` command to parse options and option arguments.
- __Option Parsing:__
  - `getopts` assigns the current option to a default variable (`opt`).
  - `OPTIND` is used to track the index of the next positional argument after options.
  - A `case` statement defines the behavior for each supported option.
  - `if` statements handle command execution depending on the selected options.
- __Argument Handling:__
  - __Positional parameters__ are used to retrieve the search pattern and the filename:
    - `$1` → search pattern
    - `$2` → filename
  - `if` statements validate:
    - That the required arguments are provided.
    - That the specified file exists.
- __Pattern Matching:__
  - The `awk` command is used to search the file for lines matching the given pattern, simulating the behavior of `grep`.

## Future Enhancements (Support for -i, -c, -l, and Regular Expressions)
If additional options such as -i, -c, or -l were to be supported:
- New options would be added to the `getopts` string.
- Additional `if` or `case` blocks would handle the logic for each new option.
- To avoid code duplication:
  - Common actions would be extracted into separate functions.
  - Functions would be called appropriately depending on the selected options.
