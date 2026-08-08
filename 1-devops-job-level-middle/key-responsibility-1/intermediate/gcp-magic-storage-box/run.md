# 1. Remove permission inheritance:

icacls .\jubilee-cloud-foundation-key.pem /inheritance:r

# 2. Grant Read-only access ONLY to your current Windows user:

icacls .\jubilee-cloud-foundation-key.pem /grant:r "${env:USERNAME}:(R)"



# 3. Create the file
echo "Secret Pizza Dough Recipe" > recipe.txt
ls

# 4. UPLOAD to the Magic Storage Box (REPLACE YOUR_BUCKET_NAME WITH YOUR ACTUAL BUCKET NAME!)
gcloud storage cp recipe.txt gs://YOUR_BUCKET_NAME/

# 5. Delete it locally
rm recipe.txt
ls

# 6. DOWNLOAD it back
gcloud storage cp gs://YOUR_BUCKET_NAME/recipe.txt .

# 7. Verify
ls
cat recipe.txt