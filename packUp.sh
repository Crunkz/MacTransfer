#!/bin/bash
# make sure that interpreter is located in above directory ('which bash')

echo "(Step 1): Exporting brew apps to /Backup/brewAppsList.txt..."
mkdir Backup
touch Backup/brewAppsList.txt
brew list > Backup/brewAppsList.txt
echo "Step 1/2 completed"

echo "(Step 2): Exporting apps from AppStore to /Backup/appstoreAppsList.txt..."

brew install mas
touch Backup/appstoreAppsList.txt
mas list > Backup/appstoreAppsList.txt

# sed '/[^0-9]//a \
#' Backup/appstoreAppsList.txt
echo "Step 2/2 completed"
