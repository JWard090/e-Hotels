/*
	Implementing the views
*/
SET search_path = ehotel;

select * from hotel;

select h.hArea, r.capacity from hotel h
join room r
on h.hotelID = r.hotelID;

select hArea, sum(capacity) as area_capacity
	from hotel h
	join room r
	on h.hotelID = r.hotelID
	group by hArea;

delete from booking;
insert into booking(hotelid,roomnum,isrental,indate,outdate)
values
	(1,0,false,'2023-04-30','2023-05-03');

/*
	View 1: the number of available rooms per area
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
	the capacity of all the rooms of a specific hotel
*/