import math

# (chunk add-digits (a 1) (b 5) (sum 6) (carry 0))
for a in range(0, 10):
    for b in range(0, 10):
        print(f"(c{a}{b} ISA add-digits a {a} b {b} sum {(a+b) % 10} carry {math.floor((a+b)/10)})")
