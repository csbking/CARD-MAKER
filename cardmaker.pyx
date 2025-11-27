#!/usr/bin/env python3
import os
import random
import string
import time
import sys

# ------------------------ FULLSCREEN ------------------------
os.system("printf '\\033[8;40;150t' 2>/dev/null")
os.system("clear")

# ------------------------ COLORS ------------------------
R = "\033[91m"
G = "\033[92m"
Y = "\033[93m"
C = "\033[96m"
M = "\033[95m"
W = "\033[97m"
RESET = "\033[0m"

# ------------------------ ASCII LOGO ------------------------
logo = f"""
{C}   _____          _____  _____    __  __          _  ________ _____  
  / ____|   /\   |  __ \|  __ \  |  \/  |   /\   | |/ /  ____|  __ \ 
 | |       /  \  | |__) | |  | | | \  / |  /  \  | ' /| |__  | |__) |
 | |      / /\ \ |  _  /| |  | | | |\/| | / /\ \ |  < |  __| |  _  / 
 | |____ / ____ \| | \ \| |__| | | |  | |/ ____ \| . \| |____| | \ \ 
  \_____/_/    \_\_|  \_\_____/  |_|  |_/_/    \_\_|\_\______|_|  \_\


{Y}AUTO CARD GENERATOR & LIVE CHECKER - CSB SECURITY{RESET}
"""
print(logo)

# ------------------------ USER INPUT ------------------------
base_card = input(f"{G}ENTER BASE CARD NUMBER (16 DIGITS) : {RESET}")
if len(base_card) != 16 or not base_card.isdigit():
    print(f"{R}ERROR: Card number must be 16 digits!{RESET}")
    sys.exit()
try:
    num_cards = int(input(f"{G}HOW MANY CARDS TO GENERATE : {RESET}"))
except:
    print(f"{R}ERROR : Must enter a number!{RESET}")
    sys.exit()

# ------------------------ LUHN VALIDATOR ------------------------
def luhn_valid(card_num):
    digits = [int(d) for d in card_num[::-1]]
    total = 0
    for i, d in enumerate(digits):
        if i % 2 == 1:
            d *= 2
            if d > 9:
                d -= 9
        total += d
    return total % 10 == 0

# ------------------------ UNIQUE CARD GENERATOR ------------------------
used_cards = set()

def generate_unique_card(base):
    first12 = base[:12]
    while True:
        last4 = ''.join(random.choices(string.digits, k=4))
        full = first12 + last4
        if full not in used_cards:
            used_cards.add(full)
            break
    month = str(random.randint(1, 12)).zfill(2)
    year = str(random.randint(24, 30))
    cvv = ''.join(random.choices(string.digits, k=3))
    return f"{full}|{month}|{year}|{cvv}", full

# ------------------------ MAIN LOOP ------------------------
print(f"\n{M}GENERATING & CHECKING CARDS...\n{RESET}")

live_cards = []

for i in range(num_cards):
    full_card, pure = generate_unique_card(base_card)
    status = "LIVE ✅" if luhn_valid(pure) else "DEAD ❌"
    print(f"{Y}{i+1}. {full_card} -> {status}{RESET}")
    if "LIVE" in status:
        live_cards.append(full_card)

# ------------------------ FINAL OUTPUT ------------------------
print(f"\n{C}{'='*80}{RESET}")
print(f"{G}TOTAL LIVE CARDS : {len(live_cards)} / {num_cards}{RESET}")
print(f"{G}LIVE CARDS :{RESET}")
for c in live_cards:
    print(f"  {C}{c}{RESET}")
print(f"{C}{'='*80}{RESET}")
print(f"{Y}THANK YOU FOR USING AUTO CARD LIVE CHECKER - CSB SECURITY{RESET}")