alias ls='ls -G'
alias ll='ls -lh'
alias si='sudo vi'
alias sd='sudo'
alias mv='sudo mv'
alias pp='patch -p1 < '
alias i='vi'
alias tf='tail -f'
alias tailf='tail -f'
alias rp='rspec'
alias ip='ipconfig getifaddr'
alias ee='echo $?'
alias py='python'
alias md='mkdir -p'
alias ax='chmod +x'
alias g='grep -r'
alias pa='ps aux'
alias es='echo $?'

alias gd='git diff --color HEAD'
alias gdd='git diff HEAD~1'
alias gdf='git diff --full-index HEAD'
alias gr='git reset --soft HEAD~1'
alias grhard='git reset --hard HEAD~1'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gcr='git commit -c ORIG_HEAD'
alias gcd='git commit --amend'
alias gcdn='git commit --amend --no-edit'
alias gcdd='git commit --amend --no-edit --date="$(date)"'
alias gs='git status'
alias gw='git show'
alias gl='git log'
alias gb='git branch'
alias gp='git pull --rebase'
alias gk='git checkout'
alias gkb='git checkout -b'
alias gkt='git checkout --track'
alias gclean='git checkout --'
alias gcm='git checkout master'
alias grm='git rebase master'
alias gcp='git cherry-pick'
alias gn='git clone'
alias gv='git review'

alias kc='kubectl'
alias kg='kubectl get -A'
alias kp='kubectl get pod -A'
alias ks='kubectl get svc -A'
alias kl='kubectl logs -f'
alias kl='kubectl logs -f -n'
alias ky='kubectl apply -f'
alias kck='kubectl -n kubeapps'
alias kd='kubectl describe'
alias kdp='kubectl describe pod'
alias kcc='kubectl cluster-info; kubectl version'
alias kcd='kubectl delete'
alias ka='kubectl get --all-namespaces '
alias krr='kubectl rollout restart'

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
