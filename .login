# $Id: .login,v 1.4 2009/08/13 18:09:14 bmy Exp $
#------------------------------------------------------------------------------
#          Harvard University Atmospheric Chemistry Modeling Group            !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: .login
#
# !DESCRIPTION: Bob Y's .login file.  Sets various one-time parameters 
#  at login time.
#\\
#\\
# !CALLING SEQUENCE:
#  source ~/.login
#
# !REMARKS:
# .cshrc is executed every time a new Unix shell is opened on a machine
# .login is ONLY executed the first time you log into a machine
#
# !REVISION HISTORY: 
#  13 Aug 2009 - R. Yantosca - Added ProTeX headers
#EOP
#------------------------------------------------------------------------------
#BOC

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
#EOC
