/*
	Implementing the views
*/
SET search_path = ehotel;

/*
	View 1: the number of available rooms per area
	The default availability is for today's date. Checking for other dates requires
	modifying the SQL code below or running view1 on Views.java 
*/

select hArea, sum(capacity) as area_capacity
	from hotel h
	join room r
	on h.hotelID = r.hotelID
	where not exists (select 1 from booking b
					 where r.hotelid = b.hotelid and r.roomnum = b.roomnum
					 and CURRENT_TIMESTAMP --Update this line to change the date
					  between b.indate and b.outdate)
	group by harea;

/*
	View 2: The capacity of all the rooms of a specific hotel
	The code shown below shows the capacities from hotelid 1 by default.
	Viewing other hotels requires modifying the code or running view2 on Views.java
*/
select hname, hotelid, roomnum, capacity
	from ehotel.hotelchain
	natural join ehotel.hotel
	natural join ehotel.room
	where hotelid = 1; --Change hotelid here for other hotels