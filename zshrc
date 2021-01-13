if [[ -n "${NVIM_LISTEN_ADDRESS}" ]]
then
    # TODO update the path each time Vim has a major upgrade
    export VIMRUNTIME=/usr/share/vim/vim81
fi


autoload -U compinit
compinit -u
export PATH="$HOME/local/vim/bin:$PATH"

# ctrl+fで次の単語に移動
bindkey '^T' forward-word
# ctrl+bで前の単語に移動
bindkey '^Y' backward-word
bindkey '^F' forward-char
bindkey '^B' backward-char

alias nvim='VIM=/usr/local/Cellar/neovim/0.4.3/share/nvim nvim'
VIM=/usr/local/Cellar/vim/8.2.0800/share/vim/vim82
export VIM
export PATH="/usr/local/bin:/Users/let_kohei_ota/go/bin:$PATH"

alias nvim='VIM=/usr/local/Cellar/neovim/0.4.3/share/nvim nvim'
VIM=/usr/local/Cellar/vim/8.2.0800/share/vim/vim82
export VIM
export PATH="/usr/local/bin:/Users/let_kohei_ota/go/bin:$PATH"
KEYCLOAK_URL="https://idam.egxp.io/auth"
KEYCLOAK_REALM=mss
KEYCLOAK_CLIENT_ID=let-suite
KEYCLOAK_ADMIN_USERNAME=development@idam.egxp.io
KEYCLOAK_ADMIN_PASSWORD="]([]QZeKK&q.G0F#eZZP$>qbVVdyJiF^a,MW9qTKs%ycVX<Xzn,Gsi]BeM774pc+"
CERTIFICATION_REQUIRED=1
LOGIN_REQUIRED=1
HEADER_ORIGIN="Origin:https://web.integration.testing.egxp.io"
API_BASE_URL="localhost:8082"
export LOGIN_REQUIRED
export KEYCLOAK_URL
export KEYCLOAK_REALM
export KEYCLOAK_CLIENT_ID
export KEYCLOAK_CLIENT_SECRET
export CERTIFICATION_REQUIRED
export KEYCLOAK_ADMIN_USERNAME
export KEYCLOAK_ADMIN_PASSWORD
export HEADER_ORIGIN
export API_BASE_URL

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

export PASSWORD="password"
