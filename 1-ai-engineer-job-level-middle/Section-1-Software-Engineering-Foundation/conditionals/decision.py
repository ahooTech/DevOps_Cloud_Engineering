risk_score = 29

if risk_score >= 80:
    decision = "reject"
elif risk_score >= 30:
    decision = "review"
else:
    decision = "approve"

print(f"{decision}")

