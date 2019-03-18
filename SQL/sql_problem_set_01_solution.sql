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
#9.List the hotel names, booking dates, and room numbers for all hotels in New York.
select h.Name,b.Date_From,b.Room_No from hotel h join booking b on h.Hotel_No = b.Hotel_No;
+-----------------+------------+---------+
| Name            | Date_From  | Room_No |
+-----------------+------------+---------+
| Empire Hotel    | 1999-08-10 |     412 |
| Empire Hotel    | 1999-08-18 |     412 |
| Park Place      | 1999-09-05 |    1267 |
| James Plaza     | 1999-09-15 |     467 |
| James Plaza     | 1999-11-03 |     345 |
| Devon Hotel     | 1999-11-15 |    1001 |
| Devon Hotel     | 1999-09-12 |    1001 |
| Devon Hotel     | 1999-10-01 |    1201 |
| Clairmont Hotel | 1999-10-04 |     223 |
| Clairmont Hotel | 1999-09-14 |     223 |
+-----------------+------------+---------+
#10.What is the number of bookings that started in the month of September?
 select count(*) No_Of_Booking from booking where Date_From like '%-09-%';
+---------------+
| No_Of_Booking |
+---------------+
|             4 |
+---------------+
#11.List the names and cities of guests who began a stay in New York in August.
select b.Date_From,h.city,g.name,g.city from booking b join hotel h on b.Hotel_No=h.Hotel_No join guest g on b.Guest_No=g.Guest_No where b.Date_From like '%-08-%' and h.city ='New York';
+------------+----------+---------------+------------+
| Date_From  | city     | name          | city       |
+------------+----------+---------------+------------+
| 1999-08-10 | New York | Adam Wayne    | Pittsburgh |
| 1999-08-18 | New York | Tara Cummings | Baltimore  |
+------------+----------+---------------+------------+
#12.List the hotel names and room numbers of any hotel rooms that have not been booked.
 select h.Name,r.Room_No from hotel h join room r on h.Hotel_No=r.Hotel_No where r.room_No NOT IN(Select Room_No from Booking);
+-----------------+---------+
| Name            | Room_No |
+-----------------+---------+
| Clairmont Hotel |     257 |
| Empire Hotel    |     313 |
| Brownstone      |     876 |
| Brownstone      |     898 |
| Park Place      |    1289 |
+-----------------+---------+
#13.List the hotel name and city of the hotel with the highest priced room.
select Name,City from hotel where Hotel_No = (select Hotel_No from room order by price desc limit 1);
+------------+----------+
| Name       | City     |
+------------+----------+
| Park Place | New York |
+------------+----------+
#14.List hotel names, room numbers, cities, and prices for hotels that have rooms with prices lower than the lowest priced room in a Boston hotel.
 select h.Name,r.Room_No,h.City,r.Price from Hotel h join Room r on h.Hotel_No=r.Hotel_No where r.Price<(select min(r.Price) from Hotel h join Room r on h.Hotel_No=r.Hotel_No where h.City='Boston');
+------------+---------+---------+--------+
| Name       | Room_No | City    | Price  |
+------------+---------+---------+--------+
| Brownstone |     876 | Toronto | 124.00 |
| Brownstone |     898 | Toronto | 124.00 |
+------------+---------+---------+--------+
 #15.List the average price of a room grouped by city.
 select avg(r.price) as AVERAGE_PRICE from Room r join Hotel h on r.Hotel_No=h.Hotel_No group by h.City;
+---------------+
| AVERAGE_PRICE |
+---------------+
|    155.000000 |
|    165.000000 |
|    147.000000 |
+---------------+