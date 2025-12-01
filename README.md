# AUTO CARD GENERATOR & LIVE CHECKER - CSB SECURITY 🔥🛡️

**Author:** Alex Hunter (CSB Team)  
**Language:** Python / Cython  
**Platform:** Termux & Linux  

---

## 🔹 Description
This tool generates **unique credit card numbers** based on a base card and checks their validity using the **Luhn Algorithm**.  
It can generate multiple cards and marks them as **LIVE ✅** or **DEAD ❌**.

---

## 🔹 Features
- Auto-generate multiple unique credit cards  
- Luhn validity check for each card  
- Random CVV and expiry date generation  
- Colored terminal output  
- Works on Termux & Linux  
- GitHub-ready Cython support

---

## 🔹 Installation (GitHub Repo)


```
git clone https://github.com/csbking/CARD-MAKER.git
cd CARD-MAKER
python3 cardmaker.py
```
---

# 🔹 Example Output

GENERATING & CHECKING CARDS...

1. 1234567890123456|08|27|123 -> LIVE ✅
2. 1234567890129876|11|25|456 -> DEAD ❌

TOTAL LIVE CARDS : 1 / 2
LIVE CARDS :1234567890123456|08|27|123

---
# 🔹 Notes

Base card must be 16 digits
Only cards passing Luhn check are marked LIVE
Works best on Termux or Linux terminals with ANSI color support

---
# 🔹 Security & Disclaimer

- This tool is for educational and testing purposes only.
- Do not use generated card numbers for illegal transactions.


---

# 🔹 Contact

CSB Security Team
Developer: Alex Hunter

---
