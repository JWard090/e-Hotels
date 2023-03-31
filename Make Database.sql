/*
	This creates the database, without restraints
*/
drop schema if exists ehotel cascade;
CREATE schema eHotel;
SET search_path = ehotel;

/*
	It might be smart to make the hname the primary key, so the user doesn't need to know the chainid numbers by heart
*/
Create table HotelChain(
	hname varchar(20),
	offPhone integer,
	offAdd Varchar(40),
	offEmail Varchar(20),
	noHotels integer default 0,
	Primary key (hname)
);

create table Employee(
	eSIN integer,
	eName varchar(20),
	eAddress varchar(40),
	primary key (eSIN)
);

Create table Hotel (
	hotelID Serial Primary key,
	hname varchar(20),
	hPhone integer,
	rating integer,
	hEmail varchar(20),
	noRooms integer,
	hAdd varchar(40),
	hArea varchar(20),
	managerID integer,
	Foreign key (hname) references HotelChain(hname),
	Foreign key (managerID) references Employee(eSIN),
	constraint rating check (rating >=1 and rating <=5) /* rating 1-5 */
);

Create table Room(
	--roomID Serial Primary key,
	hotelID integer,
	roomNum integer,
	capacity integer,
	roomView varchar(20),
	extendable boolean,
	price numeric(10,2), /* Maximum price of $999,999.99 */
	Primary key (hotelID, roomNum),
	Foreign Key (hotelID) references Hotel(hotelID)
);

Create table AmenityList(
	--roomID integer,
	hotelID integer,
	roomNum integer,
	amenity varchar(20),
	primary key (hotelID,roomNum,amenity),
	foreign key (hotelID, roomNum) references Room(hotelID,roomNum)
);

Create table Customer(
	cSIN integer,
	cName varchar(20),
	cAddress varchar(40),
	cRegDate date default CURRENT_TIMESTAMP,
	primary key (cSIN)
);

create table Booking(
	bookingID Serial Primary key,
	hotelid integer not null,
	roomnum integer not null,
	/*roomID integer not null,*/
	cSIN integer,
	isRental boolean not null,
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