 create database problem_set00;

 use problem_set00;

 Create table employee(e_id varchar(10),name varchar(20),dep_id varchar(10),salary int(10),manager_id varchar(10));
#Query OK, 0 rows affected (0.71 sec)

 insert into employee values("A114","MARTIN TREDEAU","D01",54497,"A120");
#Query OK, 1 row affected (0.10 sec)

 insert into employee values("A116","ROBIN WAYNE","D02",20196,"A187");
#Query OK, 1 row affected (0.11 sec)

 insert into employee values("A178","BRUCE WILLS","D03",66861,"A298");
#Query OK, 1 row affected (0.04 sec)


 insert into employee values("A132","PAUL VINCENT","D01",94791,"A120");
#Query OK, 1 row affected (0.06 sec)


 insert into employee values("A198","TOM HANKS","D02",16879,"A187");
#Query OK, 1 row affected (0.06 sec)


insert into employee values("A120","TIM ARCHER","D01",48834,"A298");
#Query OK, 1 row affected (0.05 sec)


 insert into employee values("A143","BRAD MICHAEL","D01",24488,"A120");
#Query OK, 1 row affected (0.06 sec)


 insert into employee values("A187","ADAM NJUSTIN","D02",80543,"A298");
#Query OK, 1 row affected (0.06 sec)


 insert into employee values("A121","STUART WILLIAM","D02",78629,"A187");
#Query OK, 1 row affected (0.10 sec)


insert into employee values("A187","ROBERT SWIFT","D04",27700,"A298");
#Query OK, 1 row affected (0.06 sec)


insert into employee values("A176","EDWARD CANE","D01",898176,"A120");
#Query OK, 1 row affected (0.18 sec)


insert into employee values("A142","TARA CUMMINGS","D04",99475,"A187");


insert into employee values("A130","VANESSA PARY","D04",28565,"A187");

insert into employee values("A128","ADAM WAYNE","D05",94324,"A165");


 insert into employee values("A129","JOSEPH ANGELIN","D05",44280,"A165");


 insert into employee values("A165","NATASHA STEVENS","D05",31377,"A298");


 insert into employee values("A111","JOHN HELLEN","D01",15380,"A120");


insert into employee values("A194","HAROLLD STEVENS","D02",32166,"A187");


 insert into employee values("A133","STEVE MICHELOS","D02",61215,"A187");


insert into employee values("A156","NICK MARTIN","D03",50174,"A178");


create table dept(dep_id varchar(4),depname varchar(19),depmanager varchar(20));

insert into dept values("d01","health","tim archer");


 insert into dept values("d02","communication","adam justin");

 insert into dept values("d03","product","bruce wills");


insert into dept values("d01","insurance","robert swift");
#Query OK, 1 row affected (0.03 sec)

 insert into dept values("d01","finance","natasha stefens");
#Query OK, 1 row affected (0.08 sec)


#1.Select the Employee with the top three salaries
 select name, salary from employee order by salary desc limit 1;
#+-------------+--------+
#| name        | salary |
#+-------------+--------+
#| EDWARD CANE | 898176 |
#+-------------+--------+

#2.Select the Employee with the least salary
select name,salary from employee order by salary limit 1;
#+-------------+--------+
#| name        | salary |
#+-------------+--------+
#| JOHN HELLEN |  15380 |
#+-------------+--------+
#3.Select the Employee who does not have a manager in the department table
select name as DEPTMANAGER from employee where managerid not in (select E_Id from Employee e inner join Dept d where e.Dep_id = d.Dep_id);
#+-----------------+
#| DEPTMANAGER     |
#+-----------------+
#| BRUCE WILLS     |
#| TIM ARCHER      |
#| ADAM JUSTIN     |
#| ROBERT SWIFT    |
#| NATASHA STEVENS |
#| ADAM JUSTIN     |
#+-----------------+
#4.Select the Employee who is also a Manager
select e.name from employee e join employee e1 on e.e_id=e1.manager_id group by name;
#+-----------------+
#| name            |
#+-----------------+
#| TIM ARCHER      |
#| ADAM NJUSTIN    |
#| ROBERT SWIFT    |
#| NATASHA STEVENS |
#| BRUCE WILLS     |
#+-----------------+
#5.Select the Empolyee who is a Manager and has least salary
select e.name,min(e.salary) from employee e join employee e1 on e.e_id=e1.manager_id group by e.salary order by e.salary limit 1;
#+--------------+---------------+
#| name         | min(e.salary) |
#+--------------+---------------+
#| ROBERT SWIFT |         27700 |
#+--------------+---------------+
#6.Select the total number of Employees in Communications departments
 select count(*) as total from employee e join dept d on e.dep_id=d.dep_id where d.depname='communication';
#+----------+
#| count(*) |
#+----------+
#|        6 |
#+----------+
#7.Select the Employee in Finance Department who has the top salary
select e.name as Employee_name from employee e join dept d on e.dep_id=d.dep_id where d.depname='FINANCE' order by e.salary desc limit 1;
#+---------------+
#| Employee_name |
#+---------------+
#| ADAM WAYNE    |
#+---------------+
#8.Select the Employee in product depatment who has the least salary
 select e.name as Employee_name from employee e join dept d on e.dep_id=d.dep_id where d.depname='product' order by e.salary  limit 1;
#+---------------+
#| Employee_name |
#+---------------+
#| NICK MARTIN   |
#+---------------+
#9.Select the count of Empolyees in Health with maximum salary
select count(*) as COUNT from employee e join dept d on e.dep_id=d.dep_id where d.depname='health' group by salary order by e.salary  limit 1;
#+-------+
#| COUNT |
#+-------+
#|     1 |
#+-------+
#10.Select the Employees who report to Natasha Stevens
 select * from employee e join dept d on e.dep_id=d.dep_id where depmanager="natasha stevens" and name not in ("natasha stevens");
#+------+----------------+--------+--------+-----------+--------+---------+-----------------+
#| e_id | name           | dep_id | salary | managerid | dep_id | depname | depmanager      |
#+------+----------------+--------+--------+-----------+--------+---------+-----------------+
#| A128 | ADAM WAYNE     | D05    |  94324 | A165      | D05    | FINANCE | NATASHA STEVENS |
#| A129 | JOSEPH ANGELIN | D05    |  44280 | A165      | D05    | FINANCE | NATASHA STEVENS |
#+------+----------------+--------+--------+-----------+--------+---------+-----------------+
#11.
 select e.name,count(e.name),d.depname,d.depmanager from employee e join dept d on e.dep_id=d.dep_id where d.depname='health'group by e.e_id;
#+----------------+---------------+---------+------------+
#| name           | count(e.name) | depname | depmanager |
#+----------------+---------------+---------+------------+
#| JOHN HELLEN    |             1 | HEALTH  | TIM ARCHER |
#| MARTIN TREDEAU |             1 | HEALTH  | TIM ARCHER |
#| TIM ARCHER     |             1 | HEALTH  | TIM ARCHER |
#| PAUL VINCENT   |             1 | HEALTH  | TIM ARCHER |
#| BRAD MICHAEL   |             1 | HEALTH  | TIM ARCHER |
#| EDWARD CANE    |             1 | HEALTH  | TIM ARCHER |
#+----------------+---------------+---------+------------+
#12.
select d.dep_id,e.e_id,e.managerid from employee e join dept d on e.dep_id=d.dep_id where d.depname='COMMUNICATIONS';
#+--------+------+-----------+
#| dep_id | e_id | managerid |
#+--------+------+-----------+
#| D02    | A116 | A187      |
#| D02    | A198 | A187      |
#| D02    | A187 | A298      |
#| D02    | A121 | A187      |
#| D02    | A194 | A187      |
#| D02    | A133 | A187      |
#| D02    | A187 | A298      |
#+--------+------+-----------+
#13.
select avg(e.salary),d.dep_id,d.depname from employee e join dept d on e.dep_id=d.dep_id group by (d.dep_id);
#+---------------+--------+----------------+
#| avg(e.salary) | dep_id | depname        |
#+---------------+--------+----------------+
#|    54527.6667 | D01    | HEALTH         |
#|    52881.5714 | D02    | COMMUNICATIONS |
#|    58517.5000 | D03    | PRODUCT        |
#|    51913.3333 | D04    | INSURANCE      |
#|    56660.3333 | D05    | FINANCE        |
#+---------------+--------+----------------+
#14.
select sum(e.salary) as TOTAL,d.depname as DEPARTMENT from employee e join dept d on e.dep_id=d.dep_id where depname='FINANCE' group by d.depname;
#+--------+------------+
#| TOTAL  | DEPARTMENT |
#+--------+------------+
#| 169981 | FINANCE    |
#+--------+------------+
#15.
select d.depname,min(e.salary) from employee e join dept d on e.dep_id=d.dep_id group by d.dep_id;
#+----------------+---------------+
#| depname        | min(e.salary) |
#+---------------+---------------+
#| HEALTH         |         15380 |
#| COMMUNICATIONS |         16879 |
#| PRODUCT        |         50174 |
#| INSURANCE      |         27700 |
#| FINANCE        |         31377 |
#+----------------+---------------+
select d.depname,min(e.salary) from employee e join dept d on e.dep_id=d.dep_id group by d.dep_id limit 1;
#+---------+---------------+
#| depname | min(e.salary) |
#+---------+---------------+
#| HEALTH  |         15380 |
#+---------+---------------+
select d.depname,d.depmanager,min(e.salary) from employee e join dept d on e.dep_id=d.dep_id group by d.dep_id limit 1;
#+---------+------------+---------------+
#| depname | depmanager | min(e.salary) |
#+---------+------------+---------------+
#| HEALTH  | TIM ARCHER |         15380 |
#+---------+------------+---------------+
#16.
select d.depname,count(e.name)from employee e join dept d on e.dep_id=d.dep_id group by e.dep_id;
#+----------------+---------------+
#| depname        | count(e.name) |
#+----------------+---------------+
#| HEALTH         |             6 |
#| COMMUNICATIONS |             6 |
#| PRODUCT        |             2 |
#| INSURANCE      |             3 |
#| FINANCE        |             3 |
#+----------------+---------------+
#17.
select name,dep_id,count(*) from Employee where salary<10000 group by dep_id;
#Empty set (0.00 sec)
#18.
 select count(*),dep_id as DEPARTMENT_ID from employee where dep_id='D04' group by dep_id;
#+-----------------+---------------+
#| TOTAL_NO_OF_EMP | DEPARTMENT_ID |
#+-----------------+---------------+
#|               3 | D04           |
#+-----------------+---------------+
#19.
select max(e.e_id),count(*),d.depname from employee e join dept d on e.dep_id=d.dep_id group by e.dep_id;
#+-------------+----------+----------------+
#| max(e.e_id) | count(*) | depname        |
#+-------------+----------+----------------+
#| A176        |        6 | HEALTH         |
#| A198        |        6 | COMMUNICATIONS |
#| A178        |        2 | PRODUCT        |
#| A187        |        3 | INSURANCE      |
#| A165        |        3 | FINANCE        |
#+-------------+----------+----------------+
#20.
select e.name from employee e join dept d on e.dep_id=d.dep_id and d.depmanager="tim archer";
#+----------------+
#| name           |
#+----------------+
#| MARTIN TREDEAU |
#| PAUL VINCENT   |
#| TIM ARCHER     |
#| BRAD MICHAEL   |
#| EDWARD CANE    |
#| JOHN HELLEN    |
#+----------------+
#(JUNK)
 select max(e.e_id),count(*),d.depname from employee e join dept d on e.dep_id=d.dep_id group by e.dep_id limit 2;
#+-------------+----------+----------------+
#| max(e.e_id) | count(*) | depname        |
#+-------------+----------+----------------+
#| A176        |        6 | HEALTH         |
#| A198        |        6 | COMMUNICATIONS |
#+-------------+----------+----------------+
#select max(e.e_id),max(count(*)) as COUNT,d.depname from employee e join dept d on e.dep_id=d.dep_id group by e.dep_id;
 select max(count),count,if(count=max(count),depname,'NO RECORDS FOUND') from(select max(e.e_id),count(*) as COUNT,d.depname from employee e join dept d on e.dep_id=d.dep_id group by e.dep_id)as re;
#+------------+-------+------------------------------------------+
#| max(count) | count | if(count=max(count),depname,'norecords') |
#+------------+-------+------------------------------------------+
#|          6 |     6 | HEALTH                                   |
#+------------+-------+------------------------------------------+
 select max(count)as count from(select max(e.e_id),count(*) as COUNT,d.depname from employee e join dept d on e.dep_id=d.dep_id group by e.dep_id)as re;
#+-------+
#| count |
#+-------+
#|     6 |
#+-------+
select res.dep_id,res.depname,r.count1 from(select max(count)as count1 from(select max(e.e_id),e.dep_id,count(*) as COUNT,d.depname from employee e join dept d on e.dep_id=d.dep_id group by e.dep_id)as re)as r join(select e.dep_id,count(*) as COUNT,d.depname from employee e join dept d on e.dep_id=d.dep_id group by e.dep_id)as res where r.count1 = res.count;
#+--------+----------------+--------+
#| dep_id | depname        | count1 |
#+--------+----------------+--------+
#| D01    | HEALTH         |      6 |
#| D02    | COMMUNICATIONS |      6 |
#+--------+----------------+--------+




















































































