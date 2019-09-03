# SQL JOINS

- [SQL Joins](http://www.sql-join.com)

## Relational Data

SQL is a Relational Database. That means its a database structured to recognize relations among stored items of information. We so far have only used one table, but in SQL, we will almost always have multiple tables that have relationships with each other.

### Database Normalization

Normalization is the process of breaking down and organizing database tables that describe the relationships between them. We do this so that when we make changes it doesn't have to be painful! More information can be found [here](https://www.essentialsql.com/get-ready-to-learn-sql-database-normalization-explained-in-simple-english/) and [here](https://blog.udemy.com/normalization-in-database-with-example/).

## Relationships

In order to normalize your database, you have to think about the relationships between different data in your database.

What's the relationship between a person and a SSN? A person can only have one SSN, and a SSN is owned by one person. This is  an example of ONE-TO-ONE. 

**Other examples:**
- Countries and Capital Cities
- Employee and Emergency Contact


## One-to-Many

What's the relationship between Owners and Pets? 
An owner can have many Pets, a pet can have only 1 owner. This is an example of ONE-TO-MANY. 

**Other examples:**
- Students and cohorts.
- Person and Season Tickets
- Owner and Pets


### Counting

SQL has some built in functionality, as well! Let's explore `count`;


```SQL
-- Count all students
SELECT count(*) FROM "students";

-- Count all students in a cohort
SELECT count(*) FROM "students"
JOIN "cohorts" ON "cohorts"."id"="students"."cohort_id"
WHERE "cohorts"."name" = 'Rigel';
```

Theres also a `SUM()` aggregate function -- it adds the selected fields together.

### Group By

When counting, sometimes we need to do more than count by itself. Say we want the names of the cohort and how many people are in each one. In order to handle the potential counting craziness, we need to tell SQL how to group our data together before it counts. 


```SQL

-- Count all students in a cohort grouped by cohort name
SELECT "cohorts"."name", count(*) FROM "students"
JOIN "cohorts" ON "cohorts"."id"="students"."cohort_id"
GROUP BY "cohorts"."name";

```

### Sorting

We can control the order of the results by adding ORDER BY and ASC or DESC. This will keep your results in a specific sorting order.

```SQL
-- Count all students in a cohort
SELECT * FROM "students"
JOIN "cohorts" ON "cohorts"."id"="students"."cohort_id"
WHERE "cohorts"."name" = 'Rigel'
ORDER BY "students"."name" DESC;
```