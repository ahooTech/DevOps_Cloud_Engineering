ubuntu-hardened runs on virtualbox -> vagrant up ubuntu-hardened --provider=virtualbox
rhel-hardened runs on virtualbox -> vagrant up rhel-hardened --provider=virtualbox
windows2019-hardened runs on vwmware  -> vagrant up windows2019-hardened --provider=vmware_desktop

# Provisioning ansible for windows VM 

1. Download ubuntu WSL and access via powershell or click on the ubuntu application or WSL application

2. dayliff@DESKTOP-VOK4EHB:/mnt/c/WINDOWS/system32$ cd "/mnt/c/Users/DAYLIFF/Desktop/DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E/Projects/project-1-hybrid-foundation/provisioning/vm-lab"

# Creating a virtual environment

3. dayliff@DESKTOP-VOK4EHB:/mnt/c/devops/project-1-hybrid-foundation/provisioning/vm-lab$ python3 -m venv ansible-venv

# Activate virtual environment

4. dayliff@DESKTOP-VOK4EHB:/mnt/c/devops/project-1-hybrid-foundation/provisioning/vm-lab$ source ansible-venv/bin/activate

# Ansible requires specific Python libraries to communicate with Windows over WinRM:

5. (ansible-venv) dayliff@DESKTOP-VOK4EHB:/mnt/c/devops/project-1-hybrid-foundation/provisioning/vm-lab$ pip install --upgrade pip

6. (ansible-venv) dayliff@DESKTOP-VOK4EHB:/mnt/c/devops/project-1-hybrid-foundation/provisioning/vm-lab$ pip install ansible pywinrm


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

8. (ansible-venv) dayliff@DESKTOP-VOK4EHB:/mnt/c/devops/project-1-hybrid-foundation/provisioning/vm-lab$ nc -vz 192.168.26.138 5985
Connection to 192.168.26.138 5985 port [tcp/*] succeeded!


9. (ansible-venv) dayliff@DESKTOP-VOK4EHB:/mnt/c/devops/project-1-hybrid-foundation/provisioning/vm-lab$ ansible windows -i ansible/inventory.ini -m win_ping -vvvv


# Run the first playbook

10. (ansible-venv) dayliff@DESKTOP-VOK4EHB:/mnt/c/devops/project-1-hybrid-foundation/provisioning/vm-lab$ ansible-playbook -i ansible/inventory.ini ansible/playbooks/windows-site.yml


# Run the last playbook

11. (ansible-venv) dayliff@DESKTOP-VOK4EHB:/mnt/c/devops/project-1-hybrid-foundation/provisioning/vm-lab$ ansible-playbook -i ansible/inventory.ini ansible/playbooks/windows-finalize-winrm.yml




# When ubuntu stuck in private mode / eth0 or eth1

Go to this folder "C:\Users\DAYLIFF\.vagrant.d\insecure_private_keys\" and delete everything inside it
do vagrant up ubuntu-hardened  --provider=virtualbox in powershell administartor. If it hangs do "CTRL + C "  To proceed and if process cancels destroy and delete everything and try vagrant up ubuntu-hardened  --provider=virtualbox again on non-administrator powershell.  So basically if it gets stuck just Kill (ctrl + c) and vagrant up again. Or you can debug:  vagrant up ubuntu-hardened  --provider=virtualbox --debug. Mostly work on non-administrator windows terminal


# Open the following

C:\Users\DAYLIFF\.vagrant.d\data  &  C:\Users\DAYLIFF\.vagrant.d\data\machine-index -> for lock files

C:\Users\DAYLIFF\VirtualBox VMs  -> deleting vms folder


C:\ProgramData\VMware -> nothing done with so far


C:\devops\project-1-hybrid-foundation\provisioning\vm-lab -> project











# Checking if files in ubuntu or rhel


Based on your playbook architecture, all 4 files were successfully copied directly inside the RHEL virtual machine.
The confusion happens because your tasks are configured with remote_src: true. This means Ansible did not copy the files from your Windows host over the network. Instead, it moved 4 files that already existed inside the RHEL VM file system (at the root /virtualization/... path) into your new config directory at /etc/hybrid-bridge/.
Here is the exact verification breakdown of your 4 files:
## Where the 4 files were placed
Ansible successfully transferred them into /etc/hybrid-bridge/ inside the RHEL VM:

   1. File 1: /etc/hybrid-bridge/kvm-sync.xml (From: Copy KVM Libvirt XML payload)
   2. File 2: /etc/hybrid-bridge/hcs-cloud-init.yaml (From the loop)
   3. File 3: /etc/hybrid-bridge/oci-cloud-init.yaml (From the loop)
   4. File 4: /etc/hybrid-bridge/vsphere-sync.conf (From the loop)

The task logs match this exactly, showing 1 standalone copy action followed by a loop containing 3 items (1 + 3 = 4 files total).
------------------------------
## Step-by-Step Verification
To physically see and confirm all 4 files right now, run these commands in your PowerShell window:
1. Log into your hardened RHEL virtual machine:

vagrant ssh rhel-hardened

2. List the contents of the target directory as root:

sudo ls -l /etc/hybrid-bridge/

Your terminal output will look like this, proving all 4 files exist with the correct permissions:

-rw-r----- 1 root root  hcs-cloud-init.yaml
-rw-r--r-- 1 root root  kvm-sync.xml
-rw-r----- 1 root root  oci-cloud-init.yaml
-rw-r----- 1 root root  vsphere-sync.conf

If you notice that any of these files are completely empty inside the VM, let me know. I can show you how to update your playbook if your intent was to copy them from your Windows drive instead of moving them internally!



# For windows 


vagrant ssh windows2019-hardened


powershell


Get-ChildItem C:\hybrid-bridge


Get-Content C:\hybrid-bridge\hyper-v-config.psd1


