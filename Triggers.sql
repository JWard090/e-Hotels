SET search_path = ehotel;

CREATE FUNCTION increment_hotels() RETURNS TRIGGER AS $incrementHotelNo$
BEGIN
	update hotelchain
	SET nohotels = nohotels + 1
	where hname=NEW.hname;
	RETURN NEW;
END;
$incrementHotelNo$ LANGUAGE plpgsql;

CREATE TRIGGER incrementHotelNo AFTER INSERT ON hotel
FOR EACH ROW EXECUTE PROCEDURE increment_hotels();


CREATE FUNCTION decrement_hotels() RETURNS TRIGGER AS $decrementHotelNo$
BEGIN
	update hotelchain
	SET nohotels = nohotels - 1
	where hname=OLD.hname;
	RETURN OLD;
END;
$decrementHotelNo$ LANGUAGE plpgsql;

CREATE TRIGGER decrementHotelNo AFTER DELETE ON hotel
FOR EACH ROW EXECUTE PROCEDURE decrement_hotels();


CREATE FUNCTION increment_rooms() RETURNS TRIGGER AS $incrementRoomNo$
BEGIN
	update hotel
	SET noRooms = noRooms + 1
	where hotelID=NEW.hotelID;
	RETURN NEW;
END;
$incrementRoomNo$ LANGUAGE plpgsql;

CREATE TRIGGER incrementRoomNo AFTER INSERT ON room
FOR EACH ROW EXECUTE PROCEDURE increment_rooms();


CREATE FUNCTION decrement_rooms() RETURNS TRIGGER AS $decrementRoomNo$
BEGIN
	update hotel
	SET noRooms = noRooms - 1
	where hotelID=OLD.hotelID;
	RETURN OLD;
END;
$decrementRoomNo$ LANGUAGE plpgsql;

CREATE TRIGGER decrementRoomNo AFTER INSERT ON room
FOR EACH ROW EXECUTE PROCEDURE decrement_rooms();
