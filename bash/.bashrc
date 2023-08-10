export CLICOLOR=1
export LANG="en_US.UTF-8"

# Display the host name followed by the current directory
# h is the host name, w the complete path
#export PS1="\h:\w$ "
export TERM=xterm-256color

# Source kubectl aliases
source ~/.bashrc.d/aliases

alias cp="cp -i"
# Function to get last n entries from the history"
# htail() { num=${1:-10}; history | tail -n $num; }
alias htail='function f(){ history | tail -n $1; }; f'
#alias chrome="open -a 'Google Chrome'"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --incognito"

alias pass-rh='export PASSWORD_STORE_DIR=~/.password-store-work'
alias pass-perso='export PASSWORD_STORE_DIR=~/.password-store-private'
alias pass-team='export PASSWORD_STORE_DIR=~/.password-store-snowdrop'

alias rhtoken='htoken | pbcopy'
alias macpw='PASSWORD_STORE_DIR=~/.password-store-work pass show redhat/mac/pw | pbcopy'
alias newmacpw='PASSWORD_STORE_DIR=~/.password-store-work pass show redhat/new-mac/pw | pbcopy'

alias rhpw='PASSWORD_STORE_DIR=~/.password-store-work pass show redhat/jira/pwd | pbcopy'
alias gitpw='PASSWORD_STORE_DIR=~/.password-store-private pass show github/ch007m/pwd | pbcopy'
alias wifipw='PASSWORD_STORE_DIR=~/.password-store-private pass show wifi/2.4-090'
alias wifissid='PASSWORD_STORE_DIR=~/.password-store-private pass show wifi/2.4-090'

# Git tricks
gitprfetch() {
  git fetch origin pull/$1/head:pr-$1 ; git checkout pr-$1
}
gitprsync() {
  git fetch origin pull/$1/head && git rebase FETCH_HEAD
}
alias gitlog="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
alias gitsync="git fetch upstream && git rebase upstream/main"
gclonecd() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

# Java JDK
alias java11="sdk use java 11.0.2-open"

# Python & Ansible
alias pyenv='source ~/.pyvirt/bin/activate'

# Kubernetes
alias kube-ca-crt="kc get sa/default -o=jsonpath='{.secrets[0].name}' | xargs kubectl get secret -o=jsonpath='{.data.ca\.crt}' | base64 -d"
export KUBE_EDITOR="nvim"

# Docker DevTools container
alias kubetools-run='docker rm -f kubetools && docker run -it -d --net host --name kubetools -v ~/.kube:/root/.kube quay.io/snowdrop/kubetools'
alias kubetools-exec='docker exec -it kubetools '

# Tips
function rss() {
  ps -o pid,rss,command -p $(pgrep -f $1)
}

# Homewbrew - Search TAP formulas
brewsearch() {
  TAP_PREFIX=$(brew --prefix)/Homebrew/Library/Taps
  ls -la $TAP_PREFIX/$1/Formula/*.rb || ls -la $TAP_PREFIX/$1/*.rb
}


# Krew
export KREW_ROOT="$HOME/.krew"
export PATH="$KREW_ROOT/bin:$PATH"

# IntelliJ
export PATH="/Applications/IntelliJ IDEA.app/Contents/MacOS:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Local user bin directory
export PATH=/opt/bin:$PATH

# Stow bin directory
export PATH=~/.dotfiles/.bin:$PATH

# Sdkman
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
#export PATH=$HOME/.sdkman/candidates/java/current/bin:/usr/local/opt/openjdk/bin:$PATH
