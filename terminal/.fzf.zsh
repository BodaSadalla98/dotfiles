# Setup fzf
# ---------
if [[ ! "$PATH" == */home/boda/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/boda/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/boda/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/boda/.fzf/shell/key-bindings.zsh"
