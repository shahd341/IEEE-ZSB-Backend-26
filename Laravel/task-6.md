# Learning Notes

## 1. Understanding HTTP
**HTTP (Hypertext Transfer Protocol)** is an application-layer protocol used for transmitting hypermedia documents (like HTML, JSON) across the Web. It follows a **Client-Server Architecture** where the client (browser or API consumer) sends a request, and the server returns a response.

### Key Concepts:
- **Statelessness:** HTTP treats each request independently; the server does not retain session state between requests natively (sessions/cookies/tokens are used to overcome this).
- **HTTP Methods:**
  - `GET`: Retrieve data from the server (Read-only).
  - `POST`: Submit new data to the server (Create).
  - `PUT`: Replace an existing resource completely (Update).
  - `PATCH`: Update parts of an existing resource (Partial Update).
  - `DELETE`: Remove a resource from the server.

- **HTTP Status Codes:**

   - ### 1xx Informational Responses
        The server received the request headers and the client should continue the process.

      - **`100 Continue`:** Go ahead and send the request body.
      - **`101 Switching Protocols`:** The server is switching to an upgraded protocol, like WebSockets.
      - **`103 Early Hints`:** Returns partial response headers before the final message for preloading assets.

   - ### 2xx Success Responses
     The action was successfully received, understood, and accepted by the server.

     - **`200 OK`:** The standard response for a successful request.
     -  **`201 Created`:** The request succeeded and a new resource was  created.
     -  **`202 Accepted`:** The request is accepted for processing but is not complete yet.
     - **`204 No Content`:** Successful request, but there is no data to return.

  - ### 3xx Redirection Messages
    The client must take additional action or visit a different URL to complete the request.

     - **`301 Moved Permanently`:** The resource URL has changed permanently.
     - **`302 Found`:** The resource temporarily resides at a different location.
     - **`304 Not Modified`:** Tells the client to use its local cached version instead.
     - **`307 Temporary Redirect`:** Redirects temporarily while strictly maintaining the original HTTP method.
     - **`308 Permanent Redirect`:** Redirects permanently while strictly maintaining the original HTTP method.

   - ### 4xx Client Error Responses
     The request contains bad syntax or cannot be fulfilled due to a client-side issue.

     - **`400 Bad Request`:** Malformed syntax, invalid request payload, or bad formatting.
     - **`401 Unauthorized`:** Authentication credentials are required, missing, or invalid.
     - **`403 Forbidden`:** The server understands who you are but you do not have permission.
     - **`404 Not Found`:** The server cannot find the requested resource or URL.
     - **`405 Method Not Allowed`:** The specific HTTP method used is not permitted on this endpoint.
     - **`409 Conflict`:** The request conflicts with the current state of the server.
     - **`429 Too Many Requests`:** The client has sent too many requests and hit rate limits.

   - ### 5xx Server Error Responses
     The request was valid, but the server failed to fulfill it internally.

     - **`500 Internal Server Error`:** A generic catch-all error indicating something went wrong on the server.
     - **`501 Not Implemented`:** The server does not support the functionality required to fulfill the request.
     - **`502 Bad Gateway`:** A proxy or gateway server received an invalid response from upstream.
     - **`503 Service Unavailable`:** The server is temporarily overloaded or down for maintenance.
     - **`504 Gateway Timeout`:** An upstream server failed to respond to the gateway within the timeout limit.

  
- **Headers & Body:**
  - **Headers:** Metadata attached to requests/responses (e.g., `Content-Type`, `Authorization`).
  - **Body:** The actual payload (e.g., JSON data sent in a `POST` request).

---

## 2. Serialization & Deserialization
### What is Serialization?
Serialization is the process of converting a complex data structure or object in memory into a format (such as JSON, XML, or a byte stream) that can easily be stored in a database/file or transmitted over a network.

### What is Deserialization?
Deserialization is the reverse process: taking the serialized data stream (JSON/XML/bytes) and converting it back into a live object or data structure in memory.

### Why do we use them?
- **APIs:** Backend applications serialize PHP/Laravel Eloquent models into JSON to send over HTTP, and deserialize incoming JSON payloads into PHP arrays/objects.
- **Storage & Caching:** Storing complex user states or session objects into fast key-value stores (like Redis) or database text fields.

---

## 3. Caching
### What is Caching?
Caching is a technique used to store copies of frequently accessed data in a fast, temporary storage layer (usually RAM) to improve response times and reduce backend workload/database queries.

### Caching Types & Strategies:
- **In-Memory Caching:** Using fast in-memory databases like **Redis** or **Memcached**.
- **Cache-Aside (Lazy Loading):**
  1. Check if the requested data exists in the cache.
  2. If present (**Cache Hit**), return it immediately.
  3. If missing (**Cache Miss**), fetch data from the primary database, store it in the cache, and return it.
- **Eviction & Invalidation:**
  - **TTL (Time to Live):** Automatically expire cached entries after a specific duration.
  - **Cache Invalidation:** Explicitly deleting or updating the cache whenever the underlying database record changes to avoid stale data.

---

## 4. UML Class Diagram
Unified Modeling Language (UML) Class Diagrams are static structure diagrams that describe the system structure by showing classes, their attributes, methods, and relationships.

### Class Representation:
A class box consists of 3 sections:
1. **Class Name**
2. **Attributes / Properties** (with visibility indicators)
3. **Methods / Functions**

### Visibility Modifiers:
- `+` **Public:** Accessible from anywhere.
- `-` **Private:** Accessible only within the class.
- `#` **Protected:** Accessible within the class and derived classes.

### Relationships:
- **Inheritance (Generalization):** Solid line with a hollow arrow head.
- **Association:** Basic relationship between two classes.
- **Aggregation:** "Has-a" weak relationship (Child can exist independently of Parent).
- **Composition:** "Has-a" strong relationship (Child cannot exist without Parent).
- **Dependency:** A class uses another class temporarily.

---

## 5. Observer Design Pattern
The **Observer Pattern** is a behavioral design pattern where an object (the **Subject** or **Observable**) maintains a list of dependents (**Observers**) and notifies them automatically of any state changes, usually by calling one of their methods.

### Key Benefits:
- **Loose Coupling:** The Subject doesn't need to know the concrete details of the Observers, promoting modularity.
- **Event-Driven Architecture:** Widely used in framework event systems (e.g., Laravel Events & Listeners / Observers).

### Example Scenario:
When a new User registers:
- **Subject:** `UserRegistered` Event.
- **Observers:** `SendWelcomeEmailListener`, `LogUserRegistrationListener`, `CreateUserProfileListener`.

---

## 6. Real World System Design
System Design involves defining the architecture, modules, interfaces, and data for a system to satisfy specified requirements.

### Core Architecture Principles:
- **Scalability:**
  - **Vertical Scaling (Scale-Up):** Adding more CPU/RAM to a single server.
  - **Horizontal Scaling (Scale-Out):** Adding more server instances behind a **Load Balancer**.
- **Load Balancers:** Distribute incoming network traffic across multiple servers (e.g., Nginx, AWS ALB) to ensure high availability.
- **Database Optimization:**
  - **Read Replicas:** Separating read operations from write operations.
  - **Sharding:** Partitioning large databases horizontally across multiple servers.
- **Asynchronous Processing:** Using Message Queues (e.g., RabbitMQ, Redis Queues) to handle background jobs (sending emails, image processing) without blocking client HTTP responses.

---

## Resources Searched & Tools Used
- MDN Web Docs (HTTP Overview & Status Codes)
- Refactoring.Guru (Design Patterns: Observer Pattern)
- System Design Primer / System Design Basics
- ChatGPT / LLM Prompting: Used to research and summarize key concepts for Laravel task 6.