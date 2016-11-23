## chainer-dfi Docker image for Implementation of Deep Feature Interpolation

Here are Dockedfile to get you up and running with a fully functional [Implementation of Deep Feature Interpolation](https://github.com/dsanno/chainer-dfi) code. 

## Setup

[Here is a video of the installation](https://youtu.be/iRjS_EqwyDA)

You have 2 options to obtain the Docker image

#### Option 1 : Download the Docker image from Docker Hub
Docker Hub is a cloud based repository of pre-built images. You can download the image directly from here, which should be _much faster_ than building it locally (a few minutes, based on your internet speed).

```bash
docker pull berlius/chainer-dfi
```

#### Option 2 : Build the Docker image locally 

```
git clone https://github.com/berlius/DeepLearningDockedfile
cd chainer-dfi

sudo docker build -t berlius/chainer-dfi -f Dockedfile.gpu .
```

## Running the Docker image as a Container

### Only for the first intallation in your shared folder :

```
sudo nvidia-docker-plugin

xhost + ; sudo nvidia-docker run -it -v `pwd`:/root/sharedfolder -v /mnt/sda4:/root/sda4 --privileged -v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY=unix$DISPLAY berlius/chainer-dfi 
```
In the new "bash" 

```
/root/install.sh

```


### Data Sharing
See [Docker container persistence](#docker-container-persistence). 
Consider this: You have a script that you've written on your host machine. You want to run this in the container and get the output data (say, a trained model) back into your host. The way to do this is using a [Shared Volumne](#docker-container-persistence). By passing in the `-v /sharedfolder/:/root/sharedfolder` to the CLI, we are sharing the folder between the host and the container, with persistence. You could copy your script into `/sharedfolder` folder on the host, execute your script from inside the container (located at `/root/sharedfolder`) and write the results data back to the same folder. This data will be accessible even after you kill the container.

## What is Docker?
[Docker](https://www.docker.com/what-docker) itself has a great answer to this question.

Docker is based on the idea that one can package code along with its dependencies into a self-contained unit. In this case, we start with a base Ubuntu 14.04 image, a bare minimum OS. When we build our initial Docker image using `docker build`, we install all the deep learning frameworks and its dependencies on the base, as defined by the `Dockedfile`. This gives us an image which has all the packages we need installed in it. We can now spin up as many instances of this image as we like, using the `docker run` command. Each instance is called a _container_. Each of these containers can be thought of as a fully functional and isolated OS with all the deep learning libraries installed in it. 

## FAQs
### Performance
Running the project as Docker containers should have no performance impact during runtime. Spinning up a Docker container itself is very fast and should take only a couple of seconds or less

### Docker container persistence
Keep in mind that the changes made inside Docker container are not persistent. Lets say you spun up a Docker container, added and deleted a few files and then kill the container. The next time you spin up a container using the same image, all your previous changes will be lost and you will be presented with a fresh instance of the image. This is great, because if you mess up your container, you can always kill it and start afresh again. It's bad if you don't know/understand this and forget to save your work before killing the container. There are a couple of ways to work around this:

1. **Commit**: If you make changes to the image itself (say, install a few new libraries), you can commit the changes and settings into a new image. Note that this will create a new image, which will take a few GBs space on your disk. In your next session, you can create a container from this new image. For details on commit, see [Docker's documentaion](https://docs.docker.com/engine/reference/commandline/commit/).

2. **Shared volume**: If you don't make changes to the image itself, but only create data (say, train a new Caffe model), then commiting the image each time is an overkill. In this case, it is easier to persist the data changes to a folder on your host OS using shared volumes. Simple put, the way this works is you share a folder from your host into the container. Any changes made to the contents of this folder from inside the container will persist, even after the container is killed. For more details, see Docker's docs on [Managing data in containers](https://docs.docker.com/engine/userguide/containers/dockervolumes/)
 
### What operating systems are supported?
Docker is supported on all the OSes mentioned here: [Install Docker Engine](https://docs.docker.com/engine/installation/) (i.e. different flavors of Linux, Windows and OS X). If the project as a CPU parameter then the Dockedfile will run on all the above operating systems. However, the GPU parameter will only run on Linux OS. This is because Docker runs inside a virtual machine on Windows and OS X. Virtual machines don't have direct access to the GPU on the host. Unless PCI passthrough is implemented for these hosts, GPU support isn't available on non-Linux OSes at the moment.
