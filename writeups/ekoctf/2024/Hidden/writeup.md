---
layout: post
permalink: /writeups/ekoctf/2024/Hidden/writeup/
title: "Hidden"
date: 2024-11-16 23:30
tags: Web Exploitation
description: "Hidden"
---

## **Challenge Name: Hidden**

### **Solves**

- **Solves**: 324
- **Points**: 5

### **Description**

You’ve found an old login portal from the early days of the internet. Back then, web designers often left behind hidden notes. This one was a difficult one before!

**URL**: [http://microson.ctf.site:20080](http://microson.ctf.site:20080)

---

### **Approach**

1. Open the URL: [http://microson.ctf.site:20080/](http://microson.ctf.site:20080/).
2. Inspect the page.
3. Navigate to the comments section.
4. Inside the comment, we found the hidden flag:  
   `<!-- hiding my secrets: EKO{s1mpl3_comm3nt} -->`.

**Flag**: `EKO{s1mpl3_comm3nt}`

---