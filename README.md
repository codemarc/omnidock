# Omni Integrators Workbench On Docker

Information Builders, Omni Applications are domain specific master data applications that combine a enterprise mastered index with one or more pre-packaged models to provide full identity management, to achieve a 360-degree view of a key entities, with a single golden record for each player.

## About Omnidock
The Omni Integrators Workbench on Docker (omnidock) is a defined process that can be used to run standalone validation of an integrators work product. This document will help you get started.

### Boot2Docker
Monday, 16th March 2015

At the moment, docker uses linux-specific kernel features, so to run it on non-linux systems ( windows, mac osx ) you **must** use a virtual machine.

#### Setup

* [Windows - boot2docker v1.5.0](https://github.com/boot2docker/windows-installer/releases/tag/v1.5.0)
*  [Mac OSX - boot2docker v1.5.0](https://github.com/boot2docker/osx-installer/releases/latest)

The recommended way to use docker on windows and osx is to use the [boot2docker](http://boot2docker.io/). Detailed instructions for this are found in the [docker documentation site](https://docs.docker.com/installation/). The current installation of the package includes recent versions of

* [VirtualBox](https://www.virtualbox.org)  
* [msysgit](http://msysgit.github.io/) (git, bash and openssh),  
* [Boot2Docker-cli](https://github.com/boot2docker/boot2docker-cli)

You use the Boot2Docker client to control the virtualized Docker Engine thru ssh. Using VirtualBox this way is the most common non-linux solution.

##### Up and running

1. Create the Omni account for testing and login to it.  

1. Download and run the latest boot2docker install. all the way thru (it may require a full reboot).  If you are using an older PC you may need to enable the hardware virtiualization setting in the bios.  

1. From the Desktop run the "Boot2Docker Start" (windows) or the "boot2docker" app (mac) . This shortcut starts actually starts a platform specific bash shell and runs enough initialization to make docker available.

	* **Windows**:
	You should use the "**Git Bash**" shell to complete this step (installed with boot2docker ). Press the windows key (or ctrl-escape) and type the word ***git*** in the search box. Finally run "**Git Bash**" to continue.
	
	* **Mac OSX**:
	bash shell is native on mac, so when you run the "boot2docker" app on the mac you are left in an appropiate shell.
	
1. Heres the current plan. we will clone a version of the omnidock scripts from git hub into our users local directory and then run out cloned setup script to complete the process.Issue the following commands:

    git config --global core.autocrlf input  
    git clone https://github.com/codemarc/omnidock    
    cd omnidock  
    ./setup  
    
1. If the setup script works you will now be logged into the boot2docker machine at the command prompt with ascii docker logo. The command sequence from here is 

	cd omnidock          
    ./omni.sh upgrade  

At this point you should have a docker machine (boot2docker ip is usually 192.168.59.103) available to your development environment, with the integrators tooling available. You should validate your connection with the database by using pgAdmin and connecting to the postgres instance at 192.168.59.103:5432. You should find the omni database with the healthviews schema. 

##### Done for now

So it all works and now its time to move on to something else. If you want to suspend the environment you can type:

	$ boot2docker suspend		To save the environment or you can type
	$ boot2docker resume 		To bring it back
	$ boot2docker ssh			To ssh into the running docker machine
	
	and from there you can type 

	$ ./omni.sh down			To stop the containers so that we can start fresh start

	and finally 
	
	$ boot2docker poweroff
	
	> fin

<br/><br/>

----
### PLEASE NOTE:
This process is currently under development, your mileage may vary.
	
#### Contact Info
If you have any questions or comments please feel free to reach out via email [marc_greenberg@ibi.com](mailto:marc_greenberg@ibi.com)



    
	
