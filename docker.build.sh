#!/usr/bin/env bash
#
# Shell script to create a Dockerfile from a template and push it to a repository
#

if [ ! -f Dockerfile ]; then
  echo "Error: must invoke from the top level of the cloned directory"
  exit 1
fi

rootname="janeczku"

version="2.2.0.125"
if [ $# -ne 0 ]
  then
version=$1
fi


#Build the docker image
docker build -t ${rootname}/newrelic-agent:${version} .

#Tag the image
docker tag --force=true ${rootname}/newrelic-agent:${version}  ${rootname}/newrelic-agent:latest

#push the two tagged images
docker push ${rootname}/newrelic-agent:${version}
docker push ${rootname}/newrelic-agent:latest
