#!/bin/bash -x
ssh debian6 "shutdown -r now"
ssh debian62 "shutdown -r now"
ssh centos5 "shutdown -r now"
echo "All systems restarted"
