#------------------------------------------------------------------------------
#          Harvard University Atmospheric Chemistry Modeling Group            !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: .bashrc
#
# !DESCRIPTION: File containing environment settings for the bash shell on
#  FAS RC's Cannon cluster. Rename this file .bashrc when copying to your
#  home directory.
#\\
#\\
# !CALLING SEQUENCE:
#  To apply the settings here, type at the Unix prompt:
#
#     source ~/.bashrc
#
# !REMARKS:
#  We have removed the module load commands from this .bashrc.  Here you
#  will only find some basic settings and aliases that are needed for
#  you to run GEOS-Chem.  The module load commands should be applied
#  separately from the .bashrc.  These can be done by sourcing the
#  appropriate environment file.
#
#  This .bashrc will also source your startup file ~/.my_personal_settings
#  to load your own personal preferences for your Unix environment.
#
#  You can copy this file to ~/.bashrc in your root directory and edit
#  as you wish.
#EOP
#------------------------------------------------------------------------------
#BOC

#==============================================================================
# %%%%% Source systemwide global definitions from /etc/bashrc %%%%%
#==============================================================================
if [[ -f /etc/bashrc ]]; then
 . /etc/bashrc
fi

#==============================================================================
# %%%%% Unix environment settings %%%%%
#==============================================================================
umask 022                             # Make files world-readable by default
set autolist                          # Turn on list completion
set correct                           #
set color                             #
set colorcat                          #
set filesc                            #
set emacs                             # Use an emacs-style editing interface
set history                           # Turn on history of commands
set ignoreeof                         # Prevent EOF from terminating the shell
ulimit -t unlimited                   # Max out cputime
ulimit -f unlimited                   # Max out filesize
ulimit -d unlimited                   # Max out datasize
ulimit -s unlimited                   # Max out stacksize
ulimit -c unlimited                   # Max out coredumpsize
export TERM=xterm                     # Default terminal
export EDITOR=emacs                   # Default editor (emacs or vim)
export VISUAL=emacs                   # Default editor (emacs or vim)
export GIT_EDITOR=emacs               # Default Git editor (emacs or vim)
export MAIL=/usr/spool/mail/$USER     # Default mail program
mail=$MAIL
PS1="\[\e[1;32m\][\h \W]$\[\e[0m\] "  # Override the default Unix prompt

#==============================================================================
# %%%%% Settings for colorization  %%%%%
#==============================================================================
export GREP_COLOR=32
export LS_COLORS='no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;37:*.tgz=01;37:*.arj=01;37:*.taz=01;37:*.lzh=01;37:*.zip=01;37:*.z=01;37:*.Z=01;37:*.gz=01;37:*.bz2=01;37:*.deb=01;37:*.rpm=01;37:*.jar=01;37:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:'

#==============================================================================
# %%%%% Startup settings for various software packages %%%%%
#==============================================================================

# IDL
export IDL_STARTUP="$HOME/IDL/idl_startup.pro"

# Python
export PYTHONSTTARTUP="$HOME/python/python_startup.py"

# Emacs, skip warning messages
alias emacs="emacs 2>/dev/null"

# Evince, skip warning messages
alias evince="evince 2>/dev/null"

# KPP compiler
export PATH="$PATH:$HOME/KPP/kpp-2.2.3_01/bin/"
export KPP_HOME="$HOME/KPP/kpp-2.2.3_01"

# Jacob-group Spack-built software stack
# NOTE: If you are using your own Spack distribution,
# point SPACK_ROOT to your root Spack folder instead!
export SPACK_ROOT=/n/jacob_lab/Lab/spack

#==============================================================================
# %%%%% Basic SLURM commands %%%%%
#==============================================================================
alias squeue="squeue --format='%.9i %.9P %.8j %.8u %.2t %.10M %.6D %.6C %R'"
alias sq="squeue"
alias qj="squeue -u $USER"
alias qa="sacct -j"
alias qdel="scancel"
alias si="sinfo format='%.11P %.20N %.11T %.6D %.4c %C'"
alias hinfo="sinfo format='%.11P %.20N %.11T %.6D %.4c %C' -p huce_intel"
alias sinfo="sinfo format='%.11P %.20N %.11T %.6D %.4c %C' -p shared"
alias tinfo="sinfo format='%.11P %.20N %.11T %.6D %.4c %C' -p test"
alias jcheck="lsload | grep -e 'jacob\|Hostname'"
alias myfs="sshare -u $USER -U"
alias jacobfs="sshare -A jacob_lab -a"

#==============================================================================
# %%%%% Aliases for basic Unix commands %%%%%
#==============================================================================

# General Unix commands
alias disk="du -h -s -c"
alias g="grep -in --color=auto"
alias gt="grep -in --text"
alias gf="gifview -a"
alias m="less"
alias me="xterm &"
alias proc="ps -ef | grep $USER | sort"
alias pu="rm *~"
alias pua="rm .*~"
alias sb=". ~/.bash_profile"
alias ssh="ssh -X -A"
alias gsh="ssh -xT"
alias tf="tail --follow"
alias zap="kill -9"
alias cd="cd -P"
alias ev="evince" # PDF viewer
alias d="display" # image viewer
alias c="clear"
alias h="history"
alias diff="colordiff"
alias rm="rm -Iv"
alias cp="cp -v"
alias mv="mv -v"

# Basic Git commands
if [[ -f /etc/bash_completion.d/git ]]; then
    . /etc/bash_completion.d/git
fi
alias gui="git gui &"
alias gk="gitk &"
alias gka="gitk --all &"
alias gpo="git pull origin"
alias gl="git log"
alias glo="git log --oneline"
alias glp="git log --pretty=format:'%h : %s' --topo-order --graph"
alias getenv="cd ~/env; git pull origin main"
alias update_tags="git tag -l | xargs git tag -d && git fetch -t"

# Directory listing commands
alias ls="ls -CF --time-style=long-iso --color=auto"
alias l1="ls -1"
alias ll="ls -l"
alias llt="ls -lt"
alias lltm="ls -lt | less"
alias la="ls -a"
alias lla="ls -la"
alias llh="ls -lh"

#==============================================================================
# %%%%% Aliases to load modules for different compilers %%%%%
#==============================================================================
alias load_gf102=". ~/envs/gcc_cmake.gfortran102_cannon.env"
alias load_gf93=". ~/envs/gcc_cmake.gfortran93_cannon.env"
alias load_if19=". ~/envs/gcc_cmake.ifort19_openmpi_cannon.env"
alias load_if18=". ~/envs/gcc_cmake.ifort18_openmpi_cannon.env"

#==============================================================================
# %%%%% Load the user's personal settings and aliases %%%%%
#==============================================================================
if [[ -f ~/.my_personal_settings ]]; then
  . ~/.my_personal_settings
fi
#EOC