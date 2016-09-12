#!/bin/bash

cd sharedfolder

git clone https://github.com/donya/Kulitta
cd Kulitta
cabal install 

git clone https://github.com/donya/KulittaCompositions

git clone https://github.com/donya/PythonKulitta
cd PythonKulitta
git clone https://github.com/vishnubob/python-midi
cd python-midi
python setup.py install
cd .. 

echo "************************************************************"
echo "*                                                          *"
echo "* The generated images will be saved in Data/val_samples/  *"
  



