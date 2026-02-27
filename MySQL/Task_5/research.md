# Research Questions

## Window Functions vs GROUP BY: 
● Both GROUP BY and window functions perform aggregations. 
### What is the fundamental difference regarding the "granularity" (level of detail) in the output?
- The fundamental difference regarding "granularity" is that *GROUP BY* reduces the granularity by collapsing multiple rows into a single summary row, while *window functions* preserve the original granularity by retaining all individual rows while adding aggregated data.

`GROUP BY` 
1. reduces the number of rows.
2. It groups rows together and returns one row per group

`Window Functions`
1. don't reduce rows
2. They keep the original rows and just add a new calculated column
---

## Clustered vs Non-Clustered Indexes: 
### Explain the difference between the Leaf Nodes of a Clustered Index's B-Tree versus a Non-Clustered Index. 
 - Clustered index leaf nodes contain the actual, sorted data rows, whereas non-clustered index leaf nodes hold only the index key values and a pointer to the acual data rows.

### Why are you only allowed to have exactly one clustered index per table?
- Only one clustered index is allowed per table because it defines the single, physical, sequential order of the data on the disk.
- A table can only be physically sorted in one way, so it can have only one clustered index

#### so:
*Clustered* Index leaf nodes = real data pages.

*Non-Clustered* Index leaf nodes = pointers to data
 
 ---

## Filtered & Unique Indexes: 

### ● What is a "Filtered Index" and why is it useful? (Mention the impact on storage and query performance). 
- A filtered index is a optimized, nonclustered index applied to a subset of table rows using a `WHERE` clause, significantly reducing storage space and lowering maintenance costs. By indexing only relevant data, it enhances query performance, improves statistics accuracy, and reduces I/O.

- It uses less storage because it indexes only some rows.
- It improves query performance when queries filter using the same condition.
- It reduces maintenance cost compared to a full index.

### ● If you put a "Unique Index" on an Email column, how does it physically slow down INSERT statements while speeding up SELECT statements ? 
- A unique index on an email column speeds up `SELECT` statements by enabling fast lookups, but slows down `INSERT`s because the database must first scan the index to ensure the new email doesn't already exist, adding structural overhead.

. During `INSERT`, the database must check if the email already exists.
This extra checking makes `INSERT` slightly slower.
. During `SELECT`, searching by email becomes much faster
because the database can quickly find the exact row using the index.

----

## Choosing the Right Index: 
● You have a temporary "Staging Table" where you insert millions of rows very quickly, read them once, and then delete them.
### should you use a Clustered Index, a Non-Clustered Index, or a Heap Structure? Why?
we should use Heap
### Why ?
- Heaps allow very fast INSERT operations.
- No need to maintain index structure.
- Since the data is read only once and then deleted, indexing is not worth the extra cost.
 So, for heavy inserts and short life data --> Heap is better.

 ---

## Database Transactions (ACID): 
### ● Explain the "All or Nothing" concept (Atomicity).

All or Nothing (Atomicity) means:

- A transaction must complete fully or not happen at all.
If one part fails, the whole transaction is rolled back.


### What disastrous scenario happens if a partial failure occurs without using a Transaction?
- If a transaction is not used, a partial failure leads to a corrupt or inconsistent database state.