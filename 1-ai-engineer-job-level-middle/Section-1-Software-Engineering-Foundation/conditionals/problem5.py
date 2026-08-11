amount = 30000

transaction_fee = "50 KES" if amount > 50000 else "10 KES"

print(f"Transaction fee: {transaction_fee}")