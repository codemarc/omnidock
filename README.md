# Omni Integrators Workbench
# On Docker


Information Builders, Omni Applications are domain specific master data applications that combine a enterprise mastered index with one or more pre-packaged models to provide full identity management, to achieve a 360-degree view of a key entities, with a single golden record for each player.

## About Omnidock
The Omni Integrators Workbench on Docker (omnidock) is a defined process that can be used to run standalone validation of an integrators work product. This document will help you get started.

<br/><br/><hr/>
### Setup on  Windows
Monday, 16th March 2015

At the moment, docker uses linux-specific kernel features, so to run it on Windows you **must** use a virtual machine. Here are two system I have tested used to achieve this:

* [boot2docker v1.5.0](https://github.com/boot2docker/windows-installer/releases/tag/v1.5.0) 
* [rancheros v0.1.2 - Docker 1.5.0 - Linux 3.18.6](https://github.com/rancherio/os/releases/download/v0.1.2/rancheros.iso)

<br/>
#### Windows 7 Profressional Service Pack1


##### using Boot2Docker
The recommended way to use docker on windows is to use the [boot2docker](http://boot2docker.io/). Detailed instructions for this are found in the [docker documentation site](https://docs.docker.com/installation/windows/) in the windows install section. The current installation of the package includes recent versions of

* [VirtualBox](https://www.virtualbox.org)  
* [msysgit](http://msysgit.github.io/) (git, bash and openssh),  
* [Boot2Docker-cli](https://github.com/boot2docker/boot2docker-cli)

You use the Boot2Docker client to control the virtualized Docker Engine thru ssh. Using VirtualBox this way is the most common windows solution.

##### What I did

1. Create the Omni account for testing and login to it. If you are using an older PC you may need to enable the hardware virtiualization setting in the bios.  

1. Download and run the latest [docker-install.exe](https://github.com/boot2docker/windows-installer/releases/tag/v1.5.0) all the way thru including a full reboot.

1. From the Desktop run the "Boot2Docker Start". This shortcut starts actually starts the msysGit interpreter and runs the script named start.sh in the Boot2Docker for Windows directory. 

1. Then issue the following commands from the boot2docker machine

    git clone https://github.com/codemarc/omnidock  
    chmod +x omnidock/omni.sh  
    ln -sf $(pwd)/omnidock/omni.sh /usr/local/bin/omni  
    omni update  
    omni up  
