# To enable shims and autocompletion add to your profile:
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# To use Homebrew's directories rather than ~/.jenv add to your profile:
export JENV_ROOT=/usr/local/opt/jenv# hub autocomplete

# don't check for new mail
fpath=(/usr/local/share/zsh/site-functions $fpath)
alias git=hub
# alias vi=vim
alias vi=nvim
alias vizsh='vi ~/.zshrc'
alias vid='cd ~/vimwiki/diary/ && nvim -c "VimwikiMakeDiaryNote" .'
alias viconfig='cd ~/.vim && vi'
# alias mtr=/usr/local/sbin/mtr

export EDITOR='nvim'
export GIT_EDITOR=/usr/local/bin/nvim

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Path for android sdk
export ANDROID_HOME=/Users/zed/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export LC_ALL="zh_CN.UTF-8"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="wedisagree"
ZSH_THEME=""
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# rails ruby gem rvm bundler bgnotify postgres
plugins=(git git-extras tmux brew osx npm docker mix)

# bgnotify settings
function bgnotify_formatted {
  ## $1=exit_status, $2=command, $3=elapsed_time
  if ! (echo $2 | grep -q '^vi'); then
    [ $1 -eq 0 ] && title="执行成功，要下一步啦!" || title="执行失败，赶紧看看!"
    bgnotify "$title -- after $3 s" "$2";
  fi
}
# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH

source $ZSH/oh-my-zsh.sh

# 使用主题[pure](https://github.com/sindresorhus/pure)
autoload -U promptinit; promptinit
prompt pure
PROMPT='%F{white}%* '$PROMPT

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='vim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gitc='git checkout'
alias gitcb='git checkout -b'
alias gitcd='git checkout develop'
alias gitcm='git checkout master'
alias gitpd="git checkout develop && git pull origin develop"
alias gitpm="git checkout master && git pull origin master"
alias gitpu="git pull"
alias gitps="git push"
alias gitbr="git browse -- pulls"
alias gitbn="git for-each-ref --sort=committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'"
alias gitcp="git cherry-pick"

# alias tig
alias 'ts'="tig status"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
export BUNDLER_EDITOR=nvim

# get localhost ip
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

# setup aria2
alias download="aria2c --conf-path='/Users/zed/.aria2/aria2.conf' -D"

# cnpm
# alias cnpm="npm --registry=https://registry.npm.taobao.org \
#   --cache=$HOME/.npm/.cache/cnpm \
#   --disturl=https://npm.taobao.org/dist \
#   --userconfig=$HOME/.cnpmrc"

# fzf settings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
setopt hist_ignore_dups

# marked 2
# alias mark='open -a "Marked 2"'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# GOPATH
export GOPATH=$HOME/go
export GOROOT=/usr/local/Cellar/go/1.12.5/libexec

# GOPATH bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# 清除已merge的feature/Bugfix/hotfix branch
function gitcl () {
  # Update repository and Git automatically prunes all stale references.
  git fetch -p
  git branch -r --merged| awk -F '[/]' '/(feature)|(Bugfix)|(hotfix)\// {printf"%s/%s\n",$2,$3}' |xargs -I{} git push origin :{}
  git branch --merged| awk -F '[/]' '/(feature)|(Bugfix)|(hotfix)\// {printf"%s/%s\n",$1,$2}' |xargs -I{} git branch -D {}
  # git branch -r| awk -F '[/]' '/feature\// {printf"%s/%s\n",$2,$3}' | grep -v $1 |xargs -I{} git push origin :{}
}

function gits {
  keyword=$1
  git log -S $1 --patch --reverse
}

function kcp {
  kubectl get pods -n $1 | grep $2
}

function kcdc {
  pod=$(kubectl get pods -n $1 | grep $2 | awk 'NR==1{print $1}')
  kubectl describe pod -n $1 $pod
}

function kce {
  pod=$(kubectl get pods -n $1 | grep $2 | awk 'NR==1{print $1}')
  kubectl exec -n $1 -it $pod -- sh
}

function kcl {
  pod=$(kubectl get pods -n $1 | grep $2 | awk 'NR==1{print $1}')
  kubectl logs -n $1 $pod  -f
}

function kck {
  pods=$(kubectl get pods -n $1 | grep $2 | awk '{print $1}' ORS=' ')
  kubectl delete pod -n $1 $=pods
}

# 提交gitlab的mr，合并到develop并指派给 id=60
function gitmr {
  default_target_branch="develop"
  target_branch=$1
  # use default_target_branch for target_branch
  if [[ $target_branch == "" ]]; then
    target_branch=$default_target_branch
  fi

  gitlab_repo_url=`git ls-remote --get-url` # git@git.example.com:repo-name.git
  gitlab_user=`echo $gitlab_repo_url|cut -d @ -f 1`
  gitlab_host=`echo $gitlab_repo_url|cut -d : -f 1|cut -d @ -f 2`
  gitlab_repo=`echo $gitlab_repo_url|cut -d : -f 2|cut -d . -f 1`
  gitlab_web_url="http://${gitlab_host}/${gitlab_repo}"

  current_branch=`git rev-parse --abbrev-ref HEAD`

  git push

  String.titleize(){
    echo "$1" | sed -E -e "s/-|_/ /g" -e 's/\b(.)/\U\1/g'
  }
  gitlab_mr_title=`String.titleize $current_branch`

  # git_last_commit_message=`git log -1 --pretty=%B`
  # gitlab_mr_title=$git_last_commit_message

  gitlab_mr_url="${gitlab_web_url}/merge_requests/new?merge_request[source_branch]=${current_branch}&merge_request[target_branch]=${target_branch}&merge_request[title]=${gitlab_mr_title}&merge_request[assignee_id]=60"
  open "$gitlab_mr_url"
}

# 自动补全
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^k' autosuggest-accept

# Quick and dirty debugging output for tired Go programmers
# https://github.com/ryboe/q
qq() {
    clear

    logpath="$TMPDIR/q"
    if [[ -z "$TMPDIR" ]]; then
        logpath="/tmp/q"
    fi

    if [[ ! -f "$logpath" ]]; then
        echo 'Q LOG' > "$logpath"
    fi

    tail -100f -- "$logpath"
}

rmqq() {
    logpath="$TMPDIR/q"
    if [[ -z "$TMPDIR" ]]; then
        logpath="/tmp/q"
    fi
    if [[ -f "$logpath" ]]; then
        rm "$logpath"
    fi
    qq
}

# proxy list
alias proxy='export all_proxy=socks5://127.0.0.1:1086'
alias unproxy='unset all_proxy'

# privoxy
alias privoxy="sudo /usr/local/sbin/privoxy /usr/local/etc/privoxy/config;"
alias privoxy_status="ps aux | grep privoxy;"
alias privoxy_port="netstat -an | grep 6666;"
alias privoxy_quit="sudo killall privoxy;"
alias proxy_dev='sudo cp /usr/local/etc/privoxy/dev_config /usr/local/etc/privoxy/config;privoxy_quit;privoxy'
alias proxy_switch='sudo cp /usr/local/etc/privoxy/switch_config /usr/local/etc/privoxy/config;privoxy_quit;privoxy'
alias proxy_status="awk 'NR>=1387 && NR <= 1388' /usr/local/etc/privoxy/config"

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
