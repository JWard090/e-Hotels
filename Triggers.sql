SET search_path = ehotel;


--This is trigger is copied almost exactly from one I found online to help figure out the syntax. It isn't necessary in my code
CREATE TRIGGER before_update_salary
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
   IF NEW.ename <> OLD.ename THEN
	INSERT INTO hotelchain(hname)
		VALUES(NEW.ename);
	END IF;
END;


create trigger incrementHotelNo
after insert on hotel
referencing new row as nrow
for each row
begin atomic
	update hotelchain
	SET nohotels +=1 where hname=nrow.hname
end;

create trigger decrementHotelNo
after delete on hotel
referencing old row as orow
for each row
begin atomic
	update hotelchain
	SET nohotels -=1 where hname=orow.hname
end;