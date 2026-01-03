---
layout: post
permalink: /posts/Portswigger/api-testing
title: "API Testing by Portswigger Academy"
date: 2024-12-05 11:42
tags: API, API Security, API Testing
description: "API Testing by Portswigger Academy"
---

# API Testing

To start API testing, you first need to find out as much `information about the API` as possible, to discover its `attack surface`.
To begin, you should identify `API endpoints`. These are locations where an API receives requests about a specific resource on its server.

Example -   

            GET /api/books HTTP/1.1
            Host: example.com

The API endpoint for this request is `/api/books`. This results in an interaction with the API to retrieve a list of books from a library. Another API endpoint might be, for example, `/api/books/mystery`, which would retrieve a list of mystery books.

Once you have identified the endpoints, you need to determine how to interact with them. This enables you to construct valid HTTP requests to test the API. For example, you should find out information about the following:

1. The input data the API processes, including both compulsory and optional parameters.
2. The types of requests the API accepts, including supported HTTP methods and media formats.
3. Rate limits and authentication mechanisms.

## API Documentation

APIs are usually documented so that developers know how to use and integrate with them.

Documentation can be in both `human-readable` and `machine-readable` forms. Human-readable documentation is designed for `developers` to understand how to `use the API`. It may include detailed explanations, examples, and usage scenarios. 

Machine-readable documentation is designed to be `processed` by software for `automating tasks` like API integration and validation. It's written in structured formats like `JSON` or `XML`.

Sometimes, API Documentation is publicly available for external developers to access; in this case we should always start recon with the documentation.

For automated documentation you can tools such as [Postman](https://www.postman.com/) or [SoapUI](https://www.soapui.org/).

## Identifying API Endpoints

You can also gather a lot of information by browsing applications that use the API.

While browsing the application, look for `patterns` that suggest API endpoints in the URL structure, such as `/api/`. Also look out for `JavaScript files`. These can contain references to API endpoints that you haven't triggered directly via the web browser.

Once you've `identified API endpoints`, `interact` with them using `Burp Repeater` and `Burp Intruder`. This enables you to observe the API's behavior and `discover additional attack surface`.

### Identifying Supported HTTP Methods

The HTTP method specifies the action to be performed on a resource. For example:

- `GET` - Retrieves data from a resource.
- `PATCH` - Applies partial changes to a resource.
- `OPTIONS` - Retrieves information on the types of request methods that can be used on a resource.

An API endpoint may support different `HTTP methods`. It's therefore important to test all potential methods when you're investigating API endpoints. This may enable you to identify `additional endpoint functionality`, opening up more attack surface.

### Identifying Supported Content Type

API endpoints often expect data in a specific format. They may therefore behave differently depending on the content type of the data provided in a request. Changing the content type may enable you to:

- Trigger errors that disclose useful information.
- Bypass flawed defenses.
- Take advantage of differences in processing logic. For example, an API may be secure when handling JSON data but susceptible to injection attacks when dealing with XML.

To change the content type, modify the Content-Type header, then reformat the request body accordingly.

### Finding Hidden Endpoints

Once you have identified some initial API endpoints, you can use Intruder to uncover hidden endpoints. For example, consider a scenario where you have identified the following API endpoint for updating user information:

PUT /api/user/update

For example, you could add a payload to the /update position of the path with a list of other common functions, such as delete and add.

When looking for hidden endpoints, use wordlists based on common API naming conventions and industry terms. Make sure you also include terms that are relevant to the application, based on your initial recon.
`
When you're doing API recon, you may find undocumented `parameters` that the `API supports`. You can attempt to use these to `change` the `application's behavior`.

## Mass Assignment Vulnerabilities

Mass assignment (also known as `auto-binding`) can inadvertently create `hidden parameters`. It occurs when software frameworks automatically bind request parameters to fields on an internal object. Mass assignment may therefore result in the application `supporting parameters` that were `never intended` to be processed by the developer.

### Identifying Hidden Parameters

Since mass assignment creates parameters from object fields, you can often identify these hidden parameters by manually examining objects returned by the API.

For example, consider a `PATCH /api/users/` request, which enables users to update their username and email, and includes the following JSON:

```
{
    "username": "wiener",
    "email": "wiener@example.com",
}
```
A concurrent `GET /api/users/123` request returns the following JSON:
```
{
    "id": 123,
    "name": "John Doe",
    "email": "john@example.com",
    "isAdmin": "false"
}
```
This may indicate that the hidden `id` and `isAdmin` parameters are bound to the internal user object, alongside the updated username and email parameters.

### Preventing vulnerabilities in APIs

When designing APIs, make sure that security is a consideration from the beginning. In particular, make sure that you:

- `Secure your documentation` if you don't intend your API to be publicly accessible.
- Ensure your documentation is kept `up to date` so that legitimate testers have full visibility of the API's attack surface.
- Apply an `allowlist` of permitted `HTTP methods`.
- Validate that the content type is expected for each request or response.
- `Use generic error messages` to avoid giving away information that may be useful for an attacker.
- Use `protective measures on all versions of your API`, not just the current production version.

To prevent mass assignment vulnerabilities, allowlist the properties that can be updated by the user, and blocklist sensitive properties that shouldn't be updated by the user.

## Server-side parameter pollution

Some systems contain internal APIs that aren't directly accessible from the internet. Server-side parameter pollution occurs when a website embeds user input in a server-side request to an internal API without adequate encoding. This means that an attacker may be able to manipulate or inject parameters, which may enable them to, for example:

- Override existing parameters.
- Modify the application behavior.
- Access unauthorized data.

### Testing for server-side parameter pollution in the query string

To test for server-side parameter pollution in the query string, place query syntax characters like `#, &, and =` in your input and observe how the application responds.

#### Truncating query strings

You can use a `URL-encoded # character` to attempt to truncate the server-side request. To help you interpret the response, you could also add a string after the `#` character.

For example, you could modify the query string to the following:
```
GET /userSearch?name=peter%23foo&back=/home
```

The front-end will try to access the following URL:
```
GET /users/search?name=peter#foo&publicProfile=true
```

#### Injecting invalid parameters

You can use an URL-encoded & character to attempt to add a second parameter to the server-side request.

For example, you could modify the query string to the following:
```
GET /userSearch?name=peter%26foo=xyz&back=/home
```
This results in the following server-side request to the internal API:
```
GET /users/search?name=peter&foo=xyz&publicProfile=true
```

#### Injecting valid parameters

If you're able to modify the query string, you can then attempt to add a second valid parameter to the server-side request.

For example, if you've identified the email parameter, you could add it to the query string as follows:
```
GET /userSearch?name=peter%26email=foo&back=/home
```
This results in the following server-side request to the internal API:
```
GET /users/search?name=peter&email=foo&publicProfile=true
```

#### Overriding existing parameters

To confirm whether the application is vulnerable to server-side parameter pollution, you could try to override the original parameter. Do this by injecting a second parameter with the same name.

For example, you could modify the query string to the following:
```
GET /userSearch?name=peter%26name=carlos&back=/home
```
This results in the following server-side request to the internal API:
```
GET /users/search?name=peter&name=carlos&publicProfile=true
```

#### Testing for server-side parameter pollution in REST paths

A RESTful API may place parameter names and values in the URL path, rather than the query string. For example, consider the following path:

```
/api/users/123
```

The URL path might be broken down as follows:
```
/api is the root API endpoint.
```
`/users` represents a resource, in this case users.

/123represents a parameter, here an identifier for the specific user.

Consider an application that enables you to edit user profiles based on their username. Requests are sent to the following endpoint:
```
GET /edit_profile.php?name=peter
```
This results in the following server-side request:
```
GET /api/private/users/peter
```
An attacker may be able to manipulate server-side URL path parameters to exploit the API. To test for this vulnerability, add path traversal sequences to modify parameters and observe how the application responds.

You could submit URL-encoded `peter/../admin` as the value of the name parameter:
```
GET /edit_profile.php?name=peter%2f..%2fadmin
```
This may result in the following server-side request:
```
GET /api/private/users/peter/../admin
```

If the server-side client or back-end API normalize this path, it may be resolved to `/api/private/users/admin`.

#### Testing for server-side parameter pollution in structured data formats

An attacker may be able to `manipulate parameters to exploit vulnerabilities` in the server's processing of other `structured data formats`, such as a `JSON or XML`. To test for this, inject unexpected structured data into user inputs and see how the server responds.

Consider an application that enables users to edit their profile, then applies their changes with a request to a server-side API. When you edit your name, your browser makes the following request:
```
POST /myaccount
name=peter
```

This results in the following server-side request:
```
PATCH /users/7312/update
{"name":"peter"}
```
You can attempt to add the access_level parameter to the request as follows:
```
POST /myaccount
name=peter","access_level":"administrator
```
If the user input is added to the server-side JSON data without adequate validation or sanitization, this results in the following server-side request:
```
PATCH /users/7312/update
{name="peter","access_level":"administrator"}
```
This may result in the user peter being given administrator access.

Similarly,

You can attempt to add the access_level parameter to the request as follows:
```
POST /myaccount
{"name": "peter\",\"access_level\":\"administrator"}
```
If the user input is decoded, then added to the server-side JSON data without adequate encoding, this results in the following server-side request:
```
PATCH /users/7312/update
{"name":"peter","access_level":"administrator"}
```

### Preventing server-side parameter pollution

To prevent server-side parameter pollution, use an allowlist to define characters that don't need encoding, and make sure all other user input is encoded before it's included in a server-side request. You should also make sure that all input adheres to the expected format and structure.

---