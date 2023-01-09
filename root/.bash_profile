#------------------------------------------------------------------------------
#          Harvard University Atmospheric Chemistry Modeling Group            !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: .bash_profile
#
# !DESCRIPTION: Startup file for the bash shell.
#\\
#\\
# !CALLING SEQUENCE:
#  . ~/.bash_profile
#
# !REMARKS:
#  This file just sources the .bashrc file and adds folders to PATH.
#EOP
#------------------------------------------------------------------------------
#BOC

# Source the .bashrc file if it exists
if [[ -f ~/.bashrc ]] then
   . ~/.bashrc
fi

# Set path so that it includes user's private bin if it exits
if [[ -d "$HOME/bin" ]]; then
    PATH="$HOME/bin:$HOME/bin/netcdf-scripts:$PATH"
    export PATH
fi

# Set path so that it includes user's private .local/bin if it exits
if [[ -d "$HOME/.local/bin" ]]; then
    PATH="$HOME/.local/bin:$PATH"
    export PATH
fi
#EOC
