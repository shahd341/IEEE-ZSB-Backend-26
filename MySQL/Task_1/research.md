1 What is the difference between a DBMS and an RDBMS?
    DBMS :Database Management System --> a general system to store , manage and retrieve data

    RDBMS :Relational DBMS -->is a more advanced type of DBMS that organises data into related tables  



2 What is the difference between DDL and DML?
   DDL --> Data Definition Language is used to define or change the structure of the database
     such as -> create , drop , alter , truncate
     example -> drop table student;
 
  DML --> Data Manipulation Language is used to manipulate the data stored in database tables
    such as ->insert , update , delete 
    example -> insert into instructors (id , name) values (123 , "Ahmed Ali");



3 Why is Normalization important for a large system like a university database?
    because normalization provid the system with (reduces duplication - avoid update,insert and delete anomailes- prevents inconsistent or wronge data-easier to maintain and grow )so the system becomes faster and cleaner 