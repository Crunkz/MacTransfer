#!/bin/bash
# make sure that interpreter is located in above directory ('which bash')

brewAppsFile=Backup/brewAppsList.txt
appstoreAppsFile=Backup/appstoreAppsList.txt
gitConfigFile=Backup/gitconfig.txt

echo "(Step 1): Exporting brew apps to $brewAppsFile..."
mkdir Backup
touch $brewAppsFile
brew list > $brewAppsFile
echo "Step 1/2 completed"

echo "(Step 2): Exporting apps from AppStore to $appstoreAppsFile..."

if [[ $(command -v mas) == "" ]]; then
    echo "Installing mas..."
    brew install mas
fi

touch $appstoreAppsFile
mas list > $appstoreAppsFile

sed -i "" -E 's/[[:digit:]]+/& #/' $appstoreAppsFile
echo "Step 2/3 completed"

if test -f $HOME/.gitconfig; then
    echo "(Step 3): Exporting git configuration settings to $gitConfigFile..."
    touch $gitConfigFile
    cat $HOME/.gitconfig > $gitConfigFile
    echo "Step 3/3 completed"
fi

