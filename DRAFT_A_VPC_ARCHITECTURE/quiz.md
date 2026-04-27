# Qiz to test knowledge
Draft a VPC Architecture.
•	1 VPC Boundary
•	3 AZs inside it
•	Public + Private Subnets in each AZ (3+3)
•	1 IGW outside VPC
•	3 NAT GWs (1 per public subnet)
•	Arrows showing traffic flow
•	Route tables (1 public, 3 private)
•	Security groups

## 1.	Why do we use 3 Availability Zones instead of 1 or 2 for this VPC design?

Answer: We use 3 Availability Zones because it provides fault isolation with N+1 redundancy. If one AZ fails, the remaining two instantly absorb the traffic with zero downtime.
•	1 AZ = single point of failure. One outage kills everything.
•	2 AZs = better, but risks consensus/quorum failures in distributed systems and leaves no capacity buffer if one AZ is taken offline for maintenance.
•	3 AZs = industry standard. Allows load balancers, auto-scaling, and multi-AZ databases to survive a full AZ failure without degradation. It's the minimum required to reliably hit 99.95%+ uptime SLAs.
🎯 Interview One-Liner (Memorize This): "Three AZs gives us true fault isolation with N+1 redundancy. If one zone fails, the other two instantly absorb the load without downtime, which is the baseline for hitting enterprise SLAs and aligns with how AWS multi-AZ services are optimized to run."

## 2.	What is the exact difference between a Public Subnet and a Private Subnet in AWS? (One sentence each.)

Answer:
•	Public Subnet: A subnet whose route table has a default route (0.0.0.0/0) pointing directly to an Internet Gateway, allowing resources with public IPs to be reachable from the internet.
•	Private Subnet: A subnet whose route table has a default route (0.0.0.0/0) pointing to a NAT Gateway (or no default route), preventing direct inbound internet access while allowing outbound-only connectivity.
🎯 Interview One-Liner (Memorize This): "Public subnets route directly to an Internet Gateway for inbound/outbound access; private subnets route outbound through a NAT Gateway and block all direct inbound internet traffic."

## 3.	If a private EC2 instance needs to download a package from the internet, what is the exact path the packet takes? (Name every component in order.)

EC2 Instance
VPC Router (consults the Private Route Table associated with the subnet)
Private Route Table (matches 0.0.0.0/0 → nat-gateway-xxxx)
NAT Gateway (in the Public Subnet)
Internet Gateway
Internet

"The EC2 instance sends the packet to the VPC router, which consults the private subnet's route table. The route table has a default route pointing to the NAT Gateway in the public subnet. The NAT Gateway forwards it through the Internet Gateway to the internet. Return traffic follows the same path back because the NAT is stateful."
## 4.	Why do we place one NAT Gateway per AZ instead of one NAT Gateway for all 3 AZs?
Answer: We place one NAT Gateway per AZ for three critical reasons:
1.	Fault Isolation (HA): NAT Gateways are highly available within a single AZ, but they do NOT auto-failover to another AZ. If you share one NAT across all 3 AZs and that AZ fails, every private subnet loses internet egress. One NAT per AZ ensures an AZ failure only impacts that specific zone.
2.	Cost: AWS charges for cross-AZ data transfer. If AZ-2 and AZ-3 route through a NAT in AZ-1, you pay ~$0.01/GB for that cross-AZ traffic. Local NATs keep egress traffic within the same AZ, eliminating those fees entirely.
3.	Latency: Routing across AZs adds network hops through the AWS backbone. Local NATs keep the egress path short and predictable.
🎯 Interview One-Liner (Memorize This): "NAT Gateways don't automatically fail over across AZs, so one per AZ ensures true fault isolation—if one zone goes down, only that zone loses egress. It also eliminates cross-AZ data transfer charges and keeps latency low by keeping traffic local."

## 5.	If the Internet Gateway (IGW) fails, what breaks? If one NAT Gateway fails, what breaks? (Be specific.)

Answer:
🌐 If the Internet Gateway (IGW) fails:
Everything that touches the internet breaks, region-wide.
•	❌ Inbound: Public ALB/NLB, bastion hosts, public EC2 instances lose all internet connectivity.
•	❌ Outbound: All NAT Gateways lose their path to the internet → every private subnet in all 3 AZs loses egress.
•	✅ Still works: All internal VPC traffic (AZ-to-AZ, private-to-private, DB-to-app) continues normally via the local route.
Why this is acceptable: The IGW is an AWS-managed, horizontally scaled service with built-in redundancy. A true IGW failure is statistically near-zero. You design for AZ failures, not regional AWS service failures.
________________________________________
🌐 If one NAT Gateway fails (e.g., NAT in AZ-1):
Only private subnets in THAT AZ lose internet egress.
•	❌ Breaks: Private EC2/RDS in AZ-1 cannot reach the internet (no patches, no API calls, no external dependencies).
•	✅ Still works:
o	Private subnets in AZ-2 and AZ-3 continue egress via their local NATs.
o	All public subnets and inbound traffic remain unaffected.
o	All internal VPC traffic (cross-AZ app-to-DB, etc.) continues normally.
Why this is acceptable: This is the intended failure isolation. By placing one NAT per AZ, we contain the blast radius to a single zone. The trade-off: ~$100/month for 3 NATs vs. risking total egress loss with 1 shared NAT.
________________________________________
🎯 Interview One-Liner (Memorize This):
"If the IGW fails, the entire VPC loses internet connectivity—but that's an AWS-managed service with near-100% SLA. If one NAT Gateway fails, only private resources in that specific AZ lose egress, which is the intended fault isolation. That's why we pay for 3 NATs: to contain failure domains to a single zone."


## 6.	What CIDR block would you choose for the VPC and why? (Give a specific example and justification.)
"I would choose 10.0.0.0/16 for the VPC CIDR block."
Justification:
Size matters: A /16 gives me 65,534 usable IP addresses. This is large enough to support:
Multiple environments (dev/staging/prod) if I use secondary CIDRs later
Kubernetes clusters (which consume IPs rapidly for pods)
Future growth without requiring VPC redesign
Private IP range: 10.0.0.0/8 is RFC 1918 private space, so:
It's not routable on the public internet (security by default)
It's the standard for enterprise networks
Avoids overlap: I choose 10.0.0.0/16 specifically (not 10.10.0.0/16 or 192.168.0.0/16) because:
Many corporate on-prem networks use 192.168.x.x or 10.10.x.x
If I later connect via Direct Connect or VPN, I won't have routing conflicts
I leave 10.1.0.0/16, 10.2.0.0/16 free for future VPCs or on-prem peering
Subnet flexibility: With /16, I can carve out:
/24 for public subnets (256 IPs each)
/22 for private subnets (1,024 IPs each)
Still have room for database subnets, Redshift, RDS, ElastiCache, etc.
Industry standard: AWS Well-Architected Framework and most enterprise architects default to /16 for production VPCs. It's the "goldilocks" size—not too small, not unnecessarily large.

## 7.	How many route tables do you need for this design, and what does each one contain?

"You need 4 route tables total: 1 Public Route Table and 3 Private Route Tables (one per AZ)."
What each contains:
Public Route Table (1): Associated with all 3 public subnets.
local (10.0.0.0/16) → implicit, auto-created
0.0.0.0/0 → Internet Gateway (IGW)
Private Route Tables (3): One per AZ, each associated only with its matching private subnet.
local (10.0.0.0/16) → implicit, auto-created
0.0.0.0/0 → NAT Gateway in that specific AZ (e.g., nat-az1, nat-az2, nat-az3)
🔍 Why This Design (The "Why")
1 Public RT: All public subnets have identical behavior (route to IGW). Sharing one table reduces management overhead and follows AWS best practices.
3 Private RTs: Isolates failure domains. If AZ-1's NAT GW fails, only AZ-1 private workloads lose internet egress. AZ-2 and AZ-3 remain fully operational. It also prevents cross-AZ data transfer costs.
Implicit local route: Every VPC route table automatically includes a local route for the VPC CIDR. You never add it manually. It guarantees AZ-to-AZ and subnet-to-subnet communication without extra rules.

## 8.	What is the purpose of the "local" route in every route table, and can you ever delete it?
"The local route enables all resources within the VPC to communicate with each other across every subnet and Availability Zone using private IP addresses. It automatically targets the VPC's CIDR block (e.g., 10.0.0.0/16). You can never delete, modify, or override it—it's permanently enforced by AWS."
## 9.	How do you ensure private subnets in different AZs can communicate with each other?
"They communicate automatically by default. Every route table in a VPC contains an implicit local route that routes traffic for the entire VPC CIDR (e.g., 10.0.0.0/16) without requiring any additional configuration."

## 10.	If you later need to add a fourth AZ, what changes in your design and what stays the same?

"The regional VPC components and architecture patterns stay the same. You only add AZ-local resources and update routing associations."
🔹 What Stays the Same:
•	VPC CIDR (10.0.0.0/16) and overall IPAM strategy
•	Internet Gateway (IGW) – it's a regional resource, already provisioned
•	Single Public Route Table – you just associate the new public subnet with it
•	Architecture principles – public/private split, 1:1 NAT-to-AZ ratio, security layering, naming/tagging standards
🔸 What Changes:
•	Create 2 new subnets in AZ-4: 1 public (/24), 1 private (/22) carved from the existing /16
•	Deploy 1 new NAT Gateway in the AZ-4 public subnet (maintains AZ isolation)
•	Create 1 new private route table for AZ-4, add 0.0.0.0/0 → nat-az4, associate it with the AZ-4 private subnet
•	Update workload placement: Auto-scaling groups, load balancers, RDS multi-AZ, and DNS must register/distribute to AZ-4
•	Update IaC & docs: Terraform modules, Confluence runbooks, and monitoring alerts get extended to the new AZ
⚠️ Critical Pre-Check:
IP Space Availability: Before adding AZ-4, verify you have enough unallocated IPs in the /16. If exhausted, you must request a secondary CIDR block (e.g., 172.16.0.0/16) and attach it to the VPC first.







## 11.	If AZ-1 goes down completely, which components fail and which keep working?
"If AZ-1 fails completely, only components physically located in AZ-1 are impacted. Everything else continues operating normally."
What fails:
•	The NAT Gateway deployed in AZ-1
•	All private workloads in AZ-1 lose internet egress (no outbound access)
•	Any public-facing resources in AZ-1 (ALB targets, bastion, public EC2) become unreachable
•	Stateful services running only in AZ-1 (e.g., single-AZ RDS, unreplicated caches) go offline
What keeps working:
•	The Internet Gateway (IGW) → Regional service, not AZ-bound
•	NAT Gateways in AZ-2 and AZ-3 → Continue routing egress for their AZs
•	All workloads in AZ-2 and AZ-3 → Full inbound/outbound connectivity remains intact
•	Cross-AZ communication between AZ-2 ↔ AZ-3 → Works via the VPC's implicit local route
•	Route tables, security groups, and VPC metadata → Unaffected
Why this happens (Design Principle): The architecture intentionally isolates failure domains. By pinning each private subnet's 0.0.0.0/0 route to its local NAT Gateway, we prevent cascading failures. AZ-2 and AZ-3 never depend on AZ-1 for routing or egress.

## 12.	How would you explain to a non-technical stakeholder why we spend ~$100/month on 3 NAT Gateways instead of 1?

"I’d explain it as buying insurance against a total system outage."
The Analogy:
Think of a single NAT Gateway like one bridge connecting our entire factory to the outside world. If that bridge closes for maintenance or fails, all our trucks stop—no supplies in, no products out. By using three NAT Gateways, we’re building three independent bridges. If one closes, only a third of our traffic is temporarily affected, and the other two keep running smoothly without interruption.
The Business Justification:
The extra ~$65/month isn’t a tech luxury—it’s the cost of isolating failures. In a single-NAT setup, one hardware issue or AWS maintenance window can take down outbound connectivity for our entire production environment. That means:
•	Failed software updates & security patches
•	Broken monitoring & alerting (we fly blind)
•	Interrupted payment processing, API calls, or backups
•	Potential revenue loss, SLA penalties, and emergency engineering costs that easily exceed $1,000+ in a single incident
Bottom Line:
We’re trading a small, predictable monthly expense for enterprise-grade reliability. It protects customer trust, keeps our service available during isolated failures, and prevents costly emergency firefighting. In business terms, it’s not a cost—it’s risk mitigation.



## 13.	What is the single biggest security risk in this design, and how do you mitigate it without adding new components?
"The single biggest security risk is unrestricted outbound internet access via NAT Gateways combined with permissive Security Groups, which allows compromised private instances to freely communicate with malicious external endpoints (C2 servers, data exfiltration, crypto mining, etc.)."
Why this is the biggest risk:
•	NAT Gateways and Internet Gateways are routing devices, not security devices. They forward traffic without inspection.
•	By default, Security Groups allow all outbound traffic (0.0.0.0/0). If an attacker gains access to a private instance (via vulnerable app code, stolen credentials, or supply chain compromise), they can instantly reach any external server.
•	This design gives private workloads internet egress by necessity, but without explicit egress controls, it becomes a blind spot.
________________________________________
🛡️ Mitigation (Zero New Components)
You mitigate this using only native AWS configuration controls already in the design:
1.	Strict Outbound Security Group Rules
o	Replace default 0.0.0.0/0 outbound with explicit allow rules: only permit traffic to known package repos, patch servers, or API endpoints on specific ports (e.g., TCP 443 to 52.95.110.0/22 for AWS services).
o	Apply separate SGs per workload tier (web, app, DB) with least-privilege egress.
2.	NACL Subnet-Level Safety Net
o	Configure private subnet NACLs to explicitly DENY all inbound from 0.0.0.0/0.
o	Allow only ephemeral ports (1024-65535) for return traffic from NAT GWs. This catches SG misconfigurations before they reach instances.
3.	Route Table Discipline & Auditing
o	Verify private subnets have zero route to the IGW. Egress must route exclusively through AZ-local NAT GWs.
o	Use AWS Config or manual checks to alert if a private subnet is accidentally associated with a public route table.
4.	Strict Subnet Placement Policy
o	Public subnets host only NAT GWs, Load Balancers, and Bastion hosts (with tightly scoped SGs).
o	Zero application workloads, databases, or internal services in public subnets. Ever.
5.	Leverage Existing VPC Flow Logs
o	Route logs to CloudWatch Logs. Create metric filters for REJECT actions or unexpected high-volume outbound connections to flag suspicious egress before it becomes an incident.


## 14.	If you had to cut costs by 50% on this design, what would you remove or change, and what risk would that introduce?

"I would consolidate the three NAT Gateways down to a single NAT Gateway in one public subnet."
Cost Impact:
This reduces NAT Gateway costs from ~$97.50/month (3 × $32.50) to ~$32.50/month, easily clearing the 50% target.
Risks Introduced:
1.	Single Point of Failure: If that one NAT Gateway or its Availability Zone fails, all private workloads across all 3 AZs lose outbound internet connectivity simultaneously.
2.	Cross-AZ Data Transfer Fees: Private subnets in AZ-2 and AZ-3 must route traffic across AZ boundaries to reach the single NAT. AWS charges ~$0.01/GB for cross-AZ traffic, which can quickly offset savings if your workloads make heavy outbound calls (package downloads, API integrations, log shipping).
3.	Reduced Fault Tolerance: Violates the multi-AZ high-availability principle. An AZ-level outage now impacts 100% of egress traffic instead of just 33%.
When This Is Acceptable:
Only for non-production environments (dev/test), early-stage projects with relaxed uptime SLAs, or tightly budgeted internal tools. For production, the reliability loss and potential data transfer costs outweigh the ~$65/month savings.



## 15.	An interviewer says: "Why not just put everything in public subnets and use Security Groups to block access?" How do you respond?

"I wouldn’t, because Security Groups are a host-level firewall, not a network boundary. Relying on them alone violates defense-in-depth."
My response would be: "Putting everything in a public subnet means every resource gets a public IP and a direct route to the internet via the IGW. Even if Security Groups block inbound traffic, those resources are still exposed to constant internet scanning, DDoS attempts, and misconfiguration risks. A single SG rule error, IAM mistake, or unpatched vulnerability could instantly expose a database or internal service.
Private subnets enforce a network-level boundary. Resources have no public IP and no direct internet route. Even if a Security Group is misconfigured, the resource remains isolated at the network layer. It’s defense-in-depth.
Additionally, compliance frameworks like PCI-DSS, SOC 2, and ISO 27001 explicitly require network segmentation and private tiers for sensitive workloads. Public subnets should only host stateless, internet-facing components like load balancers or NAT gateways—not application or data layers."

