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

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR=nvim
export BROWSER=firefox
export BAT_THEME="Monokai Extended"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

CASE_SENSITIVE="false"

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

alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"
alias grep="grep --color=auto"
alias mkdir="mkdir -pv"

alias sudo="doas"
alias please="doas"
alias pls="doas"

alias shutdown="shutdown -h now"
alias reboot="shutdown -r now"
alias sleep="systemctl suspend"

alias bai="shutdown -h now"
alias brb="shutdown -r now"
alias cya="systemctl suspend"
alias zzz="systemctl suspend"

alias vim="nvim"
alias edit="nvim"
alias sedit="doas nvim"

alias :q="exit"
alias :wq="exit"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
