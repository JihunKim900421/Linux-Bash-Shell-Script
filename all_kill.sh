#!/bin/bash
# jayhoon

#-----------------------------------
# Kill the all running processes
# Need to excute with root privilege
#-----------------------------------

_ERROR_HANDLER=0    # Error Handler using exit statement

echo ""
echo -n "Killing the all processes..."

# Kill running processes
kill -9 `ps -a | grep pts | grep -v ps | grep -v all_kill | grep -v sudo | grep -v vim | awk '{print $1}'`

# Error Handling. "$?" should be 137 cause "kill -9" command
_ERROR_HANDLER="$?"
if [ "$_ERROR_HANDLER" -ne 0 ]; then
  echo  "Not 0 Error occured. Check the system"
  echo "Exit statemnet $_ERROR_HANDLER"
  exit
else
  echo "Done"
fi

# Refresh Swap memory with toggle
echo -n "Drop out Swap Memory..."
swapoff -a && swapon -a

wait

# Error Handling. "$?" should be 0.
_ERROR_HANDLER="$?"
if [ "$_ERROR_HANDLER" -eq 0 ]; then
  echo "Done"
elif [ "$_ERROR_HANDLER" -eq 2]; then
  echo "Check the system."
else
  echo "Exit Statement is not 0 or 2. Check the system"
  echo "Exit statement $_ERROR_HANDLER"
  exit
fi


# Flush Buffer & Caches
echo -n "Drop out Buffer & Faches after Flushing..."
sync && echo 3 > /proc/sys/vm/drop_caches

wait

# Error Handling
_ERROR_HANDLER="$?"
if [ "$_ERROR_HANDLER" -eq 0 ]; then
  echo "Done."
elif [ "$_ERROR_HANDLER" -eq 2]; then
  echo "Check the file Permission."
else
  echo "Exit Satement is not 0. Check the system"
  exit
fi

echo "Successfully finished."

wait

exit 0
