# /bin/bash
#Script for create vpn SSL users for the APM module of BIG-IP F5 via shell

#Verify you are "root"
WHOAMI=`/usr/bin/whoami`
if [ $WHOAMI != "root" ]; then
echo "Hay que ser root para poder correr el script!"
exit 1
fi
##############################################################
#Read the file located in /root/data.txt and makes a cat

NEW_USERS="/root/datos.txt"
cat ${NEW_USERS} | \

#Adds a variable to each column

while read UNAME INSTANCE PASSWORD USERGROUPS LOGINFAILURES LOCKEDOUT CHANGEPASSWORD FIRSTNAME LASTNAME EMAIL ; do

#This echo is because for each 4000 characters, it stops
echo

#Run the command with each data in the list

ldbutil --add --uname="$UNAME" --password="$PASSWORD" --instance="$INSTANCE" --user_groups="$USERGROUPS" --login_failures="$LOGINFAILURES" --change_passwd="$CHANGEPASSWORD" --locked_out="$LOCKEDOUT" --first_name="$FIRSTNAME" --last_name="$LASTNAME" --email="$EMAIL"

#On screen you will see the progress of each user, and his configuration

echo -e "Creating user \e[1;31m ${UNAME} \e[0m in the group \e[94m ${USERGROUPS}\e[0m with the email \e[95m${EMAIL}\e[0m and the instance \e[96m${INSTANCE}\e[0m"

done
################################################################
#Example of the file data.txt
################################################################

#username /Common/instance 123456789 arq 0 0 0 firstname lastname mail@mail.com
