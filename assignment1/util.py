import math

# (chunk add-digits (a 1) (b 5) (sum 6) (carry 0))
for a in range(0, 10):
    for b in range(0, 10):
        print(f"(c-add-d{a}{b} ISA add-digits a {a} b {b} sumDigit {(a+b) % 10} carry {math.floor((a+b)/10)} sum {a+b})")

for a in range(0, 2):
    for b in range(0, 20):
        print(f"(c-add-c{a}{b} ISA add-digits a {a} b {b} sumDigit {(a+b) % 10} carry {math.floor((a+b)/10)} sum {a+b})")
