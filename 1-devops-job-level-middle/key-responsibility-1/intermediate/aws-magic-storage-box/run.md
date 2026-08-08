# 1. Remove permission inheritance:

icacls .\jubilee-cloud-foundation-key.pem /inheritance:r

# 2. Grant Read-only access ONLY to your current Windows user:

icacls .\jubilee-cloud-foundation-key.pem /grant:r "${env:USERNAME}:(R)"




# 1. Create the test file
echo "Secret Pizza Dough Recipe" > recipe.txt

# 2. Confirm it exists locally
ls

# 3. UPLOAD to the Magic Storage Box (S3)
aws s3 cp recipe.txt s3://pizza-recipes-optimal-rabbit/

# 4. Delete the local copy
rm recipe.txt   

# 5. DOWNLOAD it back from S3
aws s3 cp s3://pizza-recipes-optimal-rabbit/recipe.txt .


# 6. Confirm it's gone locally
ls

# 7. DOWNLOAD again from S3 (proves it survived in the vault)
aws s3 cp s3://pizza-recipes-optimal-rabbit/recipe.txt .

# 8. Confirm it's back and verify the contents
ls
cat recipe.txt





# Delete all ssh keys in the directory defined in the path variable



$path = "C:\devops\1-devops-job-level-middle\key-responsibility-1"

Get-ChildItem -Path $path -Recurse -Filter *.pem -File | ForEach-Object {
    Write-Host "Attempting to delete: $($_.FullName)"

    & takeown /f "$($_.FullName)"
    & icacls "$($_.FullName)" /grant "$($env:USERNAME):(F)"
    & attrib -r "$($_.FullName)"

    Remove-Item -LiteralPath $_.FullName -Force
}