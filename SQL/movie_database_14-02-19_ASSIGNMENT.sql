create database movie;

 use movie;
#Database changed
 create table mov(mid int PRIMARY KEY,m_title varchar(10),m_lan varchar(10),S_date date,E_date date,certification varchar(10));

 create table screen1 (s_id varchar(10) PRIMARY KEY,sname varchar(10),mid int,s_type varchar(10),s_time time,price int,FOREIGN KEY(mid) REFERENCES mov(mid));


create table cust
		(
		c_id varchar(5) PRIMARY KEY,
		name varchar(10),
        age int
         );


create table book
       (
	   b_id varchar(10) PRIMARY KEY,
	   mid int,
	   s_id varchar(10),
	   c_id varchar(10),
       no_seats int,
	   show_date date,
	   FOREIGN KEY(mid) REFERENCES mov(mid),
       FOREIGN KEY(s_id) REFERENCES screen1(s_id),
       FOREIGN KEY(c_id) REFERENCES cust(c_id)
      );



insert into cust values('c1','aaa',24);
insert into cust values('c2','bbb',27);
insert into cust values('c3','ccc',29);
insert into cust values('c4','ddd',31);
insert into cust values('c5','eee',17);
insert into cust values('c6','fff',47);

insert into mov values(105,'URI','Hindi','2019-01-14','2019-02-18','U/A');
insert into mov values(106,'Dev','Tamil','2019-01-14','2019-02-18','U');
insert into mov values(107,'2.0','Tamil','2019-02-01','2019-02-18','U/A');
insert into mov values(108,'Dev','Telugu','2019-02-26','2019-02-18','U');

insert into screen1 values('s1','Blush',105,'Lounge','14:30:00',180);
insert into screen1 values('s2','Weave',105,'E','14:45:00',220);
insert into screen1 values('s3','spot',106,'Lounge','19:30:00',180);
insert into screen1 values('s4','Blush',107,'Lounge','21:00:00',180);
insert into screen1 values('s5','Blush',108,'E','19:30:00',220);

insert into book values('b1',105,'s1','c1',2,'2019-02-14');
insert into book values('b2',106,'s3','c2',2,'2019-02-15');
insert into book values('b3',107,'s4','c2',3,'2019-02-15');
insert into book values('b4',105,'s2','c3',4,'2019-02-14');
insert into book values('b5',105,'s5','c6',3,'2019-02-14');


show tables;
#+-----------------+
#| Tables_in_movie |
#+-----------------+
#| book            |
#| cust            |
#| mov             |
#| screen1         |
#+-----------------+

select * from book;
#+------+------+------+------+----------+------------+
#| b_id | mid  | s_id | c_id | no_seats | show_date  |
#+------+------+------+------+----------+------------+
#| b1   |  105 | s1   | c1   |        2 | 2019-02-14 |
#| b2   |  106 | s3   | c2   |        2 | 2019-02-15 |
#| b3   |  107 | s4   | c2   |        3 | 2019-02-15 |
#| b4   |  105 | s2   | c3   |        4 | 2019-02-14 |
#| b5   |  105 | s5   | c6   |        3 | 2019-02-14 |
#+------+------+------+------+----------+------------+

select * from cust;
#+------+------+------+
#| c_id | name | age  |
#+------+------+------+
#| c1   | aaa  |   24 |
#| c2   | bbb  |   27 |
#| c3   | ccc  |   29 |
#| c4   | ddd  |   31 |
#| c5   | eee  |   17 |
#| c6   | fff  |   47 |
#+------+------+------+

select * from mov;
#+-----+---------+--------+------------+------------+---------------+
#| mid | m_title | m_lan  | S_date     | E_date     | certification |
#+-----+---------+--------+------------+------------+---------------+
#| 105 | URI     | Hindi  | 2019-01-14 | 2019-02-18 | U/A           |
#| 106 | Dev     | Tamil  | 2019-01-14 | 2019-02-18 | U             |
#| 107 | 2.0     | Tamil  | 2019-02-01 | 2019-02-18 | U/A           |
#| 108 | Dev     | Telugu | 2019-02-26 | 2019-02-18 | U             |
#+-----+---------+--------+------------+------------+---------------+

select * from screen1;
#+------+-------+------+--------+----------+-------+
#| s_id | sname | mid  | s_type | s_time   | price |
#+------+-------+------+--------+----------+-------+
#| s1   | Blush |  105 | Lounge | 14:30:00 |   180 |
#| s2   | Weave |  105 | E      | 14:45:00 |   220 |
#| s3   | spot  |  106 | Lounge | 19:30:00 |   180 |
#| s4   | Blush |  107 | Lounge | 21:00:00 |   180 |
#| s5   | Blush |  108 | E      | 19:30:00 |   220 |
#+------+-------+------+--------+----------+-------+

select *,(price*no_seats)as amount from book b left join screen1 s on b.mid=s.mid;
#+------+------+------+------+----------+------------+------+-------+------+--------+----------+-------+--------+
#| b_id | mid  | s_id | c_id | no_seats | show_date  | s_id | sname | mid  | s_type | s_time   | price | amount |
#+------+------+------+------+----------+------------+------+-------+------+--------+----------+-------+--------+
#| b1   |  105 | s1   | c1   |        2 | 2019-02-14 | s1   | Blush |  105 | Lounge | 14:30:00 |   180 |    360 |
#| b1   |  105 | s1   | c1   |        2 | 2019-02-14 | s2   | Weave |  105 | E      | 14:45:00 |   220 |    440 |
#| b2   |  106 | s3   | c2   |        2 | 2019-02-15 | s3   | spot  |  106 | Lounge | 19:30:00 |   180 |    360 |
#| b3   |  107 | s4   | c2   |        3 | 2019-02-15 | s4   | Blush |  107 | Lounge | 21:00:00 |   180 |    540 |
#| b4   |  105 | s2   | c3   |        4 | 2019-02-14 | s1   | Blush |  105 | Lounge | 14:30:00 |   180 |    720 |
#| b4   |  105 | s2   | c3   |        4 | 2019-02-14 | s2   | Weave |  105 | E      | 14:45:00 |   220 |    880 |
#| b5   |  105 | s5   | c6   |        3 | 2019-02-14 | s1   | Blush |  105 | Lounge | 14:30:00 |   180 |    540 |
#| b5   |  105 | s5   | c6   |        3 | 2019-02-14 | s2   | Weave |  105 | E      | 14:45:00 |   220 |    660 |
#+------+------+------+------+----------+------------+------+-------+------+--------+----------+-------+--------+

 select b.*,(price*no_seats)as amount from book b left join screen1 s on b.mid=s.mid;
#+------+------+------+------+----------+------------+--------+
#| b_id | mid  | s_id | c_id | no_seats | show_date  | amount |
#+------+------+------+------+----------+------------+--------+
#| b1   |  105 | s1   | c1   |        2 | 2019-02-14 |    360 |
#| b1   |  105 | s1   | c1   |        2 | 2019-02-14 |    440 |
#| b2   |  106 | s3   | c2   |        2 | 2019-02-15 |    360 |
#| b3   |  107 | s4   | c2   |        3 | 2019-02-15 |    540 |
#| b4   |  105 | s2   | c3   |        4 | 2019-02-14 |    720 |
#| b4   |  105 | s2   | c3   |        4 | 2019-02-14 |    880 |
#| b5   |  105 | s5   | c6   |        3 | 2019-02-14 |    540 |
#| b5   |  105 | s5   | c6   |        3 | 2019-02-14 |    660 |
#+------+------+------+------+----------+------------+--------+

select max(amount) from(select b.*,(price*no_seats)as amount from book b left join screen1 s on b.mid=s.mid)as r;
#+-------------+
#| max(amount) |
#+-------------+
#|         880 |
#+-------------+

select sum(amount) as cost from(select b.*,(price*no_seats)as amount from book b left join screen1 s on b.mid=s.mid)as r group by mid;
#+------+
#| cost |
#+------+
#| 3600 |
#|  360 |
#|  540 |
#+------+

select sum(amount),mid as cost from(select b.*,(price*no_seats)as amount from book b left join screen1 s on b.mid=s.mid)as r group by mid;
#+-------------+------+
#| sum(amount) | cost |
#+-------------+------+
#|        3600 |  105 |
#|         360 |  106 |
#|         540 |  107 |
#+-------------+------+

select sum(amount) as cost,mid from(select b.*,(price*no_seats)as amount from book b left join screen1 s on b.mid=s.mid)as r group by mid;
#+------+------+
#| cost | mid  |
#+------+------+
#| 3600 |  105 |
#|  360 |  106 |
#|  540 |  107 |
#+------+------+

select max(cost),mid from (select sum(amount) as cost,mid from(select b.*,(price*no_seats)as amount from book b left join screen1 s on b.mid=s.mid)as r group by mid)as d group by mid;
#+-----------+------+
#| max(cost) | mid  |
#+-----------+------+
#|      3600 |  105 |
#|       360 |  106 |
#|       540 |  107 |
#+-----------+------+

select max(cost),mid from (select sum(amount) as cost,mid from(select b.*,(price*no_seats)as amount from book b left join screen1 s on b.mid=s.mid)as r group by mid)as d;
#+-----------+------+
#| max(cost) | mid  |
#+-----------+------+
#|      3600 |  105 |
#+-----------+------+

select m.*,c, id from mov m join (select max(cost) as c ,mid as id from (select sum(amount) as cost,mid from(select b.*,(price*no_seats)as amount from book b left join screen1 s on b.mid=s.mid)as r group by mid)as d)as d1;
#+-----+---------+--------+------------+------------+---------------+------+------+
#| mid | m_title | m_lan  | S_date     | E_date     | certification | c    | id   |
#+-----+---------+--------+------------+------------+---------------+------+------+
#| 105 | URI     | Hindi  | 2019-01-14 | 2019-02-18 | U/A           | 3600 |  105 |
#| 106 | Dev     | Tamil  | 2019-01-14 | 2019-02-18 | U             | 3600 |  105 |
#| 107 | 2.0     | Tamil  | 2019-02-01 | 2019-02-18 | U/A           | 3600 |  105 |
#| 108 | Dev     | Telugu | 2019-02-26 | 2019-02-18 | U             | 3600 |  105 |
#+-----+---------+--------+------------+------------+---------------+------+------+

select m.*,c, id from mov m join (select max(cost) as c ,mid as id from (select sum(amount) as cost,mid from(select b.*,(price*no_seats)as amount from book b left join screen1 s on b.mid=s.mid)as r group by mid)as d)as d1 group by id ;
#+-----+---------+-------+------------+------------+---------------+------+------+
#| mid | m_title | m_lan | S_date     | E_date     | certification | c    | id   |
#+-----+---------+-------+------------+------------+---------------+------+------+
#| 105 | URI     | Hindi | 2019-01-14 | 2019-02-18 | U/A           | 3600 |  105 |
#+-----+---------+-------+------------+------------+---------------+------+------+

select m.m_title,c, id from mov m join (select max(cost) as c ,mid as id from (select sum(amount) as cost,mid from(select b.*,(price*no_seats)as amount from book b left join screen1 s on b.mid=s.mid)as r group by mid)as d)as d1 group by id ;
#+---------+------+------+
#| m_title | c    | id   |
#+---------+------+------+
#| URI     | 3600 |  105 |
#+---------+------+------+

select m.m_title,c, id from mov m join (select max(cost) as c ,mid as id from (select sum(amount) as cost,mid from(select b.*,(price*no_seats)as amount from book b join screen1 s on b.mid=s.mid)as r group by mid)as d)as d1 group by id ;
#+---------+------+------+
#| m_title | c    | id   |
#+---------+------+------+
#| URI     | 3600 |  105 |
#+---------+------+------+


select sum(amount) as cost,mid from(select b.*,(price*no_seats)as amount from book b join screen1 s on b.mid=s.mid)as t;
#+------+------+
#| cost | mid  |
#+------+------+
#| 4500 |  105 |
#+------+------+

select m.m_title,c, id from mov m join (select max(cost) as c ,mid as id from (select sum(amount) as cost,mid from(select b.*,(price*no_seats)as amount from book b join screen1 s on b.mid=s.mid)as r group by mid)as d)as d1 group by id ;
#+---------+------+------+
#| m_title | c    | id   |
#+---------+------+------+
#| URI     | 3600 |  105 |
#+---------+------+------+

select m.m_title,c, id from mov m join (select max(cost) as c ,mid as id from (select sum(amount) as cost,mid from(select b.*,(price*no_seats)as amount from book b join screen1 s on b.s_id=s.s_id)as r group by mid)as d)as d1 group by id ;
#+---------+------+------+
#| m_title | c    | id   |
#+---------+------+------+
#| URI     | 1900 |  105 |
#+---------+------+------+