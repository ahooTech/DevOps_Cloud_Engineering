# Fix SSH Key Permissions on Windows

icacls .\jubilee-azure-foundation-key.pem /inheritance:r
icacls .\jubilee-azure-foundation-key.pem /grant:r "${env:USERNAME}:(R)"