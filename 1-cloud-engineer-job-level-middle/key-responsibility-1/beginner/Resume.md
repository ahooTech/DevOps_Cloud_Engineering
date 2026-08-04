Secure AWS Cloud Infrastructure and Network Segmentation | Personal Project

Designed and deployed a secure AWS VPC with public and private subnets, route tables, and an internet gateway to enforce network segmentation and workload isolation.
Deployed a private Linux web server with no public IP address and securely accessed it through a bastion host using restricted security group rules.
Implemented IAM role-based access control using Admin, Engineer, and Auditor groups, enforced MFA, and applied resource tagging for governance and cost tracking.
Documented the architecture, validated security controls through testing, created billing alerts, and performed full resource teardown to prevent unnecessary cloud spend.




Mapping to the Job Descriptions


✅ What You’ve Already Mastered (Matches Job Requirements):
From Jubilee Job Description:
✅ "Design and maintain secure, scalable, and highly available cloud infrastructure aligned to business and technology strategy."
← You built a secure AWS cloud foundation with isolated private workloads. Scalability and high availability come in later levels, but the secure design foundation is now proven.
✅ "Cloud networking design including VPC/VNet, VPNs, load balancers, DNS, firewalls, and hybrid connectivity."
← You created a custom VPC, public subnet, private subnet, internet gateway, route tables, and security groups acting as firewalls.
✅ "Enforce cloud security best practices including IAM, RBAC, encryption, vulnerability management, and network segmentation."
← You implemented IAM groups, RBAC, MFA, password policies, security group restrictions, and network segmentation between public and private subnets.
✅ "Administer Linux and Windows servers in cloud environments, including patching, performance tuning, and hardening."
← You launched and administered Amazon Linux, used Bash user-data, started a web service using systemd, tested with curl, and hardened access by preventing direct public internet access.
✅ "Implement and maintain governance controls for identity, access, resource provisioning, and cost management."
← You created IAM users/groups, enforced password policy, used tags, and created an AWS budget alert.
✅ "Support audit processes by providing accurate documentation, logs, and compliance evidence."
← You created documentation, architecture notes, test evidence, and screenshots.
✅ "Optimise cloud spend through effective resource planning, cost governance, and FinOps practices."
← You used low-cost instances, created a budget alert, tagged resources, and performed full teardown to avoid unnecessary charges.   



From Safaricom Job Description:
✅ "AWS and GCP Cloud knowledge and deployment models."
← You built a practical AWS deployment model using VPC, subnets, bastion access, private workloads, and security groups. GCP can be added in a future multi-cloud level.
✅ "Automate infrastructure provisioning through cloud provider SDKs, IaC tools like Terraform and CloudFormation."
← You have now manually built the exact AWS resources that Terraform will automate next. This gives you the foundation to write meaningful Terraform code instead of just copying templates.
✅ "Strong Linux engineering background."
← You worked with Amazon Linux, SSH, Bash user-data, systemd, curl, and service validation.
✅ "Documentation and process: keeping accurate current infrastructure database."
← You documented the VPC design, subnets, security controls, test results, and cleanup process.
✅ "Strong data analytical skills, analytical thinking, attention to details and ability to identify solutions to complex problems."
← You followed a structured troubleshooting process: validating security groups, route tables, private IPs, bastion access, and web server response.
✅ "Adhere to the existing processes in workflow management."
← You followed a controlled build-test-document-cleanup workflow, which is exactly how production cloud changes should be handled.