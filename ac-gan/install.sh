#!/bin/bash
#
echo
echo "this script install \"ac-gan\" permanently in your shared folder"
echo "all your changes will be saved permanently in your shared folder"
echo

git clone https://github.com/buriburisuri/ac-gan 
cd ac-gan

python train.py

python generate.py 

echo "See tests results in \"asset/train\" folder"



