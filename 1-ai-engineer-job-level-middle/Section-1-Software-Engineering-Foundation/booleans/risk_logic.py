amount = 75000
is_verified = True
previous_defaults = 0

requires_review = (amount > 50000 and (not is_verified or previous_defaults > 0))

print(requires_review)