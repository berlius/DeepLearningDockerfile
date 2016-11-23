#!/bin/bash
#
echo
echo "this script install \"chainer-dfi\" permanently in your shared folder"
echo "all your changes will be saved permanently in your shared folder"
echo

git clone https://github.com/dsanno/chainer-dfi 
cd chainer-dfi 

wget http://www.robots.ox.ac.uk/~vgg/software/very_deep/caffe/VGG_ILSVRC_19_layers.caffemodel

python src/create_chainer_model.py

wget "https://www.dropbox.com/sh/8oqt9vytwxb3s4r/AADIKlz8PR9zr6Y20qbkunrba/Img/img_align_celeba.zip?dl=0" -O img_align_celeba.zip
unzip img_align_celeba.zip

wget "https://www.dropbox.com/sh/8oqt9vytwxb3s4r/AAC7-uCaJkmPmvLX2_P5qy0ga/Anno/list_attr_celeba.txt?dl=0" -O list_attr_celeba.txt

python src/extract_image.py img_align_celeba list_attr_celeba.txt image/smile image/normal smiling young,black_hair,straight_hair -e eyeglasses,male,wearing_hat,pale_skin,narrow_eyes,bushy_eyebrows,chubby,double_chin,bald,bangs,receding_hairline,sideburns,wavy_hair

python src/train.py sample/sample.png sample/out.png image/normal image/smile -g 0 -i 2000

echo
echo
echo "See results in \"sample\" folder"



