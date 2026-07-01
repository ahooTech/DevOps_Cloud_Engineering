# virtualization/hybrid-vsphere-oci/hyperv/hyper-v-config.psd1

@{
    # Hyper-V Bridge Sync Configuration
    BridgeNodeIP = "${bridge_node_ip}"  # Replaced by Terraform template
    SyncPort = 8443
    Enabled = $true
    
    # VM Settings
    VMName = "Hybrid-Bridge-Sync"
    MemoryStartupBytes = 4GB
    ProcessorCount = 2
    Generation = 2
    
    # Network
    SwitchName = "Hybrid-Sync-Switch"
    VLANId = 100
    
    # Security
    SecureBoot = $true
    TPMEnabled = $false  # Enable for production
    
    # Sync Settings
    SyncIntervalMinutes = 15
    CompressionEnabled = $true
    EncryptionEnabled = $true
    
    # Logging
    LogPath = "C:\HyperV\Logs\hybrid-bridge.log"
    LogLevel = "Information"
    
    # Output for validation
    Output = @{
        Status = "Hyper-V configured to sync with bridge node at $BridgeNodeIP"
        Timestamp = (Get-Date -Format "o")
    }
}