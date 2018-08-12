#! /bin/bash
export GUID=`hostname|awk -F "." '{print $2}'`;

#This script will be used to create new users in the Openshift cluster


if [ -z "$1" ]||[ -z "$2" ]||[ -z "$3" ];
	then
		echo "Usage ./NewUserScript.sh <username> <client> <project>"
        else
# User being created in htpasswd

cd /root/AdvancedDeployment/scripts/NewUserScript;
htpasswd htpasswd $1

# User Being Created and mapped in Openshift Cluster

#ssh master1.$GUID.internal "

for host in master1 master2 master3; do
scp htpasswd $host.$GUID.internal:/tmp 2> /dev/null;
ssh $host.$GUID.internal "sudo mv /tmp/htpasswd /etc/origin/master" 2> /dev/null;
done;
fi

# Set User's label to their client name

ssh master1.$GUID.internal "oc label user/$1 client=$2";

