#!/bin/sh

set -e
set -x

MEM_OPTS=${MEM_OPTS:-"-Xms2g -Xmx2g -Xmn600m"}

exec java ${MEM_OPTS} -jar /opt/app.jar
