## Dockerfiles for Deep Learning

Here are Dockerfiles to let you install images on various projects in deep learning. 

### Why ?
1. Easy installation and acces to GPU with nvidia docker.

2. Easy dependency management

3. Possibility of multiples versions of a project without conflict.


### Setup

All Dockerfiles are on top off [development environment for intelligence-artificial]( https://github.com/berlius/artificial-intelligence)

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
where "project name" is for example "kulitta" for "Dockerfile.kulitta.gpu"

#### Option 2 : You can compile localy :

** GPU version **

````
git clone https://github.com/berlius/DeepLearningDockerfile
cd DeepLearningDockerfile

docker build -t berlius/[project name]-gpu -f Dockerfile.[project name].gpu
````
** CPU version **

````
git clone https://github.com/berlius/DeepLearningDockerfile
cd DeepLearningDockerfile

docker build -t berlius/[project name]-cpu -f Dockerfile.[project name].cpu
````
where "project name" is for example "kulitta" for "Dockerfile.kulitta.cpu"


