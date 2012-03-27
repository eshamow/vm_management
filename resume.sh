#!/bin/bash -x
fission start pe-debian6
fission start pe-debian6-2
fission start pe-centos5
sleep 30
ssh debian6 "ntpdate time.apple.com; puppet agent -tv"
ssh debian62 "ntpdate time.apple.com; puppet agent -tv"
ssh centos5 "ntpdate time.apple.com; puppet agent -tv"
echo "Systems are go!"
