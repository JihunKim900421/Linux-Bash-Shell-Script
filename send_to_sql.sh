#!/bin/bash
#jayhoon

#-----------------------
# Send to MySQL database
#-----------------------

# Get All shell_script from list.txt
grep -r "# jayhoon" ./* | grep -v list.txt > list.txt
num=$(cat /home/jayhoon/list.txt | wc -l)

QR=$(
for ((i=1; i<=$num; i++))
  do
    echo -n "('"
    echo -n $(cat /home/jayhoon/list.txt | sed 's/..........$//' | sed -n "$i"p)
    echo -n "'),"
done)

Query=$(echo "${QR::-1}")

# Send to SQL
echo "use jayhoon; insert into shell_script_list (name) values $Query" | mysql -ujayhoon -pdndndndn1

# Visulizing Tables

exit 0
