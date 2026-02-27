--182. Duplicate Emails
select email as "Email"
from Person
group by email 
having count(email) > 1  ;

----
196. Delete Duplicate Emails
delete p1
from person p1 
join person p2
on p1.email = p2.email
where p1.id > p2.id;

----------
177. Nth Highest Salary
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      select DISTINCT salary
      from Employee
      order by salary desc
      LIMIT 1 OFFSET N-1
  );
END

--------------
178. Rank Scores
select score, DENSE_RANK() OVER (order by score desc) as 'rank'
from Scores
order by score desc;

---------
184. Department Highest Salary
select
    d.name as 'Department',
    x.name as 'Employee',
    x.salary as 'Salary'
from (
        select *, DENSE_RANK() OVER (PARTITION BY departmentId order by salary desc ) as rn
        from Employee
    ) x
    join Department d on
    x.departmentId = d.id
where x.rn= 1;