## Dockerfiles for Deep Learning

Here are Dockerfiles to let you install images on various projects in deep learning. 

### Why ?
1. Easy installation and acces to GPU with nvidia docker.

2. Easy dependency management

3. Possibility of multiples versions of a project without conflict.


### Install

All Dockerfiles are on top off the environment of [development for intelligence-artificial]( https://github.com/berlius/artificial-intelligence)

You can download from my dockerhub repository :

## GPU version

````
docker pull berlius/[project name]-gpu
````
## CPU version

````
docker pull berlius/[project name]-cpu
````
where "project name" is for example "Kulitta" for "Dockerfile.Kulitta.gpu"

You can compile localy :

## GPU version

````
docker build berlius/[project name]-gpu -f Dockerfile.[project name].gpu
````
## CPU version

````
docker build berlius/[project name]-cpu -f Dockerfile.[project name].cpu
````



