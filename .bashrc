# FUNCTIONS
# Quick CSV file pretty-print view (from https://www.stefaanlippens.net/pretty-csv.html)
function pretty_csv {
    column -t -s, -n "$@" | less -F -S -X -K
}

# GNU syntax highlighting for less
hless() {
    source-highlight -f esc256 --style-file=esc256.style -i "$1" | less -R;
}

# ALIASES
# Define a bell sound macro (for example use `; bell` to notify command is done)
alias bell="echo -ne '\007'"
