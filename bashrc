
if [[ -n "${NVIM_LISTEN_ADDRESS}" ]]
then
    # TODO update the path each time Vim has a major upgrade
    export VIMRUNTIME=/usr/share/vim/vim81
fi
export PATH="$HOME/local/vim/bin:$PATH"
export PATH="$HOME/local/vim/bin:$PATH"

# ctrl+fで次の単語に移動
bindkey '^T' forward-word
# ctrl+bで前の単語に移動
bindkey '^Y' backward-word
bindkey '^F' forward-char
bindkey '^B' backward-char

source ~/.git-completion.bash
