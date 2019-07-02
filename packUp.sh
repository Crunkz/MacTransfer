#!/bin/bash
# make sure that interpreter is located in above directory ('which bash')

brewAppsFile=Backup/brewAppsList.txt
appstoreAppsFile=Backup/appstoreAppsList.txt

echo "(Step 1): Exporting brew apps to $brewAppsFile..."
mkdir Backup
touch $brewAppsFile
brew list > $brewAppsFile
echo "Step 1/2 completed"

echo "(Step 2): Exporting apps from AppStore to $appstoreAppsFile..."

brew install mas
touch $appstoreAppsFile
mas list > $appstoreAppsFile

sed -i "" -E 's/[[:digit:]]+/& #/' $appstoreAppsFile
echo "Step 2/2 completed"
