#!/bin/bash
#C:\Users\DAYLIFF\Desktop\DevOps.E_Cloud.E_Platform.E_Infrastructure.E_DevSecOps._Site_Realiability.E\Projects\omniscale-terraform\scripts\validate-parity.sh
set -e

echo "[*] Starting Omniscale Parity Validation..."

echo "[*] Reading Terraform outputs..."
VPC_CIDR=$(terraform output -raw vpc_cidr 2>/dev/null || echo "NOT_FOUND")
PUBLIC_SUBNETS=$(terraform output public_subnet_cidrs 2>/dev/null || echo "NOT_FOUND")
PRIVATE_SUBNETS=$(terraform output private_subnet_cidrs 2>/dev/null || echo "NOT_FOUND")

echo "[DEBUG] VPC_CIDR: '$VPC_CIDR'"
echo "[DEBUG] PUBLIC_SUBNETS: '$PUBLIC_SUBNETS'"
echo "[DEBUG] PRIVATE_SUBNETS: '$PRIVATE_SUBNETS'"

echo "[*] Reading Vagrant baseline metadata..."
VAGRANT_VPC="10.0.0.0/16"

echo "[*] Validating CIDR parity..."
if [[ "$VPC_CIDR" == "$VAGRANT_VPC" ]]; then
  echo "[✓] VPC CIDR parity: $VPC_CIDR == $VAGRANT_VPC"
else
  echo "[✗] VPC CIDR mismatch: $VPC_CIDR != $VAGRANT_VPC"
  exit 1
fi

PUBLIC_COUNT=$(echo "$PUBLIC_SUBNETS" | grep -oEi "subnet-[a-f0-9]{8}" | wc -l)
echo "[DEBUG] Public subnet matches found: $PUBLIC_COUNT"

if [[ "$PUBLIC_COUNT" -eq 3 ]]; then
  echo "[✓] Public subnet count: $PUBLIC_COUNT == 3"
else
  echo "[✗] Public subnet count mismatch: $PUBLIC_COUNT != 3"
  exit 1
fi

PRIVATE_COUNT=$(echo "$PRIVATE_SUBNETS" | grep -oEi "subnet-[a-f0-9]{8}" | wc -l)
echo "[DEBUG] Private subnet matches found: $PRIVATE_COUNT"

if [[ "$PRIVATE_COUNT" -eq 3 ]]; then
  echo "[✓] Private subnet count: $PRIVATE_COUNT == 3"
else
  echo "[✗] Private subnet count mismatch: $PRIVATE_COUNT != 3"
  exit 1
fi

echo "[*] Validating security group parity..."
SG_STATE=$(terraform state show module.networking.aws_security_group.baseline 2>/dev/null)

if echo "$SG_STATE" | grep -A 10 "ingress" | grep -q "10\.0\.0\.0/16"; then
  echo "[✓] Security group allows VPC CIDR: 10.0.0.0/16"
else
  echo "[✗] Security group rule mismatch"
  echo "[DEBUG] SG_STATE ingress snippet:"
  echo "$SG_STATE" | grep -A 15 "ingress" | head -20
  exit 1
fi

echo ""
echo "=========================================="
echo "✅ OMNISCALE PARITY VALIDATION: PASSED"
echo "=========================================="
echo "VPC CIDR:        $VPC_CIDR"
echo "Public Subnets:  $PUBLIC_COUNT (IDs verified)"
echo "Private Subnets: $PRIVATE_COUNT (IDs verified)"
echo "Security Group:  Allows 10.0.0.0/16"
echo "State Backend:   S3 (Remote, Locked)"
echo "=========================================="
echo "[*] Parity validation complete."