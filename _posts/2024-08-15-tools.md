---
layout: post
permalink: /posts/cyberprofessional/tools
title: "Tools of the trade - Linux and SQL"
date: 2024-08-15 18:12
tags: Linux
description: "Informational notes for Google Cybersecurity Professional Course - Tools of the Trade"
---

### **Operating Systems (OS)**  
The OS serves as the interface between computer hardware and users. It ensures efficiency and ease of use by managing computer operations.

---

### **Key Concepts**  

#### **Hardware**  
The physical components of a computer.

#### **Application**  
A program that performs a specific task.  
- Applications send requests to the OS, which forwards them to the hardware.  
- Hardware communicates back to the OS, which relays information to applications.

#### **Boot Process**  
When a computer is turned on:  
1. **BIOS/UEFI**:  
   - **BIOS**: Prevalent in older systems, it contains loading instructions.  
   - **UEFI**: A modern replacement for BIOS, more advanced and flexible.  
2. **Bootloader**: Software that loads the operating system.

#### **Resource Allocation**  
The OS manages memory and resources to optimize CPU usage across multiple tasks and processes.

#### **Virtual Machines and Virtualization**  
- **Virtual Machine (VM)**: A virtual representation of a physical computer.  
- **Virtualization**: Creating virtual versions of machines using software.

#### **Interfaces**  
- **User Interface**: Allows users to control OS functions.  
- **Graphical User Interface (GUI)**: Uses visual icons (e.g., Start menu, Taskbar).  
- **Command Line Interface (CLI)**: Text-based interaction via commands.

---

### **Linux Overview**  
An open-source operating system derived from UNIX.  

#### **Linux Components**  
1. **User**: Interacts with the system.  
2. **Applications**: Perform specific tasks.  
3. **Shell**: Command-line interpreter.  
4. **Filesystem Hierarchy Standard (FHS)**: Organizes data.  
5. **Kernel**: Manages processes and memory.  
6. **Hardware**: Physical components.

#### **Popular Linux Distros**  
1. Red Hat Enterprise Linux (CentOS)  
2. Slackware (SUSE)  
3. Debian (Ubuntu, Kali Linux)

   ![File-Permissions-Linux](/assets/images/File-Permissions-Linux.png)

#### **Linux Commands**  
1. `pwd`: Prints current directory.  
2. `ls`: Lists files and directories.  
3. `cd`: Changes directory.  
4. `grep`: Searches a file for specified strings.  
5. `mkdir`: Creates directories.  
6. `rm`: Removes files or directories.  
7. `mv`: Moves files.  
8. `chmod`: Changes file permissions.

#### **File Permissions**  
- **Types**: Read (r), Write (w), Execute (x).  
- **Owners**: User (u), Group (g), Others (o).  

#### **Basic Shells**  
1. **Bash**: Most common.  
2. **Zsh**: Enhanced features.  
3. **Csh/Ksh**: Older alternatives.

---

### **Security Analysts and Linux**  
- Analyze logs, manage files remotely, and configure permissions.  
- Use commands and tools like `tcpdump`, Wireshark, and Metasploit.

---

### **Databases and SQL**  

#### **Core Concepts**  
1. **Database**: Organized data collection.  
2. **Relational Database**: Tables connected by relationships.  
3. **SQL (Structured Query Language)**: Interacts with databases.

#### **Key SQL Queries**  
1. `SELECT`: Returns specified columns.  
2. `FROM`: Identifies the table.  
3. `WHERE`: Filters results based on conditions.

#### **Joins in SQL**  
1. **INNER JOIN**: Matches rows in multiple tables.  
2. **LEFT JOIN**: Includes all rows from the first table and matched rows from the second.  
3. **RIGHT JOIN**: Includes all rows from the second table and matched rows from the first.  
4. **FULL OUTER JOIN**: Combines all rows from both tables.

---

### **Additional Notes**  

#### **Penetration Testing Tools**  
1. **Metasploit**: Exploits vulnerabilities.  
2. **Burp Suite**: Tests web app weaknesses.  
3. **John the Ripper**: Password cracking.

#### **Linux Package Management**  
- A **package** is software used individually or as part of applications.  
- **Package Managers**: Tools for installation and management.

---

### **Advanced Commands**  
1. `sudo`: Temporary elevated privileges.  
2. `man`: Detailed documentation for commands.  
3. `whatis`: Command summaries.  
4. `apropos`: Searches command manuals.

---

### **File System Hierarchy in Linux**  
- Root (`/`): The top-level directory.  
- Organizes directories and subdirectories.  
- Example structure:  

  ![Linux Directory Structure](/assets/images/Linux-tree.jpg)

---

### **Conclusion**  
Linux and its tools provide a flexible environment for various use cases, from development to cybersecurity. Mastering its commands, file systems, and interfaces opens pathways to efficient computing.