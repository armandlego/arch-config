#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

export PATH="$HOME/.local/bin_p:$PATH"

alias ls='ls -lh --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

alias vim='nvim'
alias n='nvim'

export VISUAL=vim
export EDITOR="$VISUAL"
export PERL_DESTRUCT_LEVEL=2


EMOJIS=(🍉 🫐 🍇 🍍 🎒 🧶 🌂 🍄 🌿 🍀 🌷 🦠 🐡 🥡 🍡 🍱 🫒 🥭 🌽 🗻 🧫 🫶 🫀 🧣 🧢  🪩  🫧)

RANDOM_EMOJI() {
  SELECTED_EMOJI=${EMOJIS[$RANDOM % ${#EMOJIS[@]}]};
  echo $SELECTED_EMOJI;
}

PS1='\[\e[0m\]$(RANDOM_EMOJI)  \[\e[0;1;34m\]\A \[\e[0;1;32m\]\W \[\e[0;1m\] \[\e[0m\]'
export PS1
# export PS1="\[\033[38;5;4m\]\A\[$(tput sgr0)\] : \w \[$(tput sgr0)\]\[\033[38;5;3m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

