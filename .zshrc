# activate ls colors output
export CLICOLOR=1
alias ll="ls -la"

source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# format the vcs_info_msg_0_ variable
zstyle ":vcs_info:*:*:$USER" formats "%0.0r"
zstyle ':vcs_info:git:*' formats '%F{blue}(%b)%f '

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%(1j.%F{yellow}[%j]%f .)%2~ ${vcs_info_msg_0_}%(?.%F{green}$.%F{red}$)%f '

# gpg2 support
export GPG_TTY=$(tty)
