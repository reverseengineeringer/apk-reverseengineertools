#!/bin/bash

APKNAME=$1
PKGNAME=`aapt dump badging $APKNAME | grep package:\ name | awk -F\' '{print $2}'`
VERSIONINFO=`aapt dump badging $APKNAME | grep package:\ name | awk -F\'  '{print $3 $4 " " $5 $6}'`
DISPLAYNAME=`aapt dump badging $APKNAME | grep application-label: | awk -F\' '{print $2}'`

echo PKGNAME: $PKGNAME
mkdir -p $PKGNAME

apktool d $APKNAME -o $PKGNAME/apktool -f

mkdir -p tmp
d2j-dex2jar $APKNAME -o tmp/$PKGNAME.jar --force

java -jar jd-cli.jar tmp/$PKGNAME.jar -od $PKGNAME/src



echo DISPLAYNAME: $DISPLAYNAME > $PKGNAME/README.md
echo PKGNAME: $PKGNAME >> $PKGNAME/README.md
echo VERSIONINFO: $VERSIONINFO >> $PKGNAME/README.md


