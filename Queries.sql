SET search_path = ehotel;

/*
	This file is to satisy requirement 8.
	
	The first few lines show how to make customers and room bookings, and how employees can convert
	bookings to rentals
	
	It also allows users to filter rooms based on a number of criteria, including room capacity,
	area, hotel chain, category/rating, and price
*/

--Making new customers
Insert into customer(csin, cname)
Values
	(1, 'Julian'),
	(2, 'Uvil'),
	(3, 'Verena'),
	(4, 'Mahalakshmi');

--Making room bookings
Insert into booking(hotelid,roomnum,csin,indate,outdate)
Values
	(1,1,1,'2023-04-05','2023-04-10'),
	(15,2,3,'2023-03-29','2023-04-02');

--Covert room booking into a rental
Update booking
	SET isrental = true
	WHERE bookingid=1;

--This shows the hotel rooms with a capacity of at least 3
select hotelid, hname, harea, roomnum, capacity, price
	from ehotel.hotel
	natural join ehotel.room r
	where r.capacity >2
	order by capacity;

--This view shows the hotel rooms that are at least $200 and rating at least 4
select hotelid, hname, harea, roomnum, capacity, rating, price
	from ehotel.hotel h
	natural join ehotel.room r
	where h.rating >3
	and r.price >199
	order by rating;

--This view shows the hotel rooms from Best Western that are in Ottawa, sorted by price
select hotelid, hname, roomnum, capacity, price
	from ehotel.hotel h
	natural join ehotel.room r
	where h.harea = 'Ottawa'
	and h.hname = 'Best Western'
	order by price;