# Fix SSH Key Permissions on Windows

icacls .\jubilee-cloud-foundation-key.pem /inheritance:r
icacls .\jubilee-cloud-foundation-key.pem /grant:r "${env:USERNAME}:(R)"