#!/bin/bash
#
# this script install "synthesizing-image" permanently in your shared folder
# all your changes will be saved permanently in your shared folder


git clone https://github.com/Evolving-AI-Lab/synthesizing 
cd synthesizing
rm -rdv nets
rm -v /root/sharedfolder/synthesizing/settings.py
cp -v /root/settings-gpu.py /root/sharedfolder/synthesizing/settings.py 

wget http://www.mediafire.com/file/sk566ctkg8x997q/nets.gz
URL=$(grep "kNO = "  nets.gz | sed 's/\";//g' | sed 's/kNO = \"//g')
rm -v nets.gz 
wget $URL
tar xzvf nets.gz

# tests results in "output" folder
./1_activate_output.sh
./2_activate_output_placesCNN.sh
./3_start_from_real_image.sh
./4_activate_hidden.sh
./5_activate_output_GoogLeNet.sh

