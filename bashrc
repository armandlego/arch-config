#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

export PATH="$HOME/.cargo/bin:$HOME/.local/bin_p:$PATH"

# Rust utilities
alias ls='exa -l --git'

alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias br='br -sdp'
alias nnn='nnn -dex'

# Neovim
alias vim='nvim'

export VISUAL=nvim
export EDITOR="$VISUAL"

# NNN trash-cli
export NNN_TRASH=1

EMOJIS=(🍉 🫐 🍇 🍍 🎒 🧶 🌂 🍄 🌿 🍀 🌷 🦠 🐡 🥡 🍡 🍱 🫒 🥭 🌽 🗻 🧫 🫀 🧣 🧢 🪩 🫧 🩸 🔥 ⛄)
RANDOM_EMOJI() {
  SELECTED_EMOJI=${EMOJIS[$RANDOM % ${#EMOJIS[@]}]};
  echo $SELECTED_EMOJI;
}

PS1='\[\e[0m\]$(RANDOM_EMOJI)  \[\e[0;1;34m\]\A \[\e[0;1;32m\]\W \[\e[0;1m\]\[\e[0;1;91m\]•❯\[\e[0m\] '

export PS1

source /home/arman/.config/broot/launcher/bash/br
