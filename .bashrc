# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
export EDITOR=vi

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

alias my="mysql -ufuturum -pfuturum -Dfuturum_inst -h192.168.1.34 --auto-rehash --prompt='select * from \h)[\d]' --pager='less -SFX'"
alias my2="mysql -ufuturum -pfuturum -Dfuturum2 -h192.168.1.34 --auto-rehash --prompt='(\h)[\d]'"
alias myl="mysql -ufuturum -pfuturum -Dfuturum_inst --auto-rehash --prompt='(\h)[\d]'"


alias w2="ssh 80.84.244.73";
alias w1="ssh 80.84.244.71";
alias porto="ssh 80.84.244.80";
alias db="ssh 192.168.1.227";
alias pv="sh /home/dem/version";

alias l="ls -l";
alias la="ls -la"

alias sf="find ./ -name $1";
alias sg="grep -Rni * --colour=auto --exclude-dir=logs --exclude-dir=build --exclude-dir=store  --exclude-dir=nl_NL --exclude-dir=de_DE --exclude-dir=modules  -e "$1;
alias sl="svn log -v | less"
alias se="vi .svn/entries"

alias zf="/usr/local/ZendFrameworkCli/bin/zf.sh"
alias ar="/etc/init.d/apache2 restart"
alias al="tail -f /var/log/apache2/error_log"
alias gl="git log"
alias glp="git log -p"
alias glb="git log -p master.."
alias glf="git log --name-only"
alias gs="git status"
alias ga="git add "
alias gb="git branch"
alias gls="git log --stat"
alias gd="git diff"
alias gdc="git diff --cached"
alias gcb="git checkout -b"
alias gc="git checkout"
alias gc-="git checkout --"
alias gst="git stash"
alias gsta="git stash apply"
alias gp="git pull"
alias gpu="git push"
alias gchp="git cherry-pick"
alias gcom="git commit"
alias gca="git commit --amend"
alias gin="git log ..@{u}"
alias gout="git log @{u}.."
alias grh="git reset --hard"
alias gup="gst; gp; gsta;"
alias gm="git merge"
alias gpo="git pull origin"
alias php="php -dmemory_limit='2048M' $1"
alias gign="git update-index --assume-unchanged "
alias gnoign="git update-index --no-assume-unchanged "
alias conf="vi ~/.bashrc && source ~/.bashrc"
alias sql="ssh sql@192.168.1.34"
alias ss="echo 'Please start: source /home/dem/.bashrc' && sudo su"
alias cf="vi configs/config.php"
export porto="dem@80.84.244.80"
export w2="dem@80.84.244.73";
#alias ls="ls -la$@"
# Put your fun stuff here.

#if [ "$PS1" != "" -a "${STARTED_TMUX:-x}" = x -a "${SSH_TTY:-x}" != x ]
#then
#        STARTED_TMUX=1; export STARTED_TMUX
#        sleep 1
#        ( (tmux has-session -t remote && tmux attach-session -t remote) || (tmux new-session -s remote) ) && exit 0
#        echo "tmux failed to start"
#fi
