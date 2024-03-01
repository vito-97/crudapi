#!/bin/bash

think=`pwd`"/think"
ps -ef | grep think | awk '{print $2;}' | xargs kill -9

#todo

echo "success"
