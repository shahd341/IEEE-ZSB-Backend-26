# Research Questions

## 1. UNION vs UNION ALL

- The primary difference between `UNION` and `UNION ALL` in SQL is how they handle duplicate rows and their performance. 

### HANDLE DUPLICATE

*UNION*

> combines results from multiple `SELECT` statements and automatically removes duplicate rows, returning only unique records in the final result set.
 
 - combines the results of two queries
 - removes duplicate rows automatically
 - works like it applies `DISTINCT` to the final result 


*UNION ALL* 

> combines all rows from multiple `SELECT` statements, including all duplicates, without any extra processing to remove them. 

- combines the results of two queries
- does not remove dublicates
- returns all rows exactly as they are 

#### so : 

- if the same row appears in both queries->

   . `UNION` shows it once.

   . `UNION ALL` shows it multiple times.
   ---

### PERFORMANCE

`UNION ALL` is faster than `UNION` 
- because `UNION` takes extra time to remove duplicates 

#### so:

*- **The golden rule** is to use `UNION ALL` by default, and only switch to `UNION` when you have a specific, documented business requirement to remove duplicates* 

---

## 2. Subquery vs JOIN

> most subqueries can be rewritten as joins.in real production environment, developers ofen prefer JOIN.

- *Subquery* 

  Subqueries are nested queries (query within a query), used to provide a value or set of values for the outer query.    


- *JOIN* 

  JOIN combines rows from multiple tables based on related columns.  

  #### Why we choose JOIN instead of Subquery
  - Better Performance on large Datasets
  - Optimal index utilization
  - Accessing data from multiple tables
  - Readability and Maintainability
  - Improved Query optimizer support
  - Avoiding Correlated Subquery

  #### so:

  JOIN is usually better than Subquery in production because JOIN is faster , clearer , easier to manage and more scalable 

