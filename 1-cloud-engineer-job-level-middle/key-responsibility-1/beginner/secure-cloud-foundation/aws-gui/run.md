# Update you public IP

my_ip = "YOUR_PUBLIC_IP/32"

# run the following commands in this directory


terraform init


terraform fmt


terraform validate


terraform plan 



terraform apply


# 1. Remove permission inheritance:

icacls .\jubilee-cloud-foundation-key.pem /inheritance:r

# 2. Grant Read-only access ONLY to your current Windows user:

icacls .\jubilee-cloud-foundation-key.pem /grant:r "${env:USERNAME}:(R)"


# Connect to Bastion

ssh -i ./jubilee-cloud-foundation-key.pem ec2-user@ec2-32-197-43-37.compute-1.amazonaws.com


# Test accessing the private subnet via bastion

curl http://IP_Address


#  Run

terraform output


try and log in as IAM user roles and validate IAM user groups