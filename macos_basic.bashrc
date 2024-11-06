# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000
export PROMPT_COMMAND="history -a; history -n"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi




# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi




#-------------------------------------------------------------------------#
######----------------------- MY ALIASES ---------------------------#######
#-------------------------------------------------------------------------#


## Perl required trash
PERL5LIB="/home/enzyro/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/enzyro/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/enzyro/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/enzyro/perl5"; export PERL_MM_OPT;

# Don't do anything stupid
alias mv='mv -iv'
alias rm='rm -iv'
alias chmod='chmod -v'
alias chown='chown -v'
alias cp='cp -iv'



# Usual / cool stuff
alias ls='ls --color=auto -hF'
alias ll='ls --color=auto -ilhF'
alias la='ls -AF'
alias lt='ls -arlthF'
alias ip='ip -c'
alias sl='ls'
alias cpc='cp -iuv'
alias df='df -hT'
alias mkdir='mkdir -pv'
alias rmdir='rmdir -pv'
alias ln='ln -iv'
alias du='du -h'
alias usage='du -ch 2> /dev/null |tail -1'
alias rsync='rsync --progress -Rav'
alias mnt='mount |column -t'
alias ports='netstat -tulanp'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias disk='lsblk -f -o NAME,FSSIZE,FSTYPE,LABEL,FSAVAIL,FSUSE%,MOUNTPOINT'

#my aliases
export EDITOR="/usr/bin/vim"
alias src='vim ~/.bashrc && . ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias sshconf='vim ~/.ssh/config'
export PS1="[\t] \[\e[32m\]\u\[\e[m\]@\[\e[34m\]\h\[\e[m\] : \w\n\$  " 
alias header='curl -I'
alias nocomment="grep -Ev '''^(#|$)'''"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias vimconf="vim ~/.vimrc"
alias barbare="shutdown -h now"
alias systemctl-services="systemctl list-units --type=service"

function tty () {
    echo "python -c 'import pty; pty.spawn(\"/bin/bash\")'"
}
function tty3 () {
    echo "python3 -c 'import pty; pty.spawn(\"/bin/bash\")'"
}
alias tmpbuntu="docker run --name ubuntu-test --rm -it --entrypoint bash ubuntu:latest"
alias tmpkali="docker run --name kali-test --rm -it kalilinux/kali-rolling /bin/bash"
alias mdgen="md-to-pdf --marked-options '{ \"gfm\": true }'"
alias tfdestroy="terraform destroy -auto-approve"
alias tfapply="terraform apply -auto-approve"
alias tfplan="terraform plan"
alias tffmt="terraform fmt -recursive"
alias burl="curl --proxy http://localhost:8080"

#MACOS specific
eval $(/opt/homebrew/bin/brew shellenv)

#apps & tools
alias serve='sudo python3 -m http.server 80'
alias reverse='rlwrap nc -lvp 4444'
alias jadx-base='jadx base.apk -d sources'
alias apk-no-pinning='frida -U --codeshare sowdust/universal-android-ssl-pinning-bypass-2 --no-paus -f'
