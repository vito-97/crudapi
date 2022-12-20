#!/bin/bash
ps -ef | grep think | awk '{print $2;}' | xargs kill -9

think=`pwd`"/think"

#todo

echo "success"
