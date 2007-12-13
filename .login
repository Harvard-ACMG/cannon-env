#============================================================================
# $Id: .login,v 1.1 2007/12/13 19:20:37 bmy Exp $
#
# Bob Y's .login file (bmy, 10/17/07)
#
# .cshrc is executed every time a new Unix shell is opened on a machine
# .login is ONLY executed the first time you log into a machine
#============================================================================

# Terminal type
setenv TERM        xterm

# Default editor
#setenv EDITOR      emacs

# For F90 compilation
setenv LANG        C
setenv FILENV      ~/bin/filenv

# Environment variables
setenv EDITOR       '/usr/local/bin/emacs'
setenv MAIL         /usr/spool/mail/$USER
setenv LINK_TIMEOUT 3

# Shell variables
set    mail = $MAIL

# Echo date and turn on system messages
date
