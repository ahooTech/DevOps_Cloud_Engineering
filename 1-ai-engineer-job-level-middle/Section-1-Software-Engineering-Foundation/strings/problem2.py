log_line = "2026-01-15,C1001,45000"

log_line_splitted = log_line.split(",")

print (log_line_splitted)

date = log_line_splitted[0]
customer_id = log_line_splitted[1]
amount = log_line_splitted[2]

amount_int = int(amount)

print(f"On {date}, customer {customer_id} transacted {amount_int}")