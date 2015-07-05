
OLDUSERNAME=`git config --global user.name`
OLDEMAIL=`git config --global user.email`

git config --global user.name "None"
git config --global user.email "None"

echo Name: `git config --global user.name`
echo Email: `git config --global user.email`

APKNAME=$1
PKGNAME=`aapt dump badging $APKNAME | grep package:\ name | awk -F\' '{print $2}'`
VERSIONINFO=`aapt dump badging $APKNAME | grep package:\ name | awk -F\'  '{print $3 $4 " " $5 $6}'`

git status $PKGNAME

git add $PKGNAME/*
git add $PKGNAME/.*
git commit $PKGNAME -m "$VERSIONINFO"



git config --global user.name $OLDUSERNAME
git config --global user.email $OLDEMAIL



