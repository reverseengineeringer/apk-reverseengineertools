#!/bin/bash

APKNAME=$1
PKGNAME=`aapt dump badging $APKNAME | grep package:\ name | awk -F\' '{print $2}'`

echo PKGNAME: $PKGNAME
mkdir -p $PKGNAME

apktool d $APKNAME -o $PKGNAME/apktool -f

mkdir -p tmp
d2j-dex2jar $APKNAME -o tmp/$PKGNAME.jar --force

java -jar jd-cli.jar tmp/$PKGNAME.jar -od $PKGNAME/src




