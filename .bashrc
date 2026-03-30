#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

xhost +local:root >/dev/null 2>&1

# Prompt
if [[ ${EUID} == 0 ]]; then
  PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
else
  PS1='\[\033[01;32m\]\u@\h\[\033[01;37m\] \w\[\033[01;32m\] \$\[\033[00m\] '
fi

# Shell options
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

# Source outside config
[ -r ~/.profile ] && . ~/.profile
[ -r /usr/share/nvm/init-nvm.sh ] && . /usr/share/nvm/init-nvm.sh
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
eval "$(zoxide init bash)"
eval "$(fzf --bash)"

# Aliases
alias df='df -h'
alias free='free -m'

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias ls='exa'
alias ll='exa -l --git --group-directories-first --icons'
alias la='exa -lA --git --group-directories-first --icons'
alias lr='exa -l --git --group-directories-first --icons -T -L 3'
alias lar='exa -lA --git --group-directories-first --icons -T -L 3'
alias lra='exa -lA --git --group-directories-first --icons -T -L 3'

alias cd='z'
alias cat='bat'

alias lg='lazygit'
alias v='nvim'
alias sv='sudoedit'
alias doom='~/.config/emacs/bin/doom'
alias emacs='emacs -nw'

alias readapaper='~/Documents/Papers/scripts/readapaper.py'
alias task='go-task'
alias mgt='cargo r --manifest-path ~/Projects/megaton/Cargo.toml --'
