# Setup IP Address in terraform.tfvars

Your IP Address changes everytime your internet connection disconects and reconects again.






Yes, let's do it. This is the approach I'd use in production anyway, because Terraform should ideally authenticate with a dedicated service account rather than a personal account.

However, there's **one important correction** to what I suggested earlier:

> **A service account cannot be directly added to a Cloud Billing Account IAM policy.** Billing account IAM supports users, groups, and domains—not service accounts in the way project IAM does. For Terraform, what you typically do is grant the service account the necessary project permissions and authenticate with it. If creating budgets still requires billing-account permissions in your environment, you may need to impersonate a user with billing privileges or use a different authentication flow. Let's first create the service account and test whether it resolves the ADC issue.

---

# Step 1: Create the service account

Run:

```powershell
gcloud iam service-accounts create terraform-sa `
    --project=project-2978a6d6-1bf2-4d65-996 `
    --display-name="Terraform Service Account"
```

Verify it exists:

```powershell
gcloud iam service-accounts list --project=project-2978a6d6-1bf2-4d65-996
```

You should see something like:

```
terraform-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com
```

---

# Step 2: Impersonate service account

gcloud iam service-accounts add-iam-policy-binding `
  terraform-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com `
  --member="user:ahoosoftwares@gmail.com" `
  --role="roles/iam.serviceAccountTokenCreator"



# Step 3: Terraform provider should look like

provider "google" {
  impersonate_service_account = "terraform-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com"

  project = var.project_id
  region  = var.region
  zone    = var.zone
}



# Step 4: Go to console GUI to give service account role: Billing Account Administrator

or Cloud Billing Account IAM, the supported way is through the Google Cloud Console, or by using the Cloud Billing IAM API directly.

The easiest way is through the Cloud Console
Go to Google Cloud Console.
Open Billing.
Select My Billing Account.
Click Account management (or Permissions, depending on the UI).
Click Add principal.
Add:
terraform-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com
Grant:
Billing Account Administrator (roles/billing.admin)

Save the change.

# Tell computer new ssh key for bastion vm instance

ssh-keygen -R xx.xxx.xx.xx -> put the ip address in the ssh command

# Fix SSH Key Permissions on Windows

icacls .\jubilee-gcp-foundation-key.pem /inheritance:r
icacls .\jubilee-gcp-foundation-key.pem /grant:r "${env:USERNAME}:(R)"


# Get ssh command to connect to bastion in the public subnet 

terraform output ssh_command



# Get the private web IP Address

terraform output web_internal_ip

# From bastion test this 

curl http://WEB_INTERNAL_IP