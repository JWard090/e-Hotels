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

/*
	View 1: the number of available rooms per area
*/



/*
	the capacity of all the rooms of a specific hotel
*/