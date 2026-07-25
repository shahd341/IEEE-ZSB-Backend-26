# Research Questions 

## 1. Blade Templates and How They Work

### What is Blade?

Blade is the template engine used by Laravel. It helps developers create web pages using simple syntax while mixing HTML with PHP code.

Blade files have the extension:

```text
.blade.php
```

Example:

```text
resources/views/welcome.blade.php
```

---

### Why use Blade?

- Easy to read and write.
- Reuse code with layouts and components.
- Supports loops, conditions, and variables.
- Automatically protects against XSS attacks by escaping output.

---

### Displaying Data

Controller:

```php
public function index()
{
    $name = "John";
    return view('welcome', compact('name'));
}
```

Blade:

```blade
<h1>Hello, {{ $name }}</h1>
```

Output:

```text
Hello, John
```

---

### If Statement

```blade
@if($age >= 18)
    <p>Adult</p>
@else
    <p>Minor</p>
@endif
```

---

### Loop Example

```blade
@foreach($users as $user)
    <p>{{ $user->name }}</p>
@endforeach
```

---

### Blade Layout Example

Main Layout:

```blade
<!-- resources/views/layouts/app.blade.php -->

<html>
<head>
    <title>My Website</title>
</head>
<body>

@yield('content')

</body>
</html>
```

Child Page:

```blade
@extends('layouts.app')

@section('content')
    <h1>Welcome to Laravel</h1>
@endsection
```

---

## Conclusion

Blade makes creating dynamic web pages simple, clean, and reusable.

---

# 2. What is ORM and Why is it Useful?

## What is ORM?

ORM stands for **Object Relational Mapping**.

It allows developers to work with database tables using PHP objects instead of writing SQL queries all the time.

Laravel uses an ORM called **Eloquent ORM**.

---

## Without ORM

```php
SELECT * FROM users WHERE id = 1;
```

---

## With Eloquent ORM

```php
$user = User::find(1);
```

Laravel converts this code into the SQL query automatically.

---

## Example

Database Table:

| id | name |
|----|------|
| 1 | Ahmed |
| 2 | Sara |

Model:

```php
class User extends Model
{
}
```

Getting all users:

```php
$users = User::all();
```

Finding one user:

```php
$user = User::find(1);
```

Creating a new user:

```php
User::create([
    'name' => 'Ali'
]);
```

Updating:

```php
$user = User::find(1);
$user->name = "Omar";
$user->save();
```

Deleting:

```php
$user->delete();
```

---

## Why is ORM Useful?

- Less SQL code.
- Easier to read.
- Faster development.
- Better security.
- Easy relationships between tables.

Example:

```php
$post->user;
```

This gets the user who owns the post without writing SQL.

---

## Conclusion

Eloquent ORM makes database operations simple, clean, and object-oriented.

---

# 3. Facade Design Pattern and How Laravel Uses It

## What is a Facade?

A Facade is a design pattern that provides a simple interface to a complex system.

Instead of creating many objects manually, we use one simple class.

Laravel uses Facades everywhere.

---

## Why use Facades?

- Easy to use.
- Cleaner code.
- No need to create service objects manually.

---

## Example 1: Cache Facade

```php
use Illuminate\Support\Facades\Cache;

Cache::put('name', 'Ahmed', 60);

$name = Cache::get('name');
```

---

## Example 2: Route Facade

```php
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return "Welcome";
});
```

---

## Example 3: DB Facade

```php
use Illuminate\Support\Facades\DB;

$users = DB::table('users')->get();
```

---

## How Facades Work

Behind the scenes:

```
Facade
     ↓
Service Container
     ↓
Real Service Class
```

The Facade hides all the complex work.

---

## Conclusion

Facades make Laravel code shorter, easier to read, and easier to use.

---

# 4. Factory Design Pattern

## What is the Factory Pattern?

The Factory Pattern is a design pattern used to create objects without creating them directly using `new`.

Instead, a factory creates the object for us.

Laravel uses factories to generate fake data for testing and database seeding.

---

## Example Factory

```php
User::factory()->create();
```

This creates one fake user.

Creating five users:

```php
User::factory()->count(5)->create();
```

---

## User Factory Example

```php
public function definition()
{
    return [
        'name' => fake()->name(),
        'email' => fake()->unique()->safeEmail(),
    ];
}
```

---

## Why is it Useful?

- Easy testing.
- Generate fake data quickly.
- Saves time.

---

## Conclusion

Factories help developers create test data automatically.

---

# 5. SOLID Principles

SOLID is a set of five principles that help developers write clean and maintainable code.

---

## S - Single Responsibility Principle (SRP)

A class should have only one responsibility.

### Bad Example

```php
class User
{
    public function save() {}
    public function sendEmail() {}
}
```

### Good Example

```php
class User
{
    public function save() {}
}

class EmailService
{
    public function sendEmail() {}
}
```

---

## O - Open/Closed Principle (OCP)

Classes should be open for extension but closed for modification.

Example:

```php
interface Payment
{
    public function pay();
}

class CashPayment implements Payment
{
    public function pay()
    {
        echo "Cash Payment";
    }
}

class CardPayment implements Payment
{
    public function pay()
    {
        echo "Card Payment";
    }
}
```

Now we can add new payment methods without changing existing code.

---

## L - Liskov Substitution Principle (LSP)

A child class should be able to replace its parent class.

Example:

```php
class Animal
{
    public function speak()
    {
        echo "Animal sound";
    }
}

class Dog extends Animal
{
    public function speak()
    {
        echo "Bark";
    }
}
```

Using the child class should not break the program.

---

## I - Interface Segregation Principle (ISP)

A class should not be forced to implement methods it does not use.

Example:

```php
interface Printer
{
    public function print();
}

interface Scanner
{
    public function scan();
}

class SimplePrinter implements Printer
{
    public function print()
    {
        echo "Printing...";
    }
}
```

The printer only implements what it needs.

---

## D - Dependency Inversion Principle (DIP)

Depend on abstractions, not concrete classes.

Example:

```php
interface PaymentGateway
{
    public function pay();
}

class StripePayment implements PaymentGateway
{
    public function pay()
    {
        echo "Paid using Stripe";
    }
}

class Order
{
    protected $payment;

    public function __construct(PaymentGateway $payment)
    {
        $this->payment = $payment;
    }
}
```

The `Order` class depends on an interface instead of a specific payment class.

---

# Conclusion

The SOLID principles help developers write code that is:

- Clean
- Easy to maintain
- Easy to test
- Easy to extend
- More flexible