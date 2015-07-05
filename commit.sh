
OLDUSERNAME=`git config --global user.name`
OLDEMAIL=`git config --global user.email`

git config --global user.name "reverseengineeringer"
git config --global user.email "reverseengineeringer@hackeradmin.com"

echo Name: `git config --global user.name`
echo Email: `git config --global user.email`

APKNAME=$1
PKGNAME=`aapt dump badging $APKNAME | grep package:\ name | awk -F\' '{print $2}'`
VERSIONINFO=`aapt dump badging $APKNAME | grep package:\ name | awk -F\'  '{print $3 $4 " " $5 $6}'`

cd $PKGNAME
git status

git add *
git add .*
git commit  -m "$VERSIONINFO"
echo to commit run:
echo git push https://reverseengineeringer@github.com/reverseengineeringer/$PKGNAME


git config --global user.name $OLDUSERNAME
git config --global user.email $OLDEMAIL



