---
layout: post
permalink: /posts/Portswigger/path-traversal
title: "Path Traversal by Portswigger Academy"
date: 2024-11-27 18:42
tags: Lateral Movement, Path Traversal, Directory Traversal
description: "Path Traversal - Portswigger Academy"
---

# Path Traversal

Path traversal, also known as **directory traversal**, is a tactic used by attackers to **discover** certain **endpoints** in an application and potentially **read arbitrary files** on the server.

### What This Might Include:
- Application **code** and **data**  
- Login **credentials**  
- Sensitive **operating system** files  

In some cases, an attacker may even **write to arbitrary files**, allowing them to **modify application data** or behavior and ultimately take **full control of the server**.

---

## Reading Arbitrary Files

Imagine an application that embeds an **image** on its homepage. The **HTML** for the page might look like this:

```html
<img src="/img?filename=image1.png">
```

Here, the `img` URL accepts a `filename` parameter and **fetches and returns** the specified file. Typically, image files are stored under `/var/www/images`. To return the requested file, the application appends the user-provided filename to the base URL and uses the **filesystem API** to read its contents.

If the application **does not implement defenses** against path traversal attacks, attackers can exploit this behavior to retrieve sensitive files from the server.  

For example, an attacker could request the `/etc/passwd` file (which contains information about users registered on the server) using the following:

```
https://insecure-website.com/img?filename=../../../etc/passwd
```

### How It Works:
- The `..` represents the **parent directory** in Linux.  
- By chaining `../` three times, the path resolves to the **root directory (`/`)**, and the application then accesses `/etc/passwd`.

---

## Common Obstacles to Exploiting Path Traversal Vulnerabilities

Many applications attempt to defend against path traversal by **filtering or blocking directory traversal sequences**. However, these defenses can often be bypassed.

### Bypass Techniques:
1. **Using Absolute Paths**  
   Directly reference a file using its absolute path without traversal sequences.  
   **Example:**  
   ```
   GET /image?filename=/etc/passwd HTTP/2
   ```

2. **Nested Traversal Sequences**  
   Use patterns like `....//` or `....\/`, which simplify to `../` when inner sequences are stripped.  
   **Example:**  
   ```
   GET /image?filename=....//....//....//etc/passwd HTTP/2
   ```

3. **URL Encoding or Double URL Encoding**  
   If the application strips `../`, encode it as `%2F` (URL encoding) or `%252F` (double URL encoding).  
   **Example:**  
   ```
   GET /image?filename=..%252F..%252F..%252Fetc%252Fpasswd HTTP/2
   ```

4. **Required Base Folder**  
   If the application requires filenames to start with a base folder, append traversal sequences after the folder.  
   **Example:**  
   ```
   GET /image?filename=/var/www/images/../../../etc/passwd HTTP/2
   ```

5. **Required File Extension**  
   Use a **null byte** (`%00`) to terminate the file path before the required extension.  
   **Example:**  
   ```
   GET /image?filename=../../../etc/passwd%00.png HTTP/2
   ```

---

## How to Prevent a Path Traversal Attack

### Best Practices:
1. **Avoid Passing User-Supplied Input to Filesystem APIs**  
   Rewrite application functions to avoid processing filesystem paths directly.

2. **Validate User Input**  
   - Use a **whitelist of permitted values** for user input.  
   - If not feasible, ensure the input contains only safe characters (e.g., alphanumeric only).

3. **Canonicalize and Verify Paths**  
   - Append the input to the **base directory**.  
   - Use a platform filesystem API to **canonicalize** the resulting path.  
   - Verify that the canonicalized path starts with the **expected base directory**.

   **Example (Java):**
   ```java
   File file = new File(BASE_DIRECTORY, userInput);
   if (file.getCanonicalPath().startsWith(BASE_DIRECTORY)) {
       // process file
   }
   ```

---

By implementing these strategies, you can significantly reduce the risk of path traversal vulnerabilities in your application.