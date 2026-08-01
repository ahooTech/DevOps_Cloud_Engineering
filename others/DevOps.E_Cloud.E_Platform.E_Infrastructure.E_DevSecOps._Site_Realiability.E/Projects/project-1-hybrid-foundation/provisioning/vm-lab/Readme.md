ubuntu-hardened runs on virtualbox -> vagrant up ubuntu-hardened --provider=virtualbox
rhel-hardened runs on virtualbox -> vagrant up rhel-hardened --provider=virtualbox
windows2019-hardened runs on vwmware  -> vagrant up windows2019-hardened --provider=vmware_desktop

# Provisioning ansible for windows VM 

1. Download ubuntu WSL and access via powershell or click on the ubuntu application or WSL application

2. dayliff@DESKTOP-VOK4EHB:/mnt/c/WINDOWS/system32$ cd "/mnt/c/Users/DAYLIFF/Desktop/DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E/Projects/project-1-hybrid-foundation/provisioning/vm-lab"

# Creating a virtual environment

3. dayliff@DESKTOP-VOK4EHB:/mnt/c/Users/DAYLIFF/Desktop/DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E/Projects/project-1-hybrid-foundation/provisioning/vm-lab$ python3 -m venv ansible-venv

# Activate virtual environment

4. dayliff@DESKTOP-VOK4EHB:/mnt/c/Users/DAYLIFF/Desktop/DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E/Projects/project-1-hybrid-foundation/provisioning/vm-lab$ source ansible-venv/bin/activate

# Ansible requires specific Python libraries to communicate with Windows over WinRM:

5. (ansible-venv) dayliff@DESKTOP-VOK4EHB:/mnt/c/Users/DAYLIFF/Desktop/DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E/Projects/project-1-hybrid-foundation/provisioning/vm-lab$ pip install --upgrade pip

6. (ansible-venv) dayliff@DESKTOP-VOK4EHB:/mnt/c/Users/DAYLIFF/Desktop/DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E/Projects/project-1-hybrid-foundation/provisioning/vm-lab$ pip install ansible pywinrm


# Check the IP Adress of the windows virtual machine

7. By logging into the vm using the vagrant profile

The default credentials for this box are usually:

Vagrant

Username: vagrant
Password: vagrant

If it asks for Administrator:

Username: Administrator
Password: vagrant


After logging in open powershell as administrator and run: ipconfig  -> checkout for the IPv4 Address



# Test if WSL can reach the windows VM

8. (ansible-venv) dayliff@DESKTOP-VOK4EHB:/mnt/c/Users/DAYLIFF/Desktop/DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E/Projects/project-1-hybrid-foundation/provisioning/vm-lab$ nc -vz 192.168.26.138 5985
Connection to 192.168.26.138 5985 port [tcp/*] succeeded!


9. (ansible-venv) dayliff@DESKTOP-VOK4EHB:/mnt/c/Users/DAYLIFF/Desktop/DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E/Projects/project-1-hybrid-foundation/provisioning/vm-lab$ ansible windows -i ansible/inventory.ini -m win_ping -vvvv


# Run the first playbook

10. (ansible-venv) dayliff@DESKTOP-VOK4EHB:/mnt/c/Users/DAYLIFF/Desktop/DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E/Projects/project-1-hybrid-foundation/provisioning/vm-lab$ ansible-playbook -i ansible/inventory.ini ansible/playbooks/baseline-windows.yml


# Run the last playbook

11. (ansible-venv) dayliff@DESKTOP-VOK4EHB:/mnt/c/Users/DAYLIFF/Desktop/DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E/Projects/project-1-hybrid-foundation/provisioning/vm-lab$ ansible-playbook -i ansible/inventory.ini ansible/playbooks/windows-finalize-winrm.yml