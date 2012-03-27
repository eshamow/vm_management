#!/bin/bash -x
fission snapshot revert pe-debian6 Master
fission snapshot revert pe-debian6-2 Agent
fission snapshot revert pe-centos5 Agent
fission start pe-debian6
fission start pe-debian6-2
fission start pe-centos5
sleep 60
ssh debian6 "ntpdate time.apple.com; puppet agent -tv"
ssh debian62 "ntpdate time.apple.com; puppet agent -tv"
ssh centos5 "ntpdate time.apple.com; puppet agent -tv"
echo "Systems are go!"
