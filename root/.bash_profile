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
if [[ -f ~/.bashrc ]]; then
   . ~/.bashrc
fi

# Set path so that it includes user's private bin if it exists.
# If the user has the netcdf-scripts in $HOME/bin, add that to PATH too.
if [[ -d "${HOME}/bin" ]]; then
    if [[ -d "${HOME}/bin/netcdf-scripts" ]]; then
	PATH="${HOME}/bin:${HOME}/bin/netcdf-scripts:${PATH}"
    else
	PATH="${HOME}/bin:${PATH}"
    fi
    export PATH
fi

# Set path so that it includes user's private .local/bin if it exists
if [[ -d "${HOME}/.local/bin" ]]; then
    PATH="${HOME}/.local/bin:${PATH}"
    export PATH
fi
#EOC
