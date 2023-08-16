# Setup fzf
# ---------
if [[ ! "$PATH" == */home/requias/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/requias/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/requias/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/requias/.fzf/shell/key-bindings.bash"

# Color-scheme
# ------------
export FZF_DEFAULT_OPTS='
    --color=dark
    --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
    --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'
