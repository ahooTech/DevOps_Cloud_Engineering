# Evidence 
(venv) PS C:\Users\DAYLIFF\Desktop\DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E\projects\project-1-hybrid-foundation\infra\hybrid-network\pulumi> pulumi preview
Previewing update (dev)

View in Browser (Ctrl+O): https://app.pulumi.com/ahooTech/project-1-hybrid-foundation/dev/previews/1fe5f959-6952-4272-a025-68f9b5709764

     Type                                                     Name                             Plan
 +   pulumi:pulumi:Stack                                      project-1-hybrid-foundation-dev  create
 +   ├─ aws:ec2:CustomerGateway                               proj1-onprem-cgw-aws             create
 +   ├─ aws:ec2transitgateway:TransitGateway                  proj1-aws-tgw                    create
 +   ├─ aws:ec2:Vpc                                           proj1-aws-vpc                    create
 +   ├─ gcp:compute:ExternalVpnGateway                        proj1-onprem-ext-gw              create
 +   ├─ gcp:compute:Network                                   proj1-gcp-vpc                    create
 +   ├─ azure-native:resources:ResourceGroup                  proj1-azure-rg                   create
 +   ├─ aws:ec2:InternetGateway                               proj1-aws-igw                    create
 +   ├─ aws:ec2:VpnGateway                                    proj1-aws-vgw                    create
 +   ├─ aws:ec2:RouteTable                                    proj1-aws-tgw-rt                 create
 +   ├─ aws:ec2:Subnet                                        proj1-aws-public                 create
 +   ├─ gcp:compute:Subnetwork                                proj1-gcp-subnet                 create
 +   ├─ gcp:compute:Firewall                                  proj1-gcp-allow-vpn              create
 +   ├─ gcp:compute:HaVpnGateway                              proj1-gcp-ha-vpn-gw              create
 +   ├─ gcp:compute:Router                                    proj1-gcp-cloud-router           create
 +   ├─ azure-native:network:VirtualNetwork                   proj1-azure-vnet                 create
 +   ├─ azure-native:network:PublicIPAddress                  proj1-azure-gw-pip               create
 +   ├─ azure-native:network:NetworkSecurityGroup             proj1-azure-vpn-nsg              create
 +   ├─ azure-native:network:LocalNetworkGateway              proj1-onprem-lng                 create
 +   ├─ aws:ec2:RouteTable                                    proj1-aws-public-rt              create
 +   ├─ aws:ec2:VpnConnection                                 proj1-aws-vpn-conn               create
 +   ├─ aws:ec2transitgateway:VpcAttachment                   proj1-aws-tgw-attach             create
 +   ├─ gcp:compute:VPNTunnel                                 proj1-gcp-tunnel-2               create
 +   ├─ gcp:compute:VPNTunnel                                 proj1-gcp-tunnel-1               create
 +   ├─ azure-native:network:Subnet                           GatewaySubnet                    create
 +   ├─ aws:ec2:RouteTableAssociation                         proj1-aws-public-assoc           create
 +   ├─ gcp:compute:RouterInterface                           proj1-gcp-if-1                   create
 +   ├─ gcp:compute:RouterInterface                           proj1-gcp-if-2                   create
 +   ├─ azure-native:network:VirtualNetworkGateway            proj1-azure-vpn-gw               create
 +   ├─ gcp:compute:RouterPeer                                proj1-gcp-bgp-peer-1             create
 +   ├─ azure-native:network:VirtualNetworkGatewayConnection  proj1-azure-to-onprem            create
 +   └─ gcp:compute:RouterPeer                                proj1-gcp-bgp-peer-2             create
Outputs:
    aws_bgp_asn       : 64512
    aws_tgw_id        : [unknown]
    aws_vpc_id        : [unknown]
    azure_bgp_asn     : 65500
    azure_gw_public_ip: [unknown]
    azure_vnet_id     : [unknown]
    gcp_router_asn    : 65001
    gcp_vpc_network   : "proj1-gcp-vpc-bec97b0"
    parity_status     : "On-Prem CIDR: 10.10.0.0/16 | Cloud CIDRs: AWS=10.20.0.0/16 Azure=10.30.0.0/16 GCP=10.40.0.0/16"

Resources:
    + 32 to create

(venv) PS C:\Users\DAYLIFF\Desktop\DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E\projects\project-1-hybrid-foundation\infra\hybrid-network\pulumi> pulumi up
Previewing update (dev)

View in Browser (Ctrl+O): https://app.pulumi.com/ahooTech/project-1-hybrid-foundation/dev/previews/6dec065f-8613-4759-90e0-945ab3bdcf97

     Type                                                     Name                             Plan
 +   pulumi:pulumi:Stack                                      project-1-hybrid-foundation-dev  create
 +   ├─ gcp:compute:Network                                   proj1-gcp-vpc                    create
 +   ├─ gcp:compute:ExternalVpnGateway                        proj1-onprem-ext-gw              create
 +   ├─ azure-native:resources:ResourceGroup                  proj1-azure-rg                   create
 +   ├─ aws:ec2transitgateway:TransitGateway                  proj1-aws-tgw                    create
 +   ├─ aws:ec2:Vpc                                           proj1-aws-vpc                    create
 +   ├─ aws:ec2:CustomerGateway                               proj1-onprem-cgw-aws             create
 +   ├─ gcp:compute:HaVpnGateway                              proj1-gcp-ha-vpn-gw              create
 +   ├─ gcp:compute:Router                                    proj1-gcp-cloud-router           create
 +   ├─ gcp:compute:Subnetwork                                proj1-gcp-subnet                 create
 +   ├─ gcp:compute:Firewall                                  proj1-gcp-allow-vpn              create
 +   ├─ azure-native:network:VirtualNetwork                   proj1-azure-vnet                 create
 +   ├─ azure-native:network:PublicIPAddress                  proj1-azure-gw-pip               create
 +   ├─ azure-native:network:LocalNetworkGateway              proj1-onprem-lng                 create
 +   ├─ azure-native:network:NetworkSecurityGroup             proj1-azure-vpn-nsg              create
 +   ├─ aws:ec2:Subnet                                        proj1-aws-public                 create
 +   ├─ aws:ec2:InternetGateway                               proj1-aws-igw                    create
 +   ├─ aws:ec2:VpnGateway                                    proj1-aws-vgw                    create
 +   ├─ aws:ec2:RouteTable                                    proj1-aws-tgw-rt                 create
 +   ├─ azure-native:network:Subnet                           GatewaySubnet                    create
 +   ├─ gcp:compute:VPNTunnel                                 proj1-gcp-tunnel-2               create
 +   ├─ gcp:compute:VPNTunnel                                 proj1-gcp-tunnel-1               create
 +   ├─ aws:ec2transitgateway:VpcAttachment                   proj1-aws-tgw-attach             create
 +   ├─ aws:ec2:RouteTable                                    proj1-aws-public-rt              create
 +   ├─ aws:ec2:VpnConnection                                 proj1-aws-vpn-conn               create
 +   ├─ azure-native:network:VirtualNetworkGateway            proj1-azure-vpn-gw               create
 +   ├─ gcp:compute:RouterInterface                           proj1-gcp-if-2                   create
 +   ├─ gcp:compute:RouterInterface                           proj1-gcp-if-1                   create
 +   ├─ azure-native:network:VirtualNetworkGatewayConnection  proj1-azure-to-onprem            create
 +   ├─ aws:ec2:RouteTableAssociation                         proj1-aws-public-assoc           create
 +   ├─ gcp:compute:RouterPeer                                proj1-gcp-bgp-peer-2             create
 +   └─ gcp:compute:RouterPeer                                proj1-gcp-bgp-peer-1             create
Outputs:
    aws_bgp_asn       : 64512
    aws_tgw_id        : [unknown]
    aws_vpc_id        : [unknown]
    azure_bgp_asn     : 65500
    azure_gw_public_ip: [unknown]
    azure_vnet_id     : [unknown]
    gcp_router_asn    : 65001
    gcp_vpc_network   : "proj1-gcp-vpc-d49ec38"
    parity_status     : "On-Prem CIDR: 10.10.0.0/16 | Cloud CIDRs: AWS=10.20.0.0/16 Azure=10.30.0.0/16 GCP=10.40.0.0/16"

Resources:
    + 32 to create

Do you want to perform this update? yes
Updating (dev)

View in Browser (Ctrl+O): https://app.pulumi.com/ahooTech/project-1-hybrid-foundation/dev/updates/1

     Type                                                     Name                             Status
 +   pulumi:pulumi:Stack                                      project-1-hybrid-foundation-dev  created (2465s)
 +   ├─ aws:ec2transitgateway:TransitGateway                  proj1-aws-tgw                    created (56s)
 +   ├─ aws:ec2:CustomerGateway                               proj1-onprem-cgw-aws             created (11s)
 +   ├─ aws:ec2:Vpc                                           proj1-aws-vpc                    created (4s)
 +   ├─ gcp:compute:Network                                   proj1-gcp-vpc                    created (34s)
 +   ├─ gcp:compute:ExternalVpnGateway                        proj1-onprem-ext-gw              created (13s)
 +   ├─ azure-native:resources:ResourceGroup                  proj1-azure-rg                   created (10s)
 +   ├─ aws:ec2:InternetGateway                               proj1-aws-igw                    created (1s)
 +   ├─ aws:ec2:VpnGateway                                    proj1-aws-vgw                    created (46s)
 +   ├─ aws:ec2:Subnet                                        proj1-aws-public                 created (13s)
 +   ├─ aws:ec2:RouteTable                                    proj1-aws-public-rt              created (2s)
 +   ├─ azure-native:network:VirtualNetwork                   proj1-azure-vnet                 created (12s)
 +   ├─ azure-native:network:PublicIPAddress                  proj1-azure-gw-pip               created (10s)
 +   ├─ azure-native:network:LocalNetworkGateway              proj1-onprem-lng                 created (19s)
 +   ├─ azure-native:network:NetworkSecurityGroup             proj1-azure-vpn-nsg              created (11s)
 +   ├─ aws:ec2:RouteTableAssociation                         proj1-aws-public-assoc           created (1s)
 +   ├─ azure-native:network:Subnet                           GatewaySubnet                    created (9s)
 +   ├─ gcp:compute:Firewall                                  proj1-gcp-allow-vpn              created (12s)
 +   ├─ gcp:compute:HaVpnGateway                              proj1-gcp-ha-vpn-gw              created (3s)
 +   ├─ gcp:compute:Subnetwork                                proj1-gcp-subnet                 created (14s)
 +   ├─ gcp:compute:Router                                    proj1-gcp-cloud-router           created (24s)
 +   ├─ azure-native:network:VirtualNetworkGateway            proj1-azure-vpn-gw               created (2252s)
 +   ├─ aws:ec2:VpnConnection                                 proj1-aws-vpn-conn               created (396s)
 +   ├─ aws:ec2:RouteTable                                    proj1-aws-tgw-rt                 created (20s)
 +   ├─ aws:ec2transitgateway:VpcAttachment                   proj1-aws-tgw-attach             created (131s)
 +   ├─ gcp:compute:VPNTunnel                                 proj1-gcp-tunnel-1               created (17s)
 +   ├─ gcp:compute:VPNTunnel                                 proj1-gcp-tunnel-2               created (17s)
 +   ├─ gcp:compute:RouterInterface                           proj1-gcp-if-1                   created (16s)
 +   ├─ gcp:compute:RouterInterface                           proj1-gcp-if-2                   created (31s)
 +   ├─ gcp:compute:RouterPeer                                proj1-gcp-bgp-peer-1             created (30s)
 +   ├─ gcp:compute:RouterPeer                                proj1-gcp-bgp-peer-2             created (28s)
 +   └─ azure-native:network:VirtualNetworkGatewayConnection  proj1-azure-to-onprem            created (129s)
Outputs:
    aws_bgp_asn       : 64512
    aws_tgw_id        : "tgw-0e70dcc3db969bd1c"
    aws_vpc_id        : "vpc-0023c690adfd63e7e"
    azure_bgp_asn     : 65500
    azure_gw_public_ip: "172.190.97.25"
    azure_vnet_id     : "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/proj1-azure-rg3e2f0c68/providers/Microsoft.Network/virtualNetworks/proj1-azure-vnet..."
    gcp_router_asn    : 65001
    gcp_vpc_network   : "proj1-gcp-vpc-06b5b8c"
    parity_status     : "On-Prem CIDR: 10.10.0.0/16 | Cloud CIDRs: AWS=10.20.0.0/16 Azure=10.30.0.0/16 GCP=10.40.0.0/16"

Resources:
    + 32 created

Duration: 41m27s

(venv) PS C:\Users\DAYLIFF\Desktop\DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E\projects\project-1-hybrid-foundation\infra\hybrid-network\pulumi>






🚀 How They Work Together (The Workflow)
When you sit down at your computer to deploy this project, here is the exact chain of events:
Gather the Tools: You run pip install -r requirements.txt. Python reads the shopping list and downloads the AWS, Azure, and GCP translator libraries into your venv folder.
Initialize the Site: You run pulumi stack init dev. Pulumi creates a new tracking file called Pulumi.dev.yaml to hold your environment settings.
Set the Addresses: You run pulumi config set aws:region us-east-1. Pulumi writes that setting into Pulumi.dev.yaml.
Start Building: You run pulumi up.
Pulumi reads Pulumi.yaml and says, "Okay, this is a Python project, let me load the venv environment."
Pulumi reads Pulumi.dev.yaml and says, "Got it, I need to deploy to us-east-1 in AWS and eastus in Azure."
Pulumi executes your Python code (__main__.py), using the translator libraries from requirements.txt, to build the actual infrastructure!

🎯 Summary
Pulumi.yaml = What are we building? (A Python project).
Pulumi.dev.yaml = Where are we building it? (Regions and Account IDs).
requirements.txt = What tools do we need to build it? (Cloud SDKs).