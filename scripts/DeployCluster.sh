#! /bin/bash

#This script will deploy the Openshift cluster in one command.  Pre-requisites will be checked, cluster will be deployed, post-deployment steps will occur, and some environment health checks will be performed
# to ensure the POC requirements were met.
# Keith Calligan
# kcalliga@redhat.com

source ./functions

#Are we root

isroot

# Correct Directory

correctdirectory

#Copy hosts file from GIT source to /etc/ansible/hosts

echo "cp ./hosts /etc/ansible/hosts"
copyhosts

#GET GUID and populate it into the hosts file

changeguid

echo "GUID is $GUID";

echo "sed -i 's/GUID/$GUID/g' /etc/ansible/hosts"

# Ping all Ansible hosts.  If error, exit

echo "Pinging all Ansible hosts"

pinghosts

# Pre-Deployment Check

echo "Running pre-deployment check"

predeploymentcheck


# Deployment

echo "Running Deployment"
deployment

# Create NFS PVs

echo "Creating PVs"
createnfspvs

#Create NFS Mounts
echo "Creating NFS Mounts"
createnfsexports

# Rollout ASB due to missing PVs
echo "Rolling ASB out again"
rolloutasb

# Create NodeJSMongo
createnodejsmongo

#Create Projects
createprojects

#Create default htpasswd entries
copyhtpasswd

# Assign users to projects
assignprojects

