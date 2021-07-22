#------------------------------------------------------------------------------
#          Harvard University Atmospheric Chemistry Modeling Group            !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: .login
#
# !DESCRIPTION: Sets various one-time parameters at login time.
#\\
#\\
# !CALLING SEQUENCE:
#  Type at the Unix prompt:
#
#     source ~/.login
#
# !REMARKS:
# .bashrc is executed every time a new Unix shell is opened on a machine
# .login is ONLY executed the first time you log into a machine
#EOP
#------------------------------------------------------------------------------
#BOC

setenv TERM         xterm                    # Default terminal
setenv EDITOR       emacs                    # Default editor
setenv LINK_TIMEOUT 3                        # ???
setenv MAIL         /usr/spool/mail/$USER    # Default mail program
set    mail =       $MAIL
date                                         # Echo date & turn on mesages
#EOC
