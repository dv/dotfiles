# Make commands with arguments work such as "subl /tmp"
# Requires reattach-to-user-namespace under tmux
alias subl="reattach-to-user-namespace /usr/local/bin/subl"
alias tclear="run_in_all_naked_panes clear"
