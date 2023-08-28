# musicinxite
This repository use to control debian/ubuntu.

to set up new box with OS

On the remote server/target linux box
1. ```sudo apt update``` 
2. ```sudo apt -y install zenity```
3. Open terminal at the folder containing ssh_script 
4. run ```sh ssh_script.sh```  

On your local system
1. Open terminal at the parent folder
2. Use ```ansible-playbook playbooks/box_linux.yml```
3. Press enter and change any values if needed (Host target name will be different for your device, which is the name of the target's login username).
