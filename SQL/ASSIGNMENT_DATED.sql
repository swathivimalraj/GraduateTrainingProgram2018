#CREATE DATABASE:
create database student;

#USE DATABASE
use student;

#CREATE STUDENTABLE TABLE:
create table student (s_no int primary key, name varchar(50));

#CREATE MARKS TABLE:
create table marks(m_no int primary key,s_no int references student(s_no),sem varchar(15),eng varchar(3),maths varchar(3),sci varchar(3),lang varchar(3),social varchar(3));

#INSERT DATA INTO STUDENTABLE:
insert into student values(1,'noah');
insert into student values(2,'kevin');
insert into student values(3,'zac');
insert into student values(4,'peter');

#INSERT DATA INTO MARKSABLE:
insert into marks values(1,1,'sem1','90','80','67','87','90');
insert into marks values(2,2,'sem1','81','66','88','87','79');
insert into marks values(3,3,'sem1','50','45','77','44','79');

#DISPLAY TABLE WITH TOTAL AND RESULT:
SELECT s.s_no,s.name,m.maths as MATHS,m.eng as ENGLISH,m.sci as SCIENCE ,m.social as SOCIAL,m.lang as LANG,IF(m.maths>=50 and m.eng>=50 and m.sci>=50 and m.social>=50, 'PASS','FAIL') as Result,
(m.maths + m.eng + m.sci + m.social +m.lang) AS Total FROM student s join marks m on m.s_no=s.s_no where sem="sem1";
#+------+-------+-------+---------+---------+--------+------+--------+-------+
#| s_no | name  | MATHS | ENGLISH | SCIENCE | SOCIAL | LANG | Result | Total |
#+------+-------+-------+---------+---------+--------+------+--------+-------+
#|    1 | noah  | 80    | 90      | 67      | 90     | 87   | PASS   |   414 |
#|    2 | kevin | 66    | 81      | 88      | 79     | 87   | PASS   |   401 |
#|    3 | zac   | 45    | 50      | 77      | 79     | 44   | FAIL   |   295 |
#+------+-------+-------+---------+---------+--------+------+--------+-------+'''


#USING DERIVED TABLE:
select s_no,total,Result from(SELECT s.s_no,s.name,m.maths as MATHS,m.eng as ENGLISH,m.sci as SCIENCE ,m.social as SOCIAL,m.lang as LANG,IF(m.maths>=50 and m.eng>=50 and m.sci>=50 and m.social>=50, 'PASS','FAIL') as Result,(m.maths + m.eng + m.sci + m.social +m.lang) AS Total FROM student s join marks m on m.s_no=s.s_no where sem="sem1")as Result_set;
#+------+-------+--------+
#| s_no | Total | Result |
#+------+-------+--------+
#|    1 |   414 | PASS   |
#|    2 |   401 | PASS   |
#|    3 |   295 | FAIL   |
#+------+-------+--------+

#DISPLAY TABLE FOR PASS CONSTRAIN:
select s_no,total,Result from(SELECT s.s_no,s.name,m.maths as MATHS,m.eng as ENGLISH,m.sci as SCIENCE ,m.social as SOCIAL,m.lang as LANG,IF(m.maths>=50 and m.eng>=50 and m.sci>=50 and m.social>=50, 'PASS','FAIL') as Result,(m.maths + m.eng + m.sci + m.social +m.lang) AS Total FROM student s join marks m on m.s_no=s.s_no where sem="sem1")as Result_set where Result='pass' ;
#+------+-------+--------+
#| s_no | Total | Result |
#+------+-------+--------+
#|    1 |   414 | PASS   |
#|    2 |   401 | PASS   |
#+------+-------+--------+


#SET A VARIABLE NAME:
SET @count=0;


#USE THE VARIABLE IN THE CODE:
select s_no,total,Result,@count:=@count+1 from(SELECT s.s_no,s.name,m.maths as MATHS,m.eng as ENGLISH,m.sci as SCIENCE ,m.social as SOCIAL,m.lang as LANG,IF(m.maths>=50 and m.eng>=50 and m.sci>=50 and m.social>=50, 'PASS','FAIL') as Result,(m.maths + m.eng + m.sci + m.social +m.lang) AS Total FROM student s join marks m on m.s_no=s.s_no where sem="sem1")as Result_set where Result='pass' ;
#+------+-------+--------+------------------+
#| s_no | total | Result | @count:=@count+1 |
#+------+-------+--------+------------------+
#|    1 |   414 | PASS   |                1 |
#|    2 |   401 | PASS   |                2 |
#+------+-------+--------+------------------+


select s_no,total,Result,rank() over (partition by Result_set.result order by Result_set.total desc)
from(SELECT s.s_no,s.name,m.maths as MATHS,m.eng as ENGLISH,m.sci as SCIENCE ,m.social as SOCIAL,
m.lang as LANG,IF(m.maths>=50 and m.eng>=50 and m.sci>=50 and m.social>=50, 'PASS','FAIL') as Result,
(m.maths + m.eng + m.sci + m.social +m.lang) AS Total FROM student s join marks m on m.s_no=s.s_no where sem="sem1")as Result_set where Result='pass' ;
#+------+-------+--------+-----------------------------------------------------------------------------+
#| s_no | Total | Result | rank() over (partition by Result_set.result order by Result_set.total desc) |
#+------+-------+--------+-----------------------------------------------------------------------------+
#|    1 |   414 | PASS   |                                                                           1 |
#|    2 |   401 | PASS   |                                                                           2 |
#+------+-------+--------+-----------------------------------------------------------------------------+


 select s_no,total,Result from(SELECT s.s_no,s.name,m.maths as MATHS,m.eng as ENGLISH,m.sci as SCIENCE,m.social as SOCIAL,m.lang as LANG,IF(m.maths>=50 and m.eng>=50 and m.sci>=50 and m.social>=50, 'PASS','FAIL')
 as Result,(m.maths + m.eng + m.sci + m.social +m.lang) AS Total FROM student s join marks m on m.s_no=s.s_no
 where sem="sem1")as Result_set where Result='pass' ;
#+------+-------+--------+
#| s_no | Total | Result |
#+------+-------+--------+
#|    1 |   414 | PASS   |
#|    2 |   401 | PASS   |
#+------+-------+--------+


select s_no,total,Result,rank() over (partition by Result_set.result order by Result_set.total desc)
    -> from(SELECT s.s_no,s.name,m.maths as MATHS,m.eng as ENGLISH,m.sci as SCIENCE ,m.social as SOCIAL,m.lang as
    -> LANG,IF(m.maths>=50 and m.eng>=50 and m.sci>=50 and m.social>=50, 'PASS','FAIL') as Result,(m.maths + m.eng + m.sci +
    ->  m.social +m.lang)
    -> AS Total FROM student s join marks m on m.s_no=s.s_no where sem="sem1")as Result_set where Result='pass' ;
#+------+-------+--------+-----------------------------------------------------------------------------+
#| s_no | Total | Result | rank() over (partition by Result_set.result order by Result_set.total desc) |
#+------+-------+--------+-----------------------------------------------------------------------------+
#|    1 |   414 | PASS   |                                                                           1 |
#|    2 |   401 | PASS   |                                                                           2 |
#+------+-------+--------+-----------------------------------------------------------------------------+

