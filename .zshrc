### NVMRC
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

gac() {
        git add . && git commit -m "$1"
}
gacp() {
        git add . && git commit -m "No comment" && git push
}
gacpm() {
        git add . && git commit -m "$1" && git push
}
nr() {
        npm run "$1"
}

alias c=clear
alias gs="git status"
alias ns="npm start"
alias nd="npm run dev"
alias nrd="npm run dev"
alias ls="exa --long --git --icons"
