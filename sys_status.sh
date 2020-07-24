#!/bin/bash
# jayhoon

#---------------------------
# System Status Monitoring
#---------------------------

echo
date '+%F %T'     # Date & Current Time    
echo

# System Version
echo "OS Version : `cat /etc/issue | cut -b1-16`"
echo "BASH Version : $BASH_VERSION"
echo

echo "Current User : `whoami`"    # Current User
echo

top -b -n 1 | head -n 5         # System Status
echo
exit 0
