#!/bin/bash

if [ ! -n "$1" ]
then
  echo "Usage: `basename $0` versionName"
  exit 1
fi  

version=$1
./gradlew clean sources javadocJarRelease && mvn deploy:deploy-file \	
	-Dfile=build/libs/facebook-api-android-aar.aar\
	-DrepositoryId=nexus.logicalgrape.com\
	-Durl=http://nexus.logicalgrape.com/content/repositories/releases\
	-DgroupId=com.facebook.android\
	-DartifactId=facebook\
	-Dversion=$version\
	-Dpackaging=aar\
	-Dsources=build/libs/facebook-api-android-aar-sources.jar\
	-Djavadoc=build/libs/facebook-api-android-aar-javadoc.jar\
