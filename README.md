# linux_fu
Collection of Linux tools, scripts, tricks, ...

## Tools

* **tmux**: `screen` alternative offering extended functionality
* **terminator**: powerful terminal emulator offering tab splitting/tiling
* **csview**: Fast CLI CSV file viewer. Great with `less`: `csview file.csv | less -S --header 3`. Note: `--header` argument supported from version `less>=600`.
* **zcalc**: Simple CLI calculator for quick use in zshell.
* **btop**: `htop` on steroids
* **fzf:** Fast and neat command history search.

## Random wisdom
* **Swapiness**: Rather unintuitively, Ubuntu somes with high [swapiness]([url](https://askubuntu.com/a/103916/1158953)) (preference to use swap memory). For non-server usage, setting the value to 0-10 could improve performance.
