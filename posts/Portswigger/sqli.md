---
layout: post
permalink: /posts/Portswigger/sqli
title: "SQL Injection by Portswigger Academy"
date: 2024-11-18 17:22
tags: SQL, SQLi, SQL Injection
description: "SQL Injection"
---

# SQL Injection

## Definition
SQL injection (SQLi) is a web security vulnerability that allows an attacker to interfere with the queries that an application makes to its database. This can allow an attacker to view data that they are not normally able to retrieve.

## SQLi Detection
You can detect SQL injection manually using a systematic set of tests against every entry point in the application.
Alternatively, you can find the majority of SQL injection vulnerabilities quickly and reliably using 'Burp Scanner'.

## SQLi Keywords
Most SQL injection vulnerabilities occur within the `WHERE` clause of a `SELECT` query.
Others include - `UPDATE`, `INSERT`, `WHERE`, `ORDER BY` clauses and many more.

## Classic SQLi
The most common SQL Injection technique, is to use the comment marker (--) to bypass certain queries.

Example - For a login form where we input 'username' and 'password'.

        
        SELECT * FROM users WHERE username = 'username' AND password = 'password'
        
        Here, we can make use of the comment marker(--) to bypass into it without needing the password.

        SELECT * FROM users WHERE username = 'administrator'--' AND password = ''

        Here, after the `--` marker, ' AND password = '' get commented out and we login into the system.
___
## Union Based SQLi
When an application is vulnerable to SQL injection, and the results of the query are returned within the application's responses, you can use the `UNION` keyword to retrieve data from other tables within the database. This is commonly known as a SQL injection UNION attack.

Example -


        SELECT a, b FROM table1 UNION SELECT c, d FROM table2

        This SQL query returns a single result set with two columns, containing values from columns a and b in table1 and columns c and d in table2.

For a UNION query to work, two key requirements must be met:

-  The individual queries must return the `same number of columns`.

- The `data types in each column must be compatible` between the individual queries.
___
### Determining Number of Columns
When you perform a SQL injection UNION attack, there are two effective methods to determine how many columns are being returned from the original query.

- One method involves injecting a series of ORDER BY clauses and incrementing the specified column index until an error occurs. 

For example - If the injection point is a quoted string within the WHERE clause of the original query, you would submit:

        ' ORDER BY 1--
        ' ORDER BY 2--
        ' ORDER BY 3--  
        etc.

This uses the column number you provide as the argument to ORDER BY the output table. So, if you input a table number that doesn't exist it'll throw you an error and hence we can be sure that the number of columns were (current - 1).

Example Error - `The ORDER BY position number 3 is out of range of the number of items in the select list.`

This means that number of columns = 2.

-  The second method involves submitting a series of UNION SELECT payloads specifying a different number of null values:

        ' UNION SELECT NULL--
        ' UNION SELECT NULL,NULL--
        ' UNION SELECT NULL,NULL,NULL--
        etc.

If the number of nulls does not match the number of columns, the database returns an error.

Example Error - `All queries combined using a UNION, INTERSECT or EXCEPT operator must have an equal number of expressions in their target lists.`
___
### Database-specific syntax
On Oracle, every SELECT query must use the FROM keyword and specify a valid table. There is a built-in table on Oracle called dual which can be used for this purpose. So the injected queries on Oracle would need to look like:  `' UNION SELECT NULL FROM DUAL--`
___
### Finding column Data Type
A SQL injection UNION attack enables you to retrieve the results from an injected query. The interesting data that you want to retrieve is normally in string form. This means you need to find one or more columns in the original query results whose data type is, or is compatible with, string data.

After you determine the number of required columns, you can probe each column to test whether it can hold string data. You can submit a series of `UNION SELECT` payloads that place a string value into each column in turn.

Example - 
                
                ' UNION SELECT 'a',NULL,NULL,NULL--
                ' UNION SELECT NULL,'a',NULL,NULL--
                ' UNION SELECT NULL,NULL,'a',NULL--
                ' UNION SELECT NULL,NULL,NULL,'a'--

If the column data type is not compatible with string data type, it'll return an error like - `Conversion failed when converting the varchar value 'a' to data type int.`

If no error is returned, then we can be sure that the target column is suitable for retrieving string data.
___
### Using SQL UNION Injection to retrieve Interesting Data
When we've determined - 
-  The Number Of Columns
-  Data Type Of Columns
-  Database Name
-  Column Name

Example Payload - `' UNION SELECT username, password FROM users--`

We can move forward and start extracting meaningful data from the Database. But, for this to happen we need to know the details about the structure of the database and it's name. All modern databases provide ways to examine the database structure, and determine what tables and columns they contain.
___
### Retrieving multiple values within a single column
You can retrieve multiple values together within this single column by concatenating the values together. You can include a separator to let you distinguish the combined values.

Example - `' UNION SELECT username || '~' || password FROM users--`

But, we need to take care of the number of columns bring returned and add consecutive NULL placeholders accordingly.
___
## Examining the database in SQL injection attacks
To exploit SQL injection vulnerabilities, it's often necessary to find information about the database. This includes:
___
### The ``type` and `version` of the database software.
You can potentially identify both the database type and version by injecting provider-specific queries.
The following are some queries to determine the database version for some popular database types:

Microsoft, MySQL - SELECT @@version
Oracle - SELECT * FROM v$version
PostgreSQL - SELECT version()

Example - ` ' UNION SELECT @@version-- `
___
### The `tables` and `columns` that the database contains.
Most database types (except Oracle) have a set of views called the information schema. This provides information about the database.
You can query `information_schema.tables` to list all tables in the database.

Example - `SELECT * FROM information_schema.tables` OR `' UNION SELECT table_name, NULL FROM information_schema.tables--`

Additionally,
You can then query `information_schema.columns` to list the columns in individual tables:

Example - `SELECT * FROM information_schema.columns WHERE table_name = 'Users'` OR `' UNION SELECT column_name, NULL FROM information_schema.columns WHERE table_name='users_ixbnuw'--`

After this, we can simply select the column_name1,column_name2 from the table_name we discovered.
___
## Blind SQL injection
Blind SQL injection occurs when an application is vulnerable to SQL injection, but its HTTP responses do not contain the results of the relevant SQL query or the details of any database errors. This can make it hard for the attacker to exploit as there is no feedback.

Techniques like `UNION` are ineffective here because they rely on feedback and response from the server to exploit it.
___
### Triggering Conditional Response
Let's say an application tracks it's users based on TrackingID, and requests contain a header like the this - `Cookie: TrackingId=u5YD3PapBcR4lN3e7Tj4`

Now, the database would check if this value exists in the database beforehand or not, and if it does it'd return a `Welcome Back` message and if doesn't it won't return any such message, or maybe say `Invalid Tracking ID`. This slight change in the behaviour in response of different inputs is enough to formulate an exploit.

Example - `SELECT TrackingId FROM TrackedUsers WHERE TrackingId = 'u5YD3PapBcR4lN3e7Tj4'`

Suppose there is a table called `Users` with the columns `Username` and `Password`, and a user called `Administrator`. You can determine the password for this user by sending a series of inputs to test the password `one character at a time`.

We can start with - ` xyz' AND SUBSTRING((SELECT Password FROM Users WHERE Username = 'Administrator'), 1, 1) > 'm `

This returns the `Welcome back` message, indicating that the injected condition is `true`, and so the `first character of the password is greater than m`.

Next, we send - `xyz' AND SUBSTRING((SELECT Password FROM Users WHERE Username = 'Administrator'), 1, 1) > 't`

This does not return Welcome Back indicating that the injected condition is `false`, and so the `first character of the password is not greater than t`.

And so on, we can try and test to narrow the character down and find the first characters, after that we can re-iterate the same process to find each character and construct the password!
___
### Error-based SQL injection
Error-based SQL injection refers to cases where you're able to use error messages to either extract or infer sensitive data from the database, even in blind contexts.

The possibilities depend on the configuration of the database and the types of errors you're able to trigger:

-  You may be able to induce the application to return a `specific error response` based on the result of a `boolean expression`. You can exploit this in the same way as the conditional responses.

-  You may be able to trigger `error messages that output the data returned by the query`. This effectively turns otherwise blind SQL injection vulnerabilities into visible ones.
___
#### Exploiting Blind SQL injection by triggering conditional errors
Some applications carry out SQL queries but their `behavior doesn't change`, regardless of whether the query returns any data. So, the methods previously used wouldn't work here as there's `no variation in application's response` to different inputs.

It's often possible to induce the application to `return a different response depending on whether a SQL error` occurs. You can modify the query so that it causes a `database error` only if the condition is `true`. Very often, an unhandled error thrown by the database causes some difference in the application's response, such as an `error message`. This enables you to infer the truth of the injected condition.

Let's take an example to understand this, say we inject the following to string turn by turn to a vulnerable application,

                xyz' AND (SELECT CASE WHEN (1=2) THEN 1/0 ELSE 'a' END)='a
                xyz' AND (SELECT CASE WHEN (1=1) THEN 1/0 ELSE 'a' END)='a

Here, the `CASE` keyword is used to test a condition and return a different expression depending on whether the expression is true.

So, for the first input the condition `1=2` is always `false`, and it'll evaluate to 'a', which won't cause an error.
But, for the second input the condition `1=1` is always `true`, and it'll cause `DivideByZero Error`.

This causes, difference in the response from the HTTP Server, and hence we can determine whether the injected query was `True`, and hence get some kind of feedback. An actual scenario could be something like the following, to test for 1 character at a time. 

                xyz' AND (SELECT CASE WHEN (Username = 'Administrator' AND SUBSTRING(Password, 1, 1) > 'm') THEN 1/0 ELSE 'a' END FROM Users)='a

___
#### Extracting sensitive data via verbose SQL error messages
Misconfiguration of the database sometimes results in verbose error messages.

Example Error -  `Unterminated string literal started at position 52 in SQL SELECT * FROM tracking WHERE id = '''. Expected char`

This shows us the whole query constructed by the application, along with the error. This could be used to exploit the queries.

Occasionally, you may be able to induce the application to generate an error message that contains some of the data that is returned by the query. This effectively turns an otherwise blind SQL injection vulnerability into a visible one.

You can use the CAST() function to achieve this. It enables you to convert one data type to another. 

Example -

                CAST((SELECT example_column FROM example_table) AS int)

                would return, ERROR: invalid input syntax for type integer: "Example data"
___
### Exploiting blind SQL injection by triggering time delays
If the application catches database errors when the `SQL query is executed and handles them gracefully`, there won't be any difference in the application's response. This means the previous technique for inducing `conditional errors will not work`.
In this situation, it is often possible to exploit the `blind SQL injection vulnerability by triggering time delays` depending on whether an injected condition is `true` or `false`.

The techniques for triggering a time delay are specific to the type of database being used.For example, on Microsoft SQL Server, you can use the following to test a condition and trigger a delay depending on whether the expression is true:

                        '; IF (1=2) WAITFOR DELAY '0:0:10'--
                        '; IF (1=1) WAITFOR DELAY '0:0:10'--
Here, the first condition doesn't trigger a delay as `1=2` is always `false`. but, the second condition does.
___
### Exploiting blind SQL injection using out-of-band (OAST) techniques
An application might carry out the same SQL query as the previous example but do it `asynchronously`. The application continues processing the user's request in the `original thread`, and uses `another thread` to `execute a SQL query`. The query is still vulnerable to SQL injection, but none of the techniques described so far will work. The application's response `doesn't depend` on the `query returning any data`, `a database error` occurring, or on the `time taken` to execute the query.

In this situation, it is often possible to `exploit` the blind SQL injection vulnerability by `triggering out-of-band network interactions` to a `system that you control`. These can be triggered based on an injected condition to `infer information one piece at a time`. More usefully, data can be exfiltrated directly within the network interaction.

Out-of-band (OAST) techniques are a powerful way to detect and exploit blind SQL injection, due to the high chance of success and the ability to directly exfiltrate data within the out-of-band channel. For this reason, OAST techniques are often preferable even in situations where other techniques for blind exploitation do work.

## SQL injection in different contexts
Up until now, we used the query string to inject our malicious SQL payload. However, we can perform SQL injection attacks using any controllable input that is processed as a SQL query by the application. For example, some websites take input in JSON or XML format and use this to query the database.

## Second-order SQL injection
First-order SQL injection occurs when the application processes user input from an `HTTP request` and `incorporates the input into a SQL query in an unsafe way`.

Second-order SQL injection occurs when the application takes user input from an `HTTP request` and `stores it for future use`. This is usually done by placing the input into a database, but no vulnerability occurs at the point where the data is stored. Later, when handling a different HTTP request, the application retrieves the stored data and incorporates it into a SQL query in an unsafe way. For this reason, `second-order SQL injection` is also known as `stored SQL injection`.
___
## How to prevent SQL injection
You can prevent most instances of SQL injection using parameterized queries instead of string concatenation within the query. These parameterized queries are also know as "prepared statements".

The following code is vulnerable to SQL injection because the user input is concatenated directly into the query:

                String query = "SELECT * FROM products WHERE category = '"+ input + "'";
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(query);

You can rewrite this code in a way that prevents the user input from interfering with the query structure:

                PreparedStatement statement = connection.prepareStatement("SELECT * FROM products WHERE category = ?");
                statement.setString(1, input);
                ResultSet resultSet = statement.executeQuery();

You can use parameterized queries for any situation where untrusted input appears as data within the query, including the WHERE clause and values in an INSERT or UPDATE statement. They can't be used to handle untrusted input in other parts of the query, such as table or column names, or the ORDER BY clause. Application functionality that places untrusted data into these parts of the query needs to take a different approach, such as:

-  Whitelisting permitted input values.
-  Using different logic to deliver the required behavior.

___

**Cheatsheet** - [SQL-Injection Cheatsheet](https://portswigger.net/web-security/sql-injection/cheat-sheet)
========