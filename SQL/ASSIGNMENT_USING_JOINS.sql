#CREATE DATABASE:
create database joins;

use joins

create table salesman (saleid int primary key ,salename varchar(50) not null,city varchar(20));


create table customer(custid int primary key,custname varchar(50) not null,saleid int references salesman(saleid));

insert into salesman values(5001 ,'james','new york');
insert into salesman values(5002,'nail','paris');
insert into salesman values(5003,'pit','london');


update salesman set saleid="5005" where salename="pit";


insert into salesman values(5006,'mc lyon','paris');
insert into salesman values(5003,'lauson','sanjose');
insert into salesman values(5007,'paul','rome');

select * from salesman;
#+--------+----------+----------+
#| saleid | salename | city     |
#+--------+----------+----------+
#|   5001 | james    | new york |
#|   5002 | nail     | paris    |
#|   5003 | lauson   | sanjose  |
#|   5005 | pit      | london   |
#|   5006 | mc lyon  | paris    |
#|   5007 | paul     | rome     |
#+--------+----------+----------+

select * from customer;
#+--------+-----------+--------+
#| custid | custname  | saleid |
#+--------+-----------+--------+
#|   3001 | brad      |   5005 |
#|   3002 | nick      |   5001 |
#|   3003 | jozy      |   5007 |
#|   3004 | fab       |   5006 |
#|   3005 | graham    |   5002 |
#|   3007 | bradDavid |   5001 |
#|   3008 | julian    |   5002 |
#|   3009 | geoff     |   5003 |
#+--------+-----------+--------+
select c.name,s.name,s.city from customer c right outer join salesman s on s.saleid =c.saleid order by s.saleid;

select c.custname,s.salename,s.city from customer c right outer join salesman s on s.saleid =c.saleid order by s.saleid;
#+-----------+----------+----------+
#| custname  | salename | city     |
#+-----------+----------+----------+
#| bradDavid | james    | new york |
#| nick      | james    | new york |
#| julian    | nail     | paris    |
#| graham    | nail     | paris    |
#| geoff     | lauson   | sanjose  |
#| brad      | pit      | london   |
#| fab       | mc lyon  | paris    |
#| jozy      | paul     | rome     |
#+-----------+----------+----------+
select c.custname,s.salename as salesman from customer c inner join salesman s on c.saleid=s.saleid;
#+-----------+----------+
#| custname  | salesman |
#+-----------+----------+
#| brad      | pit      |
#| nick      | james    |
#| jozy      | paul     |
#| fab       | mc lyon  |
#| graham    | nail     |
#| bradDavid | james    |
#| julian    | nail     |
#| geoff     | lauson   |
#+-----------+----------+



select c.custname,s.salename,s.city from customer c left join salesman s on s.saleid=c.saleid order by c.custid;
#+-----------+----------+----------+
#| custname  | salename | city     |
#+-----------+----------+----------+
#| brad      | pit      | london   |
#| nick      | james    | new york |
#| jozy      | paul     | rome     |
#| fab       | mc lyon  | paris    |
#| graham    | nail     | paris    |
#| bradDavid | james    | new york |
#| julian    | nail     | paris    |
#| geoff     | lauson   | sanjose  |
#+-----------+----------+----------+


select c.custname,s.salename from customer c cross join salesman s on c.saleid=s.saleid;
#+-----------+----------+
#| custname  | salename |
#+-----------+----------+
#| brad      | pit      |
#| nick      | james    |
#| jozy      | paul     |
#| fab       | mc lyon  |
#| graham    | nail     |
#| bradDavid | james    |
#| julian    | nail     |
#| geoff     | lauson   |
#+-----------+----------+
select c.custname,s.salename from customer c cross join salesman s on c.saleid=s.saleid;
#+-----------+----------+
#| custname  | salename |
#+-----------+----------+
#| brad      | pit      |
#| nick      | james    |
#| jozy      | paul     |
#| fab       | mc lyon  |
#| graham    | nail     |
#| bradDavid | james    |
#| julian    | nail     |
#| geoff     | lauson   |
#+-----------+----------+

 desc customer;
#+----------+-------------+------+-----+---------+-------+
#| Field    | Type        | Null | Key | Default | Extra |
#+----------+-------------+------+-----+---------+-------+
#| custid   | int(11)     | NO   | PRI | NULL    |       |
#| custname | varchar(50) | NO   |     | NULL    |       |
#| saleid   | int(11)     | YES  |     | NULL    |       |
#+----------+-------------+------+-----+---------+-------+


desc salesman;
#+----------+-------------+------+-----+---------+-------+
#| Field    | Type        | Null | Key | Default | Extra |
#+----------+-------------+------+-----+---------+-------+
#| saleid   | int(11)     | NO   | PRI | NULL    |       |
#| salename | varchar(50) | NO   |     | NULL    |       |
#| city     | varchar(20) | YES  |     | NULL    |       |
#+----------+-------------+------+-----+---------+-------+


 select c.custname,s.salename from customer c cross join salesman s ;
'''+-----------+----------+
| custname  | salename |
+-----------+----------+
| brad      | james    |
| brad      | nail     |
| brad      | lauson   |
| brad      | pit      |
| brad      | mc lyon  |
| brad      | paul     |
| nick      | james    |
| nick      | nail     |
| nick      | lauson   |
| nick      | pit      |
| nick      | mc lyon  |
| nick      | paul     |
| jozy      | james    |
| jozy      | nail     |
| jozy      | lauson   |
| jozy      | pit      |
| jozy      | mc lyon  |
| jozy      | paul     |
| fab       | james    |
| fab       | nail     |
| fab       | lauson   |
| fab       | pit      |
| fab       | mc lyon  |
| fab       | paul     |
| graham    | james    |
| graham    | nail     |
| graham    | lauson   |
| graham    | pit      |
| graham    | mc lyon  |
| graham    | paul     |
| bradDavid | james    |
| bradDavid | nail     |
| bradDavid | lauson   |
| bradDavid | pit      |
| bradDavid | mc lyon  |
| bradDavid | paul     |
| julian    | james    |
| julian    | nail     |
| julian    | lauson   |
| julian    | pit      |
| julian    | mc lyon  |
| julian    | paul     |
| geoff     | james    |
| geoff     | nail     |
| geoff     | lauson   |
| geoff     | pit      |
| geoff     | mc lyon  |
| geoff     | paul     |
+-----------+----------+'''
