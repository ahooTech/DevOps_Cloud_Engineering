customer_name = "jane"         
customer_name = "J" + customer_name[1:]          # Crash 1: what error?
print(customer_name)
print(customer_name[-1])        # Crash 2: what error?