FROM floydhub/dl-docker:cpu

MAINTAINER berlius <berlius52@yahoo.com>

#RUN echo -e "\n**********************\nMicrosoft-malmo\n**********************\n" && \
#	echo -e "\nBuilding Microsoft-malmo Docker Image...\n" 

# Install some dependencies
RUN apt-get install -y libboost-all-dev \
        libpython2.7 \
        openjdk-7-jdk \
        lua5.1 \
        libxerces-c3.1 \
        liblua5.1-0-dev \
        libav-tools python-tk \
        gnome-terminal

# Update-ca-certificates
RUN update-ca-certificates -f 

# Update environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 \
    CLASSPATH=/usr/lib/jvm/java-7-openjdk-amd64/libtools.jar:$CLASSPATH \
    PATH=/usr/lib/jvm/java-7-openjdk-amd64/bin:$PATH

WORKDIR "/root"
CMD ["/bin/bash"]
