#!/bin/bash

#EOC
#------------------------------------------------------------------------------
#                  GEOS-Chem Global Chemical Transport Model                  !
#------------------------------------------------------------------------------
#BOP
#
# !IROUTINE: awake
#
# !DESCRIPTION: Script to print out to the screen every 10 minutes.  This
#  is meant to avoid having the Odyssey interactive session hang becuause
#  of user idle time.
#\\
#\\
# !CALLING SEQUENCE:
#  awake.sh
#
# !REMARKS:
#
# !REVISION HISTORY:
#  06 Jan 2015 - R. Yantosca - Initial version
#EOP
#------------------------------------------------------------------------------
#BOC

# Maximum number of iterations
# (every 10 mins for an 8-hour session = 48 iterations)
COUNTER=48
 
# Sleep for 10 mins, then issue a command that does nothing (but which will 
# provide some activity so that the interactive sessione doesn't time out).
# Repeat until we hit the maximum number of iterations.
while [[ $COUNTER -gt 0 ]]; do
  sleep 10m
  cd .
  let COUNTER=COUNTER-1
done

# Exit normally
exit(0)