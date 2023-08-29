# function to create and than change directory
mkcd() {
	mkdir -p "$1"
	cd "$1"
}

# function to go up n directories
function cd_up() {
  cd $(printf "%0.s../" $(seq 1 $1 ));
}
alias 'cd..'='cd_up'
#go up directories easily
up () {
    local d=""
    local limit="$1"

    #Default to limit of 1
    if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
        limit=1
    fi

    for ((i=1;i<=limit;i++)); do    
        d="../$d"
    done

    # perform cd. Show errir if cd fails
    if ! cd "$d"; then
        echo "Couldn't go up $limit dirs.";
    fi
}
