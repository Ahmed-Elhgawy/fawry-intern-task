#! /bin/bash

print_help() {
  echo "Usage $0 [-n] [-v] pattern filename"
  echo ""
  echo "Options"
  echo " -n  --> show the numbers for each match"
  echo " -v  --> invert the match (print lines that don't match)"
  echo " -h  --> show help"  
}

numric=0
inverted=0

while getopts "nvh" opt; do
  case "$opt" in
    n)
      numric=1
      ;;
    v)
      inverted=1
      ;;
    h)
      echo "h"
      ;;
    ?)
      print_help
      ;;
    *)
      echo "ERROR Invalid Input"
      print_help
      ;;
  esac
done

shift $((OPTIND -1))

pattern="$1"
filename="$2"

if [ -z "$pattern" ] || [ -z "$filename" ]; then
  echo "ERROR, too few argument, Missing pattern or filename"
  print_help
  exit 1
fi

if [ ! -f "$filename" ]; then
  echo "ERROR, The File $filename is not exist"
  exit 1
fi

if [ "$numric" -eq 1 ] && [ "$inverted" -eq 1 ]; then
  # print number of lines that doesn't match pattern in file
  awk -v pat="$pattern" 'BEGIN{IGNORECASE=1} $0 !~ pat' "$filename" | wc -l | awk '{print $1}'
elif [ "$numric" -eq 1 ]; then
  # print number of lines that match the patern in file
  awk -v pat="$pattern" 'BEGIN{IGNORECASE=1} $0 ~ pat' "$filename" | wc -l | awk '{print $1}'
elif [ "$inverted" -eq 1 ]; then
  # print lines that doesn't match the patern in file
  awk -v pat="$pattern" 'BEGIN{IGNORECASE=1} $0 !~ pat' "$filename"
else
  # print lines that match the patern in file
  awk -v pat="$pattern" 'BEGIN{IGNORECASE=1} $0 ~ pat' "$filename"
fi
