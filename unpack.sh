#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brewAppsFile=Backup/brewAppsList.txt

while read app; do
echo "Installing $app..."
brew install $app
done < $brewAppsFile

brew install mas

appstoreAppsFile=Backup/appstoreAppsList.txt

while read app; do
app_id=$(echo $app | cut -d '#' -f 1)
app_name=$(echo $app | cut -d '#' -f 2-)
echo "Installing $app_name (ID: $app_id)..."
mas install $app_id
done < $appstoreAppsFile
