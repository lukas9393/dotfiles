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

# history setup
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000 # the number of items for the internal history list
export SAVEHIST=1000000 # maximum number of items for the history file

# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS # do not save duplicated command
setopt HIST_REDUCE_BLANKS # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME # append command to history file immediately after execution
setopt EXTENDED_HISTORY # record command start time

unsetopt BEEP
