# Setup fzf
# ---------
if [[ ! "$PATH" == */home/markok/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/markok/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/markok/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/markok/.fzf/shell/key-bindings.bash"
