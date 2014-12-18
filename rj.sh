#! /bin/bash

# author: 	yip
# date: 	2014-12-18
# description: 	this script make it easy to login with the rjsupplicant under linux.

# define the path of rjsupplicant.sh(absolute path recommended)
rjs_path=""

# define the student's number
username=""

# check whether the path of rjsupplicant.sh is defined or not
if [ -z "$rjs_path" ]
then
	echo "please edit $0 and define the path of rjsupplicant.sh"
	exit 1
fi

# check whether the student number is defined or not
if [ -z "$username" ]
then
	echo "please edit $0 and define your student number"
	exit 1
fi

# validate user's password
if [ $# -lt 1 ]
then
	echo "usage: $0 -l(login) your-password OR -q(quit)"
	exit 1
fi

# switch operation
operate="$1"

case "$operate" in 
	l|-l)
		password="$2"
		if [ -z "$password" ]
		then
			echo "your-password can not be empty"
			exit 1
		else
			# run the rjsupplicant to login
			sudo $rjs_path -u "$username" -p "$password"
		fi
	;;
	
	q|-q)
		# logout
		sudo $rjs_path -q
	;;
	
	*)
		echo "usage: $0 l(login) your-password OR q(quit)"
		exit 1
	;;
esac
exit 0

