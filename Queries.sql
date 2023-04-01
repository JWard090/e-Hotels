SET search_path = ehotel;


/*
	Criteria to choose rooms:
	the dates (start, end) of booking or renting, the room capacity, the area, the hotel chain, the
	category of the hotel, the total number of rooms in the hotel, the price of the rooms
*/
--This shows the hotel rooms with a capacity of at least 3
select hotelid, hname, harea, roomnum, capacity, price
	from ehotel.hotel
	natural join ehotel.room r
	where r.capacity >2
	order by capacity;

--This view shows the hotels that have a rating of at least 4
select hotelid, hname, harea, roomnum, capacity, rating, price
	from ehotel.hotel h
	natural join ehotel.room
	where h.rating >3
	order by rating;
	
--Making a room booking
Insert into booking(hotelid,roomnum,indate,outdate)
Values
	(0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP+1)