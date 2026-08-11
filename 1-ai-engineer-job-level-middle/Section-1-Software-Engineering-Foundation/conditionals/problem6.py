is_verified = False
amount = 30000

if not is_verified:
    decision = "reject"
elif amount > 50000:
    decision = "review"
else:
    decision = "approve"

print(decision)