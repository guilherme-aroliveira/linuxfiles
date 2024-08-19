#------------------------------
# Alias stuff
#------------------------------

alias ll='ls -la'
alias lists='sudo nano /etc/apt/sources.list'
alias upd='sudo apt-get update'
alias powershell='$HOME/Programs/Tools/microsoft/powershell-7/pwsh'
alias nvim='$HOME/Programs/IDEs/neovim/bin/nvim'
alias vscodium='$HOME/Programs/IDEs/vscodium/bin/codium'
alias pycharm='$HOME/Programs/IDEs/pycharm-ce/bin/pycharm.sh'
alias logseq='$HOME/Programs/Applications/logseq/Logseq-linux-x64-0.10.9.AppImage'
alias todoist='$HOME/Programs/Applications/todoist/Todoist-linux-9.4.0-x86_64.AppImage'
alias dropbox='$HOME/Programs/Tools/dropbox/dropbox.py'
alias vagrant='$HOME/Programs/Tools/vagrant/vagrant'
alias vault='$HOME/Programs/Tools/hashicorp/vault/vault'
alias firefox='$HOME/Programs/Browsers/firefox/firefox'

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

# Chrome executable
#export CHROME_EXECUTABLE='/usr/lib/chromium/chromium'

#Rancher Desktop
export PATH="$PATH:$HOME/.rd/bin"

# Waycarbon Hashicorp vault
export VAULT_ADDR='https://vault-cluster.private.vault.12dff1ea-b7c1-418e-8726-663abcc78d53.aws.hashicorp.cloud:8200/'
export VAULT_NAMESPACE='admin/waycarbon'

#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
