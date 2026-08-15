# Fix SSH Key Permissions on Windows

icacls .\jubilee-gcp-foundation-key.pem /inheritance:r
icacls .\jubilee-gcp-foundation-key.pem /grant:r "${env:USERNAME}:(R)"