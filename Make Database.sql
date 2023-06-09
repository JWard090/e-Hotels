/*
	This creates the database, without restraints
*/
drop schema if exists ehotel cascade;
CREATE schema eHotel;
SET search_path = ehotel;

Create table HotelChain(
	hname varchar(20),
	offPhone integer unique,
	offAdd Varchar(40) unique,
	offEmail Varchar(20) unique,
	noHotels integer default 0,
	Primary key (hname),
	constraint offPhone check (offPhone > 1000000000 and offPhone < 9999999999)
);

create table Employee(
	eSIN integer,
	eName varchar(20) not null,
	eAddress varchar(40) not null,
	primary key (eSIN)
);

Create table Hotel (
	hotelID Serial Primary key,
	hname varchar(20),
	hPhone integer,
	rating integer not null,
	hEmail varchar(20),
	noRooms integer default 0,
	hAdd varchar(40) unique,
	hArea varchar(20) not null,
	managerID integer,
	Foreign key (hname) references HotelChain(hname) ON DELETE CASCADE,
	Foreign key (managerID) references Employee(eSIN),
	constraint rating check (rating >=1 and rating <=5) /* rating 1-5 */
);

Create table Room(
	hotelID integer,
	roomNum integer,
	capacity integer not null,
	roomView varchar(20),
	extendable boolean,
	price integer not null, /* Rooms are priced in whole dollars */
	Primary key (hotelID, roomNum),
	Foreign Key (hotelID) references Hotel(hotelID) ON DELETE CASCADE,
	constraint capacity check (capacity > 0) /*the capacity of a room must be at least 1*/
);

Create table AmenityList(
	hotelID integer,
	roomNum integer,
	amenity varchar(20),
	primary key (hotelID,roomNum,amenity),
	foreign key (hotelID, roomNum) references Room(hotelID,roomNum)
);

Create table Customer(
	cSIN integer,
	cName varchar(20) not null,
	cAddress varchar(40),
	cRegDate date default CURRENT_TIMESTAMP,
	primary key (cSIN)
);

create table Booking(
	bookingID Serial Primary key,
	hotelid integer,
	roomnum integer,
	cSIN integer,
	isRental boolean not null default false,
	inDate date not null,
	outDate date not null,
	Foreign key (hotelid,roomnum) references Room(hotelid,roomnum),
	Foreign key (cSIN) references Customer(cSIN)
);

create table RoleList(
	eSIN integer,
	erole varChar(20),
	hotelid integer,
	Primary key (eSIN, erole,hotelid),
	foreign key (hotelid) references Hotel(hotelid),
	foreign key (eSIN) references Employee(eSIN)
);