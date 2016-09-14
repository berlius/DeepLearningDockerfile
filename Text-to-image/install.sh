#!/bin/bash

cd sharedfolder

# Install test-to-image
git clone https://github.com/paarthneekhara/text-to-image 

cd text-to-image
mkdir Data/Models
mkdir Data/flowers
mkdir Data/Samples
mkdir Data/val_samples
mkdir nltk_data

cd Data/Models

wget "https://www.dropbox.com/s/gpynuz0fka741x5/latest_model_flowers_temp.ckpt?dl=1" -O latest_model_flowers_temp.ckpt
wget "https://www.dropbox.com/s/vr09brnwu5b3co9/latest_model_flowers_temp.ckpt.meta?dl=1" -O latest_model_flowers_temp.ckpt.meta

cd ..

cd flowers

wget http://www.robots.ox.ac.uk/~vgg/data/flowers/102/102flowers.tgz

tar xvf 102flowers.tgz

wget "https://www.dropbox.com/s/oqzc89r2cru1ylj/cvpr2016_flowers.tar.gz?dl=0" -o cvpr2016_flowers.tar.gz

tar xvf cvpr*

cd ..

mkdir skipthoughts

cd skipthoughts

wget http://www.cs.toronto.edu/~rkiros/models/dictionary.txt
wget http://www.cs.toronto.edu/~rkiros/models/utable.npy
wget http://www.cs.toronto.edu/~rkiros/models/btable.npy
wget http://www.cs.toronto.edu/~rkiros/models/uni_skip.npz
wget http://www.cs.toronto.edu/~rkiros/models/uni_skip.npz.pkl
wget http://www.cs.toronto.edu/~rkiros/models/bi_skip.npz
wget http://www.cs.toronto.edu/~rkiros/models/bi_skip.npz.pkl

cd ..
cd ..

cp /root/sample_captions.txt Data/sample_captions.txt
cp /root/sample_caption_vectors.hdf5 Data/sample_caption_vectors.hdf5

#python data_loader.py --data_set="flowers"


# test generation images
cp /root/nltk_data.py .

export NLTK_DATA=/root/sharedfolder/text-to-image/nltk_data

python nltk_data.py

python generate_thought_vectors.py --caption_file="Data/sample_captions.txt"
python generate_images.py --model_path=Data/Models/latest_model_flowers_temp.ckpt --n_images=8

echo "************************************************************"
echo "*                                                          *"
echo "* The generated images will be saved in Data/val_samples/  *"
  



