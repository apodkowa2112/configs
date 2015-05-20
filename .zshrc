# Path to your oh-my-zsh configuration.
#ZSH=/usr/share/oh-my-zsh/
ZSH=~/.oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="gallifrey"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

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
#plugins=(git archlinux python vi-mode)
plugins=(git python vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/.bin:/usr/local/bin:$HOME/bin:$PATH
export LD_LIBRARY_PATH=$HOME/lib:$LD_LIBRARY_PATH


# Colored ls output
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx 

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

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
#zstyle :compinstall filename '/home/darkmaster/.zshrc'
#
#autoload -Uz compinit
#compinit
# End of lines added by compinstall
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.

if [[ -n ${terminfo[smkx]} ]] && [[ -n ${terminfo[rmkx]} ]]; then
    function zle-line-init () {echoti smkx}
    function zle-line-finish () {echoti rmkx}

    zle -N zle-line-init
    zle -N zle-line-finish
fi

# For dynamic Terminal title setting
#function tabname { printf "\e]1;$1\a"; }
#function winname { printf "\e]2;$1\a"; }
#function ssh() { sed -E 's/(.*@)?([-a-zA-Z0-9\.]*)(.*)/\2/' <<<$(echo "$@") | tabname ; /usr/bin/ssh "$@"; tabname; }

#autoload -U promptinit
#promptinit
#prompt redhat

clued0_node="manic"
PATH="$HOME/.bin:/usr/local/bin:/usr/share/bin:$PATH"
function gui  { nohup $@ &> /dev/null & }
alias ssh_glee='ssh tpodkow2@glee.brl.illinois.edu -t /bin/zsh'
alias rooms="sshfs -o workaround=rename apodkowa@andromeda-clued0.fnal.gov:/rooms/ /rooms/"
alias fnal="kinit && rooms && clued0 $@"
alias ls='ls -Gp'
alias ll='ls -Al $1 | less'
alias ldev="ls /dev/sd*"
alias ldevlabel="ls -l /dev/disk/by-label/"
alias back='cd - > /dev/null'
alias speaker='asoundconf set-default-card NVidia'
alias headset='asoundconf set-default-card Headset'
function dirdiff {
    vim -c "DirDiff $1 $2";
}
function ssh-copy {
   cat ~/.ssh/id_rsa.pub | ssh $1 'umask 077; mkdir -p ~/.ssh; cat >> ~/.ssh/authorized_keys'
}
function fixClock { sudo ntpdate pool.ntp.org; }
function isomount { sudo /bin/mount -t iso9660 -o ro,loop $@; }
function music { cd ~/Music; cplay; cd -; }
function pmount  { echo; ldev; echo; /usr/bin/pmount $@; echo; }
function pumount  { 
    if [ $1 = "-a" ] 
    then 
        for line in `pmount | awk -F/ '/dev/ {print $3;}' | awk '{if ($0 != "") print $1;}'`; do 
            pumount $line; 
        done;
        /usr/bin/pmount;
    else
        /usr/bin/pumount $@ && /usr/bin/pmount; 
    fi
}
function lmount  { 

    echo; 
    ldevlabel; 
    echo; 
    if [ -n $1 ] 
    then 
        temp=$CWD;
        cd /dev/disk/by-label/;
        pmount $1; 
        back;
        CWD=temp;
    fi 
}
function smount { sudo /bin/mount $@; }
function sumount { sudo /bin/umount $1 && sudo /bin/mount ; }
alias su="sudo -i"
#alias pacman='sudo pacman-color'
alias mozilla='firefox'
alias elinks="elinks -anonymous"
#alias kinit="`which kinit` apodkowa"
function clued0 { ssh -X apodkowa@$1-clued0.fnal.gov; } 
function pacBackup { pacman -Qet | cut -d ' ' -f1 > $1; }
function powerpill { sudo powerpill $@; }
function aurget { 
    package=$1
    letters=${package:0:2}
    aria2c -d . https://aur.archlinux.org/packages/$letters/$package/$package.tar.gz
    [ -f $package.tar.gz ] || exit 1;
    tar xvzf $package.tar.gz
    cd $package
    $EDITOR PKGBUILD
}
function pacman-optimize { sudo pacman -Sc && sudo pacman-optimize; }
function zshrc { $EDITOR ~/.zshrc; source ~/.zshrc; }
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R'
export EDITOR=`which vim`
#------------------------------
# Window title
#------------------------------
case $TERM in
    termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
precmd () { print -Pn "\e]0;[%n@%M][%~]%#\a" }
preexec () { print -Pn "\e]0;[%n@%M][%~]%# ($1)\a" }
;;
    screen|screen-256color)
     precmd () {
print -Pn "\e]83;title \"$1\"\a"
print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~]\a"
}
preexec () {
print -Pn "\e]83;title \"$1\"\a"
print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~] ($1)\a"
}
;;
esac

# stuff for building in a clean chroot
CHROOT=$HOME/chroot  
# Wine stuff
export WINEARCH=win32
export WINEPREFIX=~/win32
export GOPATH=~/go

##Vi-mode prompt
#bindkey -v
#bindkey "^?" backward-delete-char
#
##VIMODE="%{$fg[yellow]%}[i]%{$reset_color%}"
#VIMODE="[i]"
#function zle-line-init zle-keymap-select {
#    VIM_PROMPT="%{$fg_bold[yellow]%} [% CMD]%  %{$reset_color%}"
#    #RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
#    VIMODE="${${KEYMAP/vicmd/[ ]}/(main|viins)/[i]}"
#    zle reset-prompt
#}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# Theme: based off of gallifrey
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
PROMPT='%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%} ${VIMODE} %2~ $(git_prompt_info)%{$reset_color%}%B»%b '
RPS1="${return_code}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

# startx on tty1
if [ $(tty) = '/dev/tty1' ] 
then
   startx
fi
