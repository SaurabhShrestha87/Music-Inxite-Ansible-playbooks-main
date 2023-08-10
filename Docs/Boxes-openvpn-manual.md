# Install open vpn manual on boxes

1. You need create key and have access to box with coreelec or libreelec.  

2. Openvpn daemon file store ```/storage/.config/system.d/openvpn.service.sample```  
Default config for openvpn ```/storage/.config/openvpn.conf```  

3. Copy openvpn key and rename to openvpn.conf

4. Restart systemd daemon ```systemctl restart openvpn.service```  

5. Check opevpn work ```systemctl status openvpn.service```
We can see ip address that use in box for tunnel:  
    ```ip a show tun0```

## Ansible role openvpn

Run ansible playbook ```ansible-playbook playbooks/openvpn.yml -i inventory```  

How it work:  
    1.Script check have client openvpn-pritunl.service
    2.If not it start to get hostname from client
    3. When copy openvpn-pritunl.serivce  
    ```ansible-musicinxite/playbooks/openvpn/openvpn-pritunl.service```  
    to  
    ```/storage/.config/system.d/ ```  
    4.Copy openvpn-pritunl.config to ./tmp/,unpack, and   
    copy to /storage/.config/openvpn-pritunl.config  
    5. Enable openvpn-pritunl.service and start  
    6. Create tun55 network interface.  
    ```ip a show tun0```

