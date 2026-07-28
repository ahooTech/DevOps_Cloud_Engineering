# ============================================
# Additional Windows Firewall Parity Rules
# Project 1 - Hybrid Foundation
# ============================================

Write-Host "Applying Additional Firewall Rules..." -ForegroundColor Cyan

function Ensure-FirewallRule {
    param (
        [string]$Name,
        [string]$Direction,
        [string]$Protocol,
        [string]$LocalPort,
        [string]$Action,
        [string]$Profile = "Any"
    )

    $existingRule = Get-NetFirewallRule -DisplayName $Name -ErrorAction SilentlyContinue

    if (-not $existingRule) {
        New-NetFirewallRule `
          -DisplayName $Name `
          -Direction $Direction `
          -LocalPort $LocalPort `
          -Protocol $Protocol `
          -Action $Action `
          -Profile $Profile

        Write-Host "Created firewall rule: $Name" -ForegroundColor Green
    }
    else {
        Write-Host "Firewall rule already exists: $Name" -ForegroundColor Yellow
    }
}

# 🔐 WinRM: Allow ONLY HTTPS (5986) for encrypted management
Ensure-FirewallRule `
  -Name "Allow WinRM HTTPS (Enterprise Baseline)" `
  -Direction Inbound `
  -LocalPort 5986 `
  -Protocol TCP `
  -Action Allow

# 🚫 Block NetBIOS / Legacy SMB Ports
Ensure-FirewallRule `
  -Name "Block NetBIOS 137 UDP" `
  -Direction Inbound `
  -LocalPort 137 `
  -Protocol UDP `
  -Action Block

Ensure-FirewallRule `
  -Name "Block NetBIOS 138 UDP" `
  -Direction Inbound `
  -LocalPort 138 `
  -Protocol UDP `
  -Action Block

Ensure-FirewallRule `
  -Name "Block NetBIOS 139 TCP" `
  -Direction Inbound `
  -LocalPort 139 `
  -Protocol TCP `
  -Action Block

Write-Host "Firewall hardening complete." -ForegroundColor Green