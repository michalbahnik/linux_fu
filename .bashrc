# FUNCTIONS
# Quick CSV file pretty-print view (from https://www.stefaanlippens.net/pretty-csv.html)
function pretty_csv {
    column -t -s, -n "$@" | less -F -S -X -K
}

# GNU syntax highlighting for less
# Note: If file type is not associated with a language, add it to lang.map file (i.e. `bashrc = sh.lang`)
hless() {
    source-highlight -f esc256 --style-file=esc256.style -i "$1" | less -R;
}

# ALIASES
# Define a bell sound macro (for example use `; bell` to notify command is done)
alias bell="echo -ne '\007'"
