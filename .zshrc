# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/z/z.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/java/bin:/opt/java/db/bin:/opt/java/jre/bin:/usr/bin/core_perl:/opt/java/bin:/usr/share/cassandra/tools/bin:/home/jqcorreia/toolchain-mips_34kc_gcc-4.6-linaro_uClibc-0.9.33.2/bin"

export STAGING_DIR=/home/jqcorreia/target-mips_34kc_uClibc-0.9.33.2

[ -n "$XTERM_VERSION" ] && transset-df -a >/dev/null

remove() { perl -i -ne "print unless $1 .. $1" ~/.ssh/known_hosts; }
update-ak() {sudo pip3 install git+ssh://git@gitlab.a-k.pt:10922/core/akpy.git --upgrade }
addme() { cat ~/.ssh/id_rsa.pub | ssh root@$1 "cat >> /etc/dropbear/authorized_keys" }
ccon() { ping www.google.com }
shell() { xterm -e "mosquitto_pub -h scrum.a-k.pt -p 1111 -u mqttauth -P 1234 -t system/$1/in -l" &; xterm -e "mosquitto_sub -h scrum.a-k.pt -p 1111 -u mqttauth -P 1234 -t system/$1/out" }
ant() { ssh root@10.0.1.$1 }
setopt no_sharehistory

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

