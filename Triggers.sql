SET search_path = ehotel;

Create function increment_hotels()
Returns trigger as
$BODY$
BEGIN
	update hotelchain
	SET nohotels = nohotels + 1
	where hname=nrow.hname
return new;
end
$BODY$ language plpgsql;

create trigger incrementHotelNo
	after insert on hotel
	referencing new row as nrow
	for each row
	EXECUTE PROCEDURE increment_hotels();

/*
create trigger decrementHotelNo
after delete on hotel
referencing old row as orow
for each row
begin atomic
	update hotelchain
	SET nohotels -=1 where hname=orow.hname
end;
*/