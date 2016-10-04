#!/bin/bash
#
# this script install "intro-to-rl" permanently in your shared folder
# all your changes will be saved permanently in your shared folder


cd sharedfolder

# Install intro-to-rl
git clone https://github.com/btaba/intro-to-rl

cd intro-to-rl 

# adapting matplotlib invocation
cp -f /root/intro-to-rl/notebooks/chapter2.ipynb  notebooks/chapter2.ipynb
cp -f /root/intro-to-rl/notebooks/chapter4.ipynb  notebooks/chapter4.ipynb
cp -f /root/intro-to-rl/notebooks/chapter6.ipynb  notebooks/chapter6.ipynb
cp -f /root/intro-to-rl/notebooks/chapter7.ipynb  notebooks/chapter7.ipynb
cp -f /root/intro-to-rl/notebooks/chapter5_racetrack/racetrack.ipynb  notebooks/chapter5_racetrack/racetrack.ipynb

echo "***********************************************************************************"
echo "*"                                                                                 
echo "* To read and test the exercices \:"
echo "* type \"cd sharedfolder/intro-to-rl/notebooks\" in the lxterminal and"
echo "* type \"jupyter notebook\" in the lxterminal "     
echo "* and go to the web browser at adresse http://localhost:8888/ "                     



