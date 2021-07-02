alias vibashrc='vi ~/.bashrc'
alias ls='ls -G'
alias ll='ls -lh'
alias si='sudo vi'
alias sd='sudo'
alias pp='patch -p1 < '
alias i='vi'
alias tf='tail -f'
alias tailf='tail -f'
alias ip='ipconfig getifaddr'
alias ee='echo $?'
alias py='python'
alias md='mkdir -p'
alias ax='chmod +x'
alias grepr='grep -r'
alias pa='ps aux'
alias es='echo $?'
alias rp='cd $(realpath `pwd`)'
alias ins='sudo install'

alias gd='git diff --color HEAD'
alias gdd='git diff HEAD~1'
alias gdf='git diff --full-index HEAD'
alias gr='git reset --soft HEAD~1'
alias grhard='git reset --hard HEAD~1'
alias gsuntracked='git ls-files --others --exclude-standard'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gcr='git commit -c ORIG_HEAD'
alias gcd='git commit --amend'
alias gcdn='git commit --amend --no-edit'
alias gcdd='git commit --amend --no-edit --date="$(TZ=UTC date)"'
alias gs='git status'
alias gw='git show'
alias gl='git log'
alias gb='git branch'
alias gbb='git switch -'
alias gp='git pull --rebase'
alias gk='git checkout'
alias gkb='git checkout -b'
alias gkt='git checkout --track'
alias gclean='git checkout --'
alias gcm='git checkout main || git checkout master'
alias grm='git rebase main || git rebase master'
alias gcp='git cherry-pick'
alias gn='git clone'
alias gv='git review'

alias k='kubectl'
alias kc='kubectl'
alias kg='kubectl get -A'
alias kp='kubectl get pod -A'
alias kpw='kubectl get pod -A -w'
alias ks='kubectl get svc -A'
alias kl='kubectl logs -f -n'
alias kll='kubectl logs -f --tail 10 -n'
alias ky='kubectl apply -f'
alias kck='kubectl -n kubeapps'
alias kd='kubectl describe'
alias kdp='kubectl describe pod -n'
alias kcc='kubectl config current-context; kubectl cluster-info; kubectl version | cut -d',' -f 1,2,3; kubectl get node;'
alias kcd='kubectl delete'
alias ka='kubectl get --all-namespaces '
alias krr='kubectl rollout restart'

alias dp='docker pull'

alias kmc='kubectl get tkc -A'
alias mcdelete='kubectl delete tkc'
alias mccreate='../dev-bootstrap/bin/make-guest-cluster.sh'

alias proxy='export http_proxy=http://proxy.vmware.com:3128; export https_proxy=http://proxy.vmware.com:3128; export no_proxy=127.0.0.1,localhost,.eng.vmware.com,.vmware.com,0,1,2,3,4,5,6,7,8,9,,10.0.0.0/8,192.168.0.0/16; export HTTP_PROXY=$http_proxy; export HTTPS_PROXY=$https_proxy; export NO_PROXY=$no_proxy;'
alias unproxy='unset http_proxy HTTP_PROXY; unset https_proxy HTTPS_PROXY; unset no_proxy NO_PROXY'

alias py3='python3'
alias cc='sudo tox -e py27 -e pep8'
alias p8='sudo tox -e pep8'

#gitbranch=`git branch | grep "*" 2>/dev/null | awk -F "*" '{print $2}'`
#alias pr='post-review -g --guess-summary --revision-range HEAD~1:HEAD'
#alias prr='post-review -g --guess-summary --branch $branch --revision-range'
alias pr='rbt post HEAD'

alias startpostgres='postgres -D /usr/local/var/postgres'
alias wsut='mvn clean package -DskipTests=true'

alias nim='ssh huh@nimbus-gateway.eng.vmware.com'
alias dbc='ssh huh@pek2-dbc403.eng.vmware.com'
alias dbcwdc='ssh huh@wdc-dbc2101.eng.vmware.com'
alias dbcsc='ssh huh@sc-dbc2112.eng.vmware.com'

alias vdn='ssh huh@10.146.101.87'
alias mytkgworkstation='ssh vmwuser@10.161.94.177'
alias mytkgcli='ssh vmwuser@10.161.64.241'
alias myharbor='ssh vmwuser@10.161.78.224'
alias myminikube='ssh vmwuser@10.161.86.209'

export GOPATH=$HOME/gopath
export GOROOT=/usr/local/go

PATH=/usr/local/go/bin:$GOPATH/bin:$HOME/bin:$PATH
PATH=$PATH:/Applications/VMware\ Fusion\ Tech\ Preview.app/Contents/Public
PATH=$HOME/Downloads/apache-maven-3.3.3/bin:/usr/local/Cellar/postgresql/9.2.4/bin:$PATH
export CHEF_SERVER_URL=https://wdc-vhadp-pub2-dhcp-72-168.eng.vmware.com:9443

#export GEMDIR=/Users/apple/.rvm/gems/ruby-2.0.0-p247/gems/

export RVC_READLINE=/usr/local//Cellar/readline/6.3.8/lib/libreadline.dylib

source <(kubectl completion bash)

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="$PATH:/usr/local/kubebuilder/bin"
#export PATH="$PATH:/Users/huh/gopath/src/gitlab.eng.vmware.com/core-build/git-tools"

export GO111MODULE=on
alias gomodon='export GO111MODULE=on'
alias gomodoff='export GO111MODULE=off'
alias gotest='go test -race -v ./pkg/... ./cmd/...'

#export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\W\[\033[00m\]\$ '

# kubectl completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
complete -F __start_kubectl kc
