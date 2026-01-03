---
layout: post  
permalink: /writeups/metactf/2025/january/cooked-books/writeup/
title: "Cooked Books"  
date: 2025-01-24 05:30  
tags: Cryptography  
description: "Cooked Books"
---

## **Challenge Name: Cooked Books**

### **Solves**

- **Solves:** 315
- **Points:** 100

### **Description**

We signed up for a new digital library provider, but the numbers they're giving us for the amount of times that our banned book selection is getting borrowed doesn't seem right. We believe they're hiding some sort of message in the report.

Download the report [here](Resources/banned_books_report.csv).

---

### **Approach**

The challenge description hinted that something was odd about the 'Times Borrowed' column of the CSV. I quickly extracted the numbers from that column:

```
77,101,116,97,67,84,70,123,49,110,102,48,114,109,52,116,105,48,110,95,49,115,95,112,48,119,51,114,125
```

These numbers appeared to be Decimal ASCII values, so I converted them to ASCII. The result gave us the flag:

```
MetaCTF{1nf0rm4ti0n_1s_p0w3r}
```

---

### **Flag**

```
MetaCTF{1nf0rm4ti0n_1s_p0w3r}
```

---
