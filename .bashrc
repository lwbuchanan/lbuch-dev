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
[ -r /usr/share/nvm/init-nvm.sh ] && . /usr/share/nvm/init-nvm.sh
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -r ~/.local/share/bob/env/env.sh ] && . "/home/luke/.local/share/bob/env/env.sh"
eval "$(zoxide init bash)"
eval "$(fzf --bash)"

# Env vars
export EDITOR='vim'
export MANPAGER="vim +MANPAGE --not-a-term -"

export PATH=$PATH:~/.cargo/bin/:~/.config/emacs/bin/

# Aliases
alias df='df -h'
alias free='free -m'

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias ls='exa'
alias ll='exa -l --git --group-directories-first'
alias la='exa -lA --git --group-directories-first'
alias lr='exa -l --git --group-directories-first -T -L 3'
alias lar='exa -lA --git --group-directories-first -T -L 3'
alias lra='exa -lA --git --group-directories-first -T -L 3'

alias cd='z'
alias cat='bat'

alias v='vim'
