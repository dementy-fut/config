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

[[ -f /home/dem/.secure ]] && . /home/dem/.secure

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

alias my="mysql -u$DB_USER -p$DB_PASS -D$DB_DB -h$DB_IP --auto-rehash --prompt='$DB_ALERT (\h)[\d]' --pager='less -SFX'"
alias myr="mysql -u$DB_USER -p$DB_PASS -D$DB_DB -h$DB_IP_R --auto-rehash --prompt='replica(\h)[\d]'"
alias myl="mysql -u$DB_USER_L -p$DB_PASS_L -D$DB_DB_L -h$DB_IP_L --auto-rehash --prompt='(\h)[\d]'"


alias w2="ssh $W2_IP";
alias w1="ssh $W1_IP";
alias porto="ssh $PORTO_IP";
alias db="ssh $DB_IP";
alias parma="ssh $DB_IP_R";
alias pv="echo -e \"$VP_TEXT\"";

alias l="ls -l";
alias la="ls -la"

alias sf="find ./ -name $1";
alias sg="grep -Rni * --colour=auto --exclude-dir=logs --exclude-dir=build --exclude-dir=store  --exclude-dir=nl_NL --exclude-dir=de_DE --exclude-dir=modules  -e "$1;

alias zf="/usr/local/ZendFrameworkCli/bin/zf.sh"
alias ar="/etc/init.d/apache2 reload"
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
alias gf="git fetch"
alias gpu="git push"
alias gpuo="git push origin"
alias gchp="git cherry-pick"
alias gcom="git commit"
alias gca="git commit --amend"
alias gin="git log ..@{u}"
alias gout="git log @{u}.."
alias grh="git reset --hard"
alias grs="git reset --soft"
alias gup="gst; gp; gsta;"
alias gm="git merge"
alias gpo="git pull origin"
alias phpm="php -dmemory_limit='2048M' $1"
alias gign="git update-index --assume-unchanged "
alias gnoign="git update-index --no-assume-unchanged "
alias conf="vi ~/.bashrc && source ~/.bashrc"
alias conf2="vi ~/.secure && source ~/.secure"
alias sql="ssh sql@192.168.1.34"
alias ss="$MY_CONF"
alias cf="vi configs/config.php"
alias cfd="vi configs/config.de.php"
alias fo="cd $FO_PATH; pwd;";
alias bo="cd $BO_PATH; pwd;";
alias fc="fcrontab -e";
alias cu="php composer.phar update --no-dev";
#alias ls="ls -la$@"
# Put your fun stuff here.

#if [ "$PS1" != "" -a "${STARTED_TMUX:-x}" = x -a "${SSH_TTY:-x}" != x ]
#then
#        STARTED_TMUX=1; export STARTED_TMUX
#        sleep 1
#        ( (tmux has-session -t remote && tmux attach-session -t remote) || (tmux new-session -s remote) ) && exit 0
#        echo "tmux failed to start"
#fi
