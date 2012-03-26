#!/bin/bash -x
ssh debian6 "shutdown -h now"
ssh debian62 "shutdown -h now"
ssh centos5 "shutdown -h now"
echo "All systems restarted"
