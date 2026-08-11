status = ""

if status == "success":
    print("Transaction complete")
elif status == "failed":
    print("Transaction failed - refund initiated")
else:
    print("Transaction pending")

