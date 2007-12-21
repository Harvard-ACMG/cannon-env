#============================================================================
# $Id: .login,v 1.3 2007/12/21 15:00:25 bmy Exp $
#
# Bob Y's .login file (bmy, 12/21/07)
#
# .cshrc is executed every time a new Unix shell is opened on a machine
# .login is ONLY executed the first time you log into a machine
#============================================================================

# Terminal type
setenv TERM   xterm

# Default editor
setenv EDITOR emacs

# Mail
setenv MAIL   /usr/spool/mail/$USER

# Environment variables
setenv LINK_TIMEOUT 3

# Shell variables
set    mail = $MAIL

# Echo date and turn on system messages
date
