# Custom Command (mygrep.sh)
mygrep.sh is a bash script used to mimic a mini version of the grep command. \
Its basic functionality is searching for a string (case-insensitive) in a single file and print the matching line in this file

### Command Options
`-n` - - > Show line numbers for each match \
`-v` - - > Invert the match (print lines that do not match)

## How the script handles arguments and options.
To handle options in the script, the `getopts` command has been used to retrieve options and option-arguments from a list of parameters, the command is storing the value of option in default variable called __opt__, in additional to __OPTIND__ that stores the value of arguments that entered after the options, and using case statement to define which option has been used and what to in each case, in additional to if statement to define the command that runs depending on the option has been used. \
To handle the arguments in the script, using __positional parameters__ to get the arguments when running the script as `$1` defines the patterns and `$2` defines the filename, and using if statement to check if the user has been entered the arguments correctly, also to check if the file exists or not. 
