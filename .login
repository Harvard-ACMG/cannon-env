#============================================================================
# $Id: .login,v 1.2 2007/12/21 14:54:45 bmy Exp $
#
# Bob Y's .login file (bmy, 12/21/07)
#
# .cshrc is executed every time a new Unix shell is opened on a machine
# .login is ONLY executed the first time you log into a machine
#============================================================================

# Terminal type
setenv TERM xterm

# Mail
setenv MAIL /usr/spool/mail/$USER

# Environment variables
setenv LINK_TIMEOUT 3

# Shell variables
set    mail = $MAIL

# Echo date and turn on system messages
date
