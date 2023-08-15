# musicinxite
This repository use to control debian/ubuntu.

to set up new box with OS

1. Setup ssh connection from target system. Open terminal at the folder containing ssh_script and run ```sh ssh_script.sh```  

2. In your local system, use ```ansible-playbook playbooks/box_linux.yml```
3. Press enter and change any values if needed (Host target name will be different for your device, which is the name of the target's login username).
