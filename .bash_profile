#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC

export PATH=$PATH:~/.cargo/bin/:~/.config/emacs/bin/
. "/home/luke/.local/share/bob/env/env.sh"
