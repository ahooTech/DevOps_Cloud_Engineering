transactions = 1007
batches = 250

full_batches = transactions // batches

left_over_transactions = transactions % batches

print(f"Full batches: {full_batches}, Leftover transactions: {left_over_transactions}")


print(f"Full batches: {divmod(transactions, batches)[0]}, Leftover transactions: {divmod(transactions, batches)[1]}") #one line solution using divmod function