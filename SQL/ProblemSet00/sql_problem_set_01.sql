#1.List full details of all hotels.
 select *  from hotel;
+----------+-----------------+----------+
| Hotel_No | Name            | City     |
+----------+-----------------+----------+
| H111     | Empire Hotel    | New York |
| H193     | Devon Hotel     | Boston   |
| H235     | Park Place      | New York |
| H432     | Brownstone      | Toronto  |
| H437     | Clairmont Hotel | Boston   |
| H498     | James Plaza     | Toronto  |
+----------+-----------------+----------+
#2.List full details of all hotels in New York.

mysql> select *  from hotel where city ='New York' ;
+----------+--------------+----------+
| Hotel_No | Name         | City     |
+----------+--------------+----------+
| H111     | Empire Hotel | New York |
| H235     | Park Place   | New York |
+----------+--------------+----------+
#3.List the names and cities of all guests, ordered according to their cities.
 select *  from guest order by city;
+----------+---------------+--------------+
| Guest_No | Name          | City         |
+----------+---------------+--------------+
| G467     | Robert Swift  | Atlanta      |
| G190     | Edward Cane   | Baltimore    |
| G367     | Tara Cummings | Baltimore    |
| G230     | Tom Hancock   | Philadelphia |
| G256     | Adam Wayne    | Pittsburgh   |
| G879     | Vanessa Parry | Pittsburgh   |
+----------+---------------+--------------+
#4.List all details for non-smoking rooms in ascending order of price.
select *  from room where type='N' order by price;
+---------+----------+------+--------+
| Room_No | Hotel_No | Type | Price  |
+---------+----------+------+--------+
|     257 | H437     | N    | 140.00 |
|     412 | H111     | N    | 145.00 |
|     223 | H437     | N    | 155.00 |
|     345 | H498     | N    | 160.00 |
|    1201 | H193     | N    | 175.00 |
|    1267 | H235     | N    | 175.00 |
|     467 | H498     | N    | 180.00 |
|    1289 | H235     | N    | 195.00 |
+---------+----------+------+--------+
#5.List the number of hotels there are.
 select count(*) from hotel;
+----------+
| count(*) |
+----------+
|        6 |
+----------+
#6.List the cities in which guests live. Each city should be listed only once.
 select distinct city from guest;
+--------------+
| city         |
+--------------+
| Baltimore    |
| Philadelphia |
| Pittsburgh   |
| Atlanta      |
+--------------+
#7.List the average price of a room.
 select avg(price) from room ;
+------------+
| avg(price) |
+------------+
| 155.666667 |
+------------+
#8.List hotel names, their room numbers, and the type of that room.
 select h.Name , r.Room_No ,r.Type from hotel h join room r on h.Hotel_No=r.Hotel_No;
+-----------------+---------+------+
| Name            | Room_No | Type |
+-----------------+---------+------+
| Clairmont Hotel |     223 | N    |
| Clairmont Hotel |     257 | N    |
| Empire Hotel    |     313 | S    |
| James Plaza     |     345 | N    |
| Empire Hotel    |     412 | N    |
| James Plaza     |     467 | N    |
| Brownstone      |     876 | S    |
| Brownstone      |     898 | S    |
| Devon Hotel     |    1001 | S    |
| Devon Hotel     |    1201 | N    |
| Park Place      |    1267 | N    |
| Park Place      |    1289 | N    |
+-----------------+---------+------+
#8.List the hotel names, booking dates, and room numbers for all hotels in New York.
