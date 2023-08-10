# musicinxite
This repository use to control infrastructer.  

to upload ssh keys run ```ansible-playbook playbooks/deploy_ssh_keys.yml -i inventory ```  
to upload new openvpn_pritunl.service, openvpn-pritunl.config run ```ansible-playbook playbooks/openvpn.yml -i inventory ```  
to set up new box ```ansible-playbook playbooks/box_legacy_install.yml```  
to set up new box with OS corelec matrix rc2 ```ansible-playbook playbooks/box_new_generation_install.yml```  
to set up new box with OS corelec matrix for tanix boxes ```ansible-playbook playbooks/box_new_generation_install_tanix.yml```  
add password to webinterface if you want you can change it variable http_password: "testpassword"  
to set up iptables ```ansible-playbook playbooks/deploy_iptables.yml```    
[Docs in google disk](https://docs.google.com/document/d/1gRGXoC6bLkBw5WKaQ_CWP45kO4KawLbBspukGKyAeLc/edit#)