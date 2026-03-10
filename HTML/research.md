# Research Questions

## 1. GET vs POST: 
>● In the `<form>` tag, we have an attribute method. Explain the critical security and functional difference between method="GET" and method="POST" .

- The method attribute in an HTML `<form>` tag defines how the data is sent to the server. 
- The critical differences between `GET` and `POST` methods lie in data transmission, security, and functionality.

| Aspect | method="GET" | method="POST" |
|------|---------------|----------------|
| Data Location | Data is appended to the URL as query parameters | Data is included in the body of the HTTP request, hidden from the URL |
| Visibility | Data is visible in the browser's address bar, browser history, and server logs | Data is not visible in the address bar or browser history |
| Security | Less secure for sensitive data  because it's exposed in various locations | More secure for sensitive data because it is not exposed in the URL |
| Data Size | Limited by the maximum URL length (around 2048–8000 characters depending on the browser/server). | No practical size limits; can handle large amounts of data, including file uploads. |
| Caching/Bookmarking | Requests can be cached by the browser and bookmarked. | Requests are generally not cached or bookmarkable. |
| Usage Semantics | Used for safe, idempotent operations (read-only, does not change server state), like searches or retrieving data. | Used for actions that change the server state (creating, updating, or deleting data), such as submitting a form or ordering a product. |

### Which one would you use for the register.html page and why?
- we would use `POST` for the register.html page because the form will contain sensitive user data such as username, email, and password. `POST` keeps this information out of the URL and allows sending larger and more secure data.

---
---
## 2. Semantic HTML: 

> ● We could build the whole website using only `<div>` tags.
###  Why is it "better" to use tags like `<header>`, `<main>`, `<section>`, and `<footer>`?

- It is better to use semantic HTML tags like `<header>`, `<main>`, `<section>`, and `<footer>` instead of only `<div>` tags because

1. Better readability and structure
Semantic tags clearly describe the role of each part of the page.
2. Improved accessibility
Screen readers and assistive technologies can better understand the structure of the page.
3. Better SEO (Search Engine Optimization)
Search engines understand the content of the page more easily.
4. Easier maintenance
Developers can quickly understand the layout of the website when reading the code.

*and* A `<div>` is a generic container with no inherent meaning, while a semantic element clearly describes the purpose of the content it contains to both the browser and the developer.

---
---

## 3. The Request/Response Cycle: 
### ● When you type google.com and hit Enter, briefly explain the steps your browser takes to fetch the page (Mention DNS and IP).

- When you type google.com in the browser and press Enter, the following steps happen:
1. #### DNS Lookup
     The browser asks the DNS (Domain Name System) to translate the domain name google.com into an IP address.
1. #### IP Address Resolution
    DNS returns the IP address of Google's server.
1. #### HTTP Request
   The browser sends an HTTP request to that IP address asking for the webpage.
1. #### Server Processing
    The web server processes the request.
1. #### HTTP Response
    The server sends back a response containing the HTML, CSS, and JavaScript files.
1. #### Page Renderin
    The browser downloads these files and renders the webpage so you can see it on the screen.
