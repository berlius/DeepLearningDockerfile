## Dockerfiles for Deep Learning

Here are Dockerfiles to let you install images on various projects in deep learning. 

### Why ?
1. Easy installation and acces to GPU with nvidia docker.

2. Easy dependency management

3. Possibility of multiples versions of a project without conflict.


### Setup

All Dockerfiles are on top off the environment of [development for intelligence-artificial]( https://github.com/berlius/artificial-intelligence)

### Obtaining the Docker image
You have 2 options to obtain the Docker image
#### Option 1 : Download the Docker image from Docker Hub

** GPU version **

````
docker pull berlius/[project name]-gpu
````
** CPU version ***

````
docker pull berlius/[project name]-cpu
````
where "project name" is for example "Kulitta" for "Dockerfile.Kulitta.gpu"

#### Option 2 : You can compile localy :

** GPU version **

````
docker build berlius/[project name]-gpu -f Dockerfile.[project name].gpu
````
** CPU version **

````
docker build berlius/[project name]-cpu -f Dockerfile.[project name].cpu
````



