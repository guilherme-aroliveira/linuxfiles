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
HISTSIZE=1000
HISTFILESIZE=2000

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
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$'
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    #PS1='\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1   \e[01,36m)\e'

   export PS1

    parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
    }

    PS1="\e[01;36m╭──[\e[01;33m\w\e[01;36m] \e[01;34m\$(if git rev-parse --git-dir > /dev/null 2>&1; then echo 'git:('; fi)\[\e[1;31m\]\$(parse_git_branch)\e[01;34m\$(if git rev-parse --git-dir > /dev/null 2>&1; then echo ')'; fi)\n\e[01;36m╰╼ \[\e[0m\]>> "

    #PS1="\e[01;36m╭──[\e[01;35m\u@\h\e[01;36m]─[\e[01;33m\w\e[01;36m]\e[01;36m\n\e[01;36m╰╼ \$(if git rev-parse --git-dir > /dev/null 2>&1; then echo 'git:('; fi)\[\e[1;34m\]\$(parse_git_branch)\e[01;36m\$(if git rev-parse --git-dir > /dev/null 2>&1; then echo ')'; fi) \[\e[0m\]>> "

    #PS1='\e[01;36m╭──[\e[01;35m\u@\h\e[01;36m]─[\e[01;33m\w\e[01;36m]\e[01;36m\n\e[01;36m╰╼ \e[01;34m$(__git_ps1 "%s")\e[01;36m >> \e[00m'

    PROMPT_DIRTRIM=2

    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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


#==========================
# DIVERSOS
#==========================

## Habilitando suporte a cores para o ls e outros aliases
## Vê se o arquivo existe
if [ -x /usr/bin/dircolors ]; then
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

## Aliases (apelidos) para comandos
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
fi # Fim do if do dircolor

#-----------------------------
# Alias
#-----------------------------

# Lista todos os arquidos e diretórios
alias ll='ls -la'

# Editar sources.list
alias lists='sudo nano /etc/apt/sources.list'

# atualizar o apt-get
alias upd='sudo apt-get update'

# Other alias
alias nvim='$HOME/Programs/IDEs/neovim/bin/nvim'
alias powershell='$HOME/Programs/Tools/microsoft/powershell-7/pwsh'
alias vscodium='$HOME/Programs/IDEs/vscodium/bin/codium'
alias pycharm='$HOME/Programs/IDEs/pycharm-ce/bin/pycharm.sh'
alias logseq='$HOME/Programs/Applications/logseq/Logseq-linux-x64-0.10.9.AppImage'
alias todoist='$HOME/Programs/Applications/todoist/Todoist-linux-9.4.0-x86_64.AppImage'
alias vagrant='$HOME/Programs/Tools/vagrant/vagrant'
alias vault='$HOME/Programs/Tools/hashicorp/vault/vault'
alias firefox='$HOME/Programs/Browsers/firefox/firefox'
alias dropbox='$HOME/Programs/Tools/dropbox/dropbox.py'

#------------------------------
# SDKs
#------------------------------

#Java JDK
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64/"
export PATH=$PATH:$JAVA_HOME/bin

#JavaFX
export PATH="$PATH:$HOME/Programs/Tools/javafx-sdk-21.0.2/lib/"

#.NET SDK
export DOTNET_ROOT=$HOME/Programs/Tools/microsoft/dotnet-sdk-8

#Flutter sdk
export PATH="$PATH:$HOME/Programs/Tools/flutter/bin/"

#Android sdk
export ANDROID_HOME="$HOME/Programs/Tools/android/sdk/"
export PATH=$PATH:$ANDROID_HOME/tools/cmdline-tools/version/bin/
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools/34.0.0

#------------------------------
# Servers
#------------------------------

#Apache tomcat
export CATALINA_HOME="$HOME/Programs/Servers/apache-tomcat-10.1.19/"
export PATH=$PATH:$CATALINA_HOME/bin

#Wildfly
#export JBOSS_HOME="/home/guilherme/Programs/Servers/wildfly-29.0.0"
#export PATH=$PATH:$JBOSS_HOME/bin

#------------------------------
# CLIs
#------------------------------

#GitHub CLI
export PATH="$PATH:$HOME/Programs/Tools/github-cli/bin/"

#Gitkraken CLI
export PATH="$PATH:$HOME/Programs/Tools/gitkraken-cli/"

#AWS CLI
export PATH="$PATH:$HOME/Programs/Tools/aws-cli/v2/2.15.22/bin/"

#IBM Cloud ClI
export PATH="$PATH:$HOME/Programs/Tools/ibm_cloud_cli/"

#Tekton CLI
export PATH="$PATH:$HOME/Programs/Tools/tekton-cli/"

#------------------------------
# Tools
#------------------------------

#tfenv - terraform version manager
export PATH="$PATH:$HOME/.tfenv/bin/"

#terraform docs
export PATH="$PATH:$HOME/Programs/Tools/terraform-docs/"

#opentofu
export PATH="$PATH:$HOME/Programs/Tools/opentofu/"

#Kubernetes
export PATH="$PATH:$HOME/Programs/Tools/kubernetes/"

#eksctl
export PATH="$PATH:$HOME/Programs/Tools/aws-eks/"

#SQLite
export PATH="$PATH:$HOME/Programs/Tools/sqlite-tools/"

#Golang
export GOROOT=$HOME/Programs/Tools/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/Programs/Tools/golib
export PATH=$PATH:$GOPATH/bin
export GOPATH=$GOPATH:$HOME/Documents/Configs/golang

#Apache Maven
export M2_HOME="$HOME/Programs/Tools/apache-maven-3.9.6/"
export M2=$M2_HOME/bin
export MAVEN_OPTS=-"Xms256m -Xmx512m"
export PATH=$M2:$PATH

#Rancher Desktop
export PATH="$PATH:$HOME/.rd/bin"

# Chrome executable
#export CHROME_EXECUTABLE='/usr/lib/chromium/chromium'

#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
