## Linux

ls,ls -a,ls -l,ls -latr
mkdir dir
cd dir
cd .
cd ..
pwd
whoami
hostname
date
touch name.txt
vim name.txt
nano name.txt
chmod 755 file.txt
chmod +x file.txt
ps 
pu aux
kill pId
ls | wc -l
ps aux | grep process
grep pattern file.txt
df -h
cat filename
head filename
head -n 5 filename
tail filename
tail -f filename

systemctl start/restart/reload/stop service
journalctl 

## Shell Scripting

#!/bin/bash --> Shebang
vim name.sh
In order to execute,
chmod +x name.sh
./name.sh
VAR=VALUE
ACCESS: $VAR
Exit Status: 0-255
0 : SUCCESS
Non-zero : FAILURE
$? : returns the exit status of the previously executed command
$# : number of parameters/arguments to file
$@ : accept all
-f FILE(file or not)
-d 
> OVERRIDE
>> APPEND
if [ condition ]
then
  COMMAND
else
  COMMAND
fi
condition: -eq,-ne,-gt,-ge,-lt,-le
if [ condition ]
then
  COMMAND
elif [ condition ]
then
  COMMAND
else
  COMMAND
fi
INPUT: read -p "msg" VAR
for i in NUMBERS
do
  COMMAND
done
while [ condition ]
do
  COMMAND
done

SOME Basic if problems:
if [ -f FILE ]  #FILE or not
then
  COMMAND

if [ "$?" -eq 0 ]
then
  COMMAND

if [ '$#' -eq 0 ]
then
  COMMAND

FUNCTION:

function_name(){

}

Call:
fucntion_name

with argument:
function_name(){
  VAR=$1
}

CALL:
function_name  ARG1 ARG2

Also direct argument from command
./name.sh file_name

$0 file name

set -e [exit when you get error]