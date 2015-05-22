# Node/MongoDB Environment

This repository contains the main structure to run a NodeJS/MongoDB environment provisioned with Vagrant and Puppet.

## Setting up the environment

Your file structure should end up looking like this one:

- vagrant-env
	- .vagrant
	- puppet
	- Vagrantfile
- app
	- **Your project files go here**

In order to set up the environment:

1. Download vagrant from this [link](http://www.vagrantup.com/downloads.html).

2. Download virtual box from this [link](https://www.virtualbox.org/wiki/Downloads).

3. Once both are installed clone this repository to your machine with:

		git clone --recursive git@github.com:GianlucaCandiotti/node-env.git repository-name

4. If you are working on a Windows environment, run this command in a command prompt as administrator in order to allow all kinds of symbolic links to be created on the computer ( Omit this step if you have done this before and skip to step 6 ) :

		fsutil behavior set SymlinkEvaluation L2L:1 R2R:1 L2R:1 R2L:1

5. Reboot your computer to apply changes.

6. Open a terminal and run the command **vagrant up** from the folder *repository-name/vagrant-env/*.

7. Once the virtual machine's been provisioned, run **vagrant ssh** to connect to the terminal.

8. The sync folder inside the VM is */vagrant* and inside the host machine it looks for *repository-name/app*.

9. Don't forget that the Vagrantfile will look for the *./app* folder as the sync folder. If you already have some files, put them in an *./app* folder so that your structure looks like the one described above. If you are starting from scratch or cloning a repository just create the *./app* folder and put your files in there.

- - -

**Feel Free to delete this README or replace it with your own.**

- - -

**This repository uses [Vagrant Scaffold](https://github.com/GianlucaCandiotti/vagrant-scaffold) to run the environment. Refer to its documentation to know more.**