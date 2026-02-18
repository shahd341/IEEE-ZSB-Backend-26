
# The Normalization Challenge 
*Normalization*:`the process of decomposing unsatisfactory relation by breaking up their attributes into smaller relations.`
  
Our Task is to take this single table to 3NF
Student_Grade_Report (Student_Name, 
Student_Phone, Student_Address, Course_Title, 
Instructor_Name, Instructor_Dept, Dept_Building, Grade)
Pk(Student_Name and Course_Title)


## STEP 1 :
To reach First Normal Form (`1NF`) -> Each cell contains only one value
we should remove 
1. multivalued attributes
2. composite attributes 
3. Repeating group 
In our Task , we find Student_Phone is multivalued attribute and Student_Addresd is composite attribute (city,street,zip)
So 
The `1NF` is 
( Student_Name , City , Street , Zip , Course_Title , Instructor_Name , Instructor_Dept , Dept_Building , Grade ) 
( Student_Name , Student_Phone )

---

## STEP 2 :
To reach Second Normal Form ->
1. it is already in `1NF`
2. No partial dependency -> every non-key column must depend on the whole primary key

**Partial Dependency** happen when The primary key is composite and we find A non-key column depends on only part of the primary key not on the whole primary key.

The Student_Address depend on Student_Name only

So
The `2NF` is ->
( Student_Name , City , Street , Zip )
( Student_Name , Student_Phone )
(Course_Title , Instructor_Name , Instructor_Dept , Dept_Building ) 
(Student_Name,Course_Title, Grade) 

---

## STEP 3 :
To reach Third Normal Form (`3NF`) -> 
1- It is already in `2NF`
2- No transitive dependency -> non-key columns should not depend on other non-key columns

**Transitive dependency**: Non-key columns depend on other non-key columns

Dept_Building depends on 
Instructor_Dept, not on the Student or the Course.
So
The `3NF` is
( Student_Name , City , Street , Zip )
( Student_Name , Student_Phone )
(Instructor_Dept , Dept_Building)
(Course_Title , Instructor_Name , Instructor_Dept  )
(Student_Name,Course_Title, Grade)