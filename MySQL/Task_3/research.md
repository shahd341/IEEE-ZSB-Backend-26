# Research Questions

## 1. WHERE vs HAVING 

both are used to filter data , but they are used in different places in a query 

**WHERE**

1. filters rows before groubing
2. cannot be used with aggregate functions like (`SUM` ,`MIN` ,`MAX`,...)

*EXAMPLE*
```SQL
select *
from employee
where salary > 8000
```

**HAVING**

1. filters groups after `Group by` and aggregate functions (`COUNT` , `AVG`, ...)
2. used with aggregate functions

**EXAMPLE**
```SQL
select city , count(*)
from users
group by city
having count(*) >100
```
---

## 2. DELET vs TRUNCATE vs DROP
These SQL commands used to remove data , but in different ways .

*DELET*
1. `delet` is a DML command used to remove specific rows
2. can use `where`
3. can be rolled back 

*TRUNCATE*
1. `TRUNCATE` is a DDL command userd to remove all rows from a table but keep the table structure intac 
2. Faster than delete 
3. cannot used `where`
4. usually cannot be rolled back

*DROP*
1. `DROP1 ia a DDL command that quickly removes the whole table
2. remove data + structure 
3. table is gone completely
4. cannot be rolled back

---

## 3. Order of Excution (`SELECT` , `FROM` , `WHERE` , `GROUP BY` , `HAVING` , `ORDER BY`)
The standard logical execution order is :
1. `from` : identify the table 
2. `where` : filtre rows
3. `group by` : group the remaining rows
4. `having` : filter the groups
5. `select` : choose columns to return it
6. `order by` : sort the result

---

## 4. COUNT(*) vs COUNT(COULMN_NAME)
1. `COUNT(*)` : counts all rows in the result set, regardless of whether they contain `NULL` or duplicate values. it counts the total number of records.
2. `COUNT(COLUMN_NAME)` : counts only the rows where the specified `COLUMN_NAME` is **NOT NULL** . it ignores `NULL` values in that specific column .

---

## 5. CHAR vs VARCHAR 
both store text , but they manage storage space differently.
### `CHAR(10)` : 
1. fixed lenght
2. stores exactly 10 characters 
3. if the word is shorter, it adds spaces 

*EXAMPLE* 
"Cat       " -> 7 spaces added to make it 10


### `VARCHAR` :
1. variable length
2. stores only the actual number of characters   

*EXAMPLE*
"Cat"