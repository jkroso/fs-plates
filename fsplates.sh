#!/usr/bin/env bash

usage(){
  echo
  echo "  Usage: fsplate <template> [destination]"
  echo
  echo "  Options:"
  echo
  echo "    -f, --force    write over any existing files"
  echo "    -h, --help     show this help message"
  echo "    -V, --version  print version number"
  echo
  echo "  Note: you will be prompted for any values not in config"
  echo "  and no files will be overwritten without your confirmation"
  echo
  echo "  Examples: "
  echo
  echo "    # simple one file"
  echo "    \$ fsplate Makefile"
  echo
  echo "    # target a sub-directory"
  echo "    \$ fsplate component myproject"
  echo
}

parse_vars(){
  cat | grep -o {{[^}]*}} | sed -e 's/^{{//' -e 's/}}$//'
}

substitute(){
  local str=$(cat)
  for var in $(echo $str | grep -o {{[^}]*}}); do
    key="${var:2:-2}"
    str="$(echo "$str" | sed "s/$var/${dict[$key]}/")"
  done
  echo "$str"
}

copyFile(){
  mkdir -p "$(dirname $2)"
  if [[ -e "$2" && ! $force ]]; then
    read -p "'${2/$HOME/~}' exists. (y=overwrite, n=skip, r=rename): " -n 1
    [[ "$REPLY" ]] && echo >&2
    case $REPLY in
      y|Y) continue ;;
      n|N)
        echo "skipping $2" >&2
        return 0
        ;;
      r|R)
        read -p "Enter alternative name for '$(basename $2)': "
        [[ "$REPLY" ]] && echo >&2
        copyFile "$1" "$(dirname $2)/${REPLY:-$(basename $2)}"
        return $?
        ;;
      *)
        echo "Try again" >&2
        copyFile "$1" "$2"
        return $?
        ;;
    esac
  fi
  substitute < "$1" > "$2"
}

for arg in $@; do
  case $arg in
    -h|--help)
      usage
      exit 1
      ;;
    -f|--force)
      force=true
      shift
      ;;
    -V|--version) echo "0.0.1"; exit 0;;
    -*)
      echo "unknown option '$arg'" >&2
      usage
      exit 1
      ;;
  esac
done

[[ ! "$1" ]] && usage && exit 1

# load data
ifs=$IFS
IFS=$'\n'
declare -A dict
for line in $(egrep -o ".+: .+" < "$HOME/.fsplates/.config"); do
  key=${line%%": "*}
  val=${line#*": "*}
  dict[$key]=$val
done
IFS="$ifs"

template="$(realpath -es ${HOME}/.fsplates/$1)"
destination="$(realpath ${2:-$PWD})"

if [[ -d "$template" ]]; then
  base="$template"
else
  base="$(dirname $template)"
fi

for file in $(find -L $template -type f); do
  name="$destination${file#$base}"
  vars="$(parse_vars < $file) $(echo $name | parse_vars)"
  # prompt user for all undefined vars
  for var in $vars; do
    if [[ ! ${dict[$var]+_} ]]; then
      read -p "$var: "
      dict[$var]="$REPLY"
    fi
  done
  copyFile "$file" "$(echo $name | substitute)"
done
