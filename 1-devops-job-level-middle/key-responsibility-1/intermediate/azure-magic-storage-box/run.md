# 1. Remove permission inheritance:

icacls .\jubilee-cloud-foundation-key.pem /inheritance:r

# 2. Grant Read-only access ONLY to your current Windows user:

icacls .\jubilee-cloud-foundation-key.pem /grant:r "${env:USERNAME}:(R)"






# 1. Install the Azure CLI (Wait a minute for this to finish)
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# 2. Log in using your VM's Security Badge (Managed Identity)
az login --identity

# 3. Create the file
echo "Secret Pizza Dough Recipe" > recipe.txt
ls

# 4. UPLOAD to the Magic Storage Box
az storage blob upload \
  --account-name pizzavaultzy2kyrf6 \
  --container-name recipes \
  --name recipe.txt \
  --file recipe.txt \
  --auth-mode login

# 5. Delete it locally
rm recipe.txt
ls

# 6. DOWNLOAD it back
az storage blob download \
  --account-name pizzavaultzy2kyrf6 \
  --container-name recipes \
  --name recipe.txt \
  --file recipe.txt \
  --auth-mode login

# 7. Verify
ls
cat recipe.txt