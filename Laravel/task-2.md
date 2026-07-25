# Research Questions

# 1. Laravel Gates

## What are Laravel Gates?

Laravel Gates are used to authorize users to perform specific actions.

A Gate is a simple way to check if a user has permission to do something.

For example:
- Edit a post
- Delete a user
- Access the admin dashboard

Laravel Gates return either **true** or **false**.

---

## Why Use Gates?

- Keep authorization logic in one place.
- Make the code clean and organized.
- Easy to reuse in different controllers.

---

## Defining a Gate

Gates are usually defined in `AppServiceProvider`.

```php
use Illuminate\Support\Facades\Gate;

public function boot()
{
    Gate::define('edit-post', function ($user, $post) {
        return $user->id === $post->user_id;
    });
}
```

This Gate allows users to edit only their own posts.

---

## Using a Gate in a Controller

```php
if (Gate::allows('edit-post', $post)) {
    return "You can edit this post.";
}

return "Access denied.";
```

---

## Using authorize()

```php
public function update(Post $post)
{
    $this->authorize('edit-post', $post);

    // Update the post...
}
```

If the user is not authorized, Laravel automatically returns **403 Forbidden**.

---

## Example

Suppose we have:

```text
User ID = 5
Post Owner ID = 5
```

The Gate returns:

```text
true
```

The user can edit the post.

But if:

```text
User ID = 3
Post Owner ID = 5
```

The Gate returns:

```text
false
```

The user cannot edit the post.

---

## Conclusion

Laravel Gates provide a simple way to control user permissions and protect application resources.

---

# 2. Sanctum vs Passport

## What is Laravel Sanctum?

Laravel Sanctum is a lightweight authentication package.

It is mainly used for:

- SPA (Single Page Applications)
- Mobile applications
- Simple API authentication

Sanctum creates API tokens for users.

Example:

```php
$token = $user->createToken('mobile')->plainTextToken;
```

---

## What is Laravel Passport?

Laravel Passport is a complete OAuth2 authentication package.

It is used for:

- Large applications
- Third-party authentication
- OAuth2 authorization

Passport supports:

- Access Tokens
- Refresh Tokens
- Client Credentials
- Authorization Code Flow

---

## Comparison

| Feature | Sanctum | Passport |
|---------|----------|-----------|
| Easy to use | Yes | No |
| OAuth2 | No | Yes |
| API Tokens | Yes | Yes |
| SPA Support | Excellent | Good |
| Mobile Apps | Yes | Yes |
| Third-party Login | No | Yes |

---

## When to Use Sanctum?

Use Sanctum when:

- Building a Laravel API.
- Building a SPA.
- Building a mobile app.
- OAuth2 is not needed.

---

## When to Use Passport?

Use Passport when:

- Building a large API.
- Supporting third-party applications.
- OAuth2 authentication is required.

---

## Conclusion

Sanctum is simple and lightweight.

Passport is more powerful and supports OAuth2.

---

# 3. XSRF vs CSRF

## What is CSRF?

CSRF stands for:

**Cross-Site Request Forgery**

It is a security attack where a hacker tricks a logged-in user into sending unwanted requests.

Example:

A user is logged into a banking website.

The attacker sends a hidden request like:

```text
Transfer $500 to another account.
```

The browser sends the user's cookies automatically, making the request appear legitimate.

---

## What is XSRF?

XSRF means exactly the same thing as CSRF.

There is **no technical difference**.

Some frameworks, including Laravel, use the term **XSRF**, while others use **CSRF**.

---

## How Laravel Protects Against CSRF

Laravel generates a unique CSRF token for every session.

Forms include:

```blade
<form method="POST">

    @csrf

</form>
```

Laravel checks this token before processing the request.

If the token is invalid, Laravel rejects the request.

---

## Example

Correct:

```blade
<form method="POST">

    @csrf

    <button>Save</button>

</form>
```

Incorrect:

```blade
<form method="POST">

    <button>Save</button>

</form>
```

The second form will fail because it has no CSRF token.

---

## Conclusion

CSRF and XSRF refer to the same security attack.

Laravel protects applications using CSRF tokens.

---

# 4. Defining Relationships in Eloquent Models

## What are Relationships?

Relationships connect tables together.

Instead of writing SQL joins manually, Eloquent handles them automatically.

---

# One to One

One user has one profile.

User Model:

```php
public function profile()
{
    return $this->hasOne(Profile::class);
}
```

Profile Model:

```php
public function user()
{
    return $this->belongsTo(User::class);
}
```

Usage:

```php
$user->profile;
```

---

# One to Many

One user has many posts.

User Model:

```php
public function posts()
{
    return $this->hasMany(Post::class);
}
```

Post Model:

```php
public function user()
{
    return $this->belongsTo(User::class);
}
```

Usage:

```php
$user->posts;
```

---

# Many to Many

A student can join many courses.

A course can have many students.

Student Model:

```php
public function courses()
{
    return $this->belongsToMany(Course::class);
}
```

Course Model:

```php
public function students()
{
    return $this->belongsToMany(Student::class);
}
```

Usage:

```php
$student->courses;
```

---

# Has One Through

Example:

A Mechanic works on one Car.

A Car has one Owner.

Mechanic Model:

```php
public function owner()
{
    return $this->hasOneThrough(
        Owner::class,
        Car::class
    );
}
```

---

# Has Many Through

Example:

A Country has many Posts through Users.

Country Model:

```php
public function posts()
{
    return $this->hasManyThrough(
        Post::class,
        User::class
    );
}
```

---

## Why Use Relationships?

- Less SQL code.
- Cleaner code.
- Easy to understand.
- Faster development.
- Better code organization.

---

## Conclusion

Eloquent relationships make working with related database tables simple, readable, and efficient.