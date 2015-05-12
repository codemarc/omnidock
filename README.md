# Omni Integrators Workbench On Docker

Information Builders, Omni Applications are domain specific master data applications that combine a enterprise mastered index with one or more pre-packaged models to provide full identity management, to achieve a 360-degree view of a key entities, with a single golden record for each player.

## About Omnidock
The Omni Integrators Workbench on Docker (omnidock) is a defined process that can be used to run standalone validation of an integrators work product. This document will help you get started.

### Boot2Docker
Tuesday, 12th May 2015

At the moment, docker uses linux-specific kernel features, so to run it on non-linux systems ( windows, mac osx ) you **must** use a virtual machine.

#### Setup

* [Windows - boot2docker v1.6.0](https://github.com/boot2docker/windows-installer/releases/tag/v1.6.0)
* [Mac OSX - boot2docker v1.6.0](https://github.com/boot2docker/osx-installer/releases/v1.6.0)

The recommended way to use docker on windows and osx is to use the [boot2docker](http://boot2docker.io/). Detailed instructions for this are found in the [docker documentation site](https://docs.docker.com/installation/). The current installation of the package includes recent versions of

* Boot2Docker 1.6.0 (Docker v1.6.0, Linux v3.18.11)
* Boot2Docker Management Tool v1.6.0
* VirtualBox v4.3.26-r98988
* Docker Client v1.6.0 [osx]
* msysGit v1.9.5-preview20150319 [windows]

You use the Boot2Docker client to control the virtualized Docker Engine thru ssh. Using VirtualBox this way is the most common non-linux solution.

##### Up and running

1. Create an ***omni*** account for testing and login to it. Before you begin, please make sure there is a fair amount of disk space associated with your $HOME directory ( .boot2docker uses approx 24M, and at least another 2.25G for virtual box vm and omnidock uses another 24M ) and if you add a little more data figure you'll need 5G free to be safe.

1. Download and run the latest boot2docker install. all the way thru (it may require a full reboot).  If you are using an older PC you may need to enable the hardware virtiualization setting in the bios.  

1. On your Desktop you will see "Boot2Docker Start" (windows) or the "boot2docker" app (mac). These shortcut start a platform specific bash shell and runs enough initialization to make docker available. Do ***NOT*** use them until you have a running install.

	Heres the current plan. we will clone a version of the omnidock scripts from git hub into 	our $HOME directory and then run the cloned setup script to complete the 	process. Issue the following commands:

	* **Windows**:
	Use the "**Git Bash**" shell to complete this step ( it was installed with boot2docker ). Press the windows key (or ctrl-escape) and type the word ***git*** in the search box. Finally run "**Git Bash**" to continue.
	
	* **Mac OSX**:
	bash shell is native on mac, so open up a terminal and go home (cd ~)  


1. From the bash prompt issue the following commands:  

		cd $USERPROFILE  
		git config --global core.autocrlf input  
		git clone https://github.com/codemarc/omnidock    
		cd omnidock  
		bin/setup  
    
1. If the setup script works you will now be logged into the boot2docker machine at the docker@boot2docker:~$ command prompt ( under *ascii boot2docker logo* ). From the ash prompt issue the following commands:<br/>  
  

		cd omnidock  
		./omni.sh update 
		./omni.sh up all

	At this point you should have a docker machine (boot2docker ip is usually 192.168.59.103) available to your development environment, with the integrators tooling available. You should validate your connection with the database by using pgAdmin and connecting to the postgres instance at 192.168.59.103:5432. You should find the dqreo and patient databases already loaded with metadata.


	$ ./omni.sh  
	Running on omega (172.19.2.196)  
	
	OmniDock v0.8 Usage: omni [command]  
	A wrapper to start/stop/update the Omni Integrators Workbench  
	  
	Commands:  
	ip		lists known ip addresses  
	ssh		ssh to the named container  
	logs		show the logs of the named container  
	up		creates and starts test environment  
	down		stops and removes test environment  
	update		updates container images  




##### Done for now

So it all works and now its time to move on to something else. If you want to suspend the environment you can type:

	$ boot2docker suspend		To save the environment or you can type
	$ boot2docker resume 		To bring it back
	$ boot2docker ssh		To ssh into the running docker machine
	
	and from there you can type 

	$ ./omni.sh down		To stop the containers so that we can start fresh start

	and finally 
	
	$ boot2docker poweroff
	
	> fin


##### PLEASE NOTE:
This process is currently under development, your mileage may vary.
	
##### Contact Info
If you have any questions or comments please feel free to reach out via email [marc_greenberg@ibi.com](mailto:marc_greenberg@ibi.com)





