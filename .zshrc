# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/apro/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

eval "$(starship init zsh)"

if which bat > /dev/null; then
	alias cat="bat"
	alias less="bat"
fi

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
export EDITOR=nvim
export BROWSER=firefox
export TERMINAL=st
export BAT_THEME="Catppuccin-mocha"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export SUDO_PROMPT=$'[\033[35m%u\033[0m] passwd: '

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[3~" delete-char

CASE_SENSITIVE="false"

function mkcd() { mkdir -p $1; cd $1; }
function command_not_found_handler() { printf '\033[31mError\033[0m: Command "\033[31;1;5m%s\033[0m" not found.\n' "$0"; return 127; }

# aliases

alias ls="exa --icons"
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
alias lta="ls --tree -a"
alias cls="clear"
alias du="ncdu"
alias df="duf"
alias yay="paru"

alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"
alias grep="grep --color=auto"
alias mkdir="mkdir -pv"

alias doas="sudo"
alias please="sudo"
alias pls="sudo"

alias shutdown="shutdown -h now"
alias reboot="shutdown -r now"
alias suspend="betterlockscreen -l dimblur & systemctl suspend"

alias bai="shutdown"
alias brb="reboot"
alias cya="suspend"
alias zzz="suspend"

alias vim="nvim"
alias edit="nvim"
alias sedit="doas nvim"

alias :q="exit"
alias :wq="exit"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
