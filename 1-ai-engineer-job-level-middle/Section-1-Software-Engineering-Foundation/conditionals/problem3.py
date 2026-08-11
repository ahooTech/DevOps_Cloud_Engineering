amount = 75000

if amount > 50000:
    tier = "premium"
elif amount > 10000:
    tier = "standard"
else:
    tier = "basic"

print(tier)