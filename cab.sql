//CAB MANAGEMENT SYSTEM DATABASE
//..............................

create database CABMS;

use cabms;

//CAB TABLE
//.........

create table cab(
 id int not null primary key auto_increment,
 cabno int not null unique,
 cabName varchar(100) not null unique,
 cabDescription varchar(200) not null,
 cabCapacity int not null check(cabCapacity >= 0)

 );


.................................................
'''''''''''''''''''''''''''''''''''''''''''''''''

//PASSENGER TABLE
//...............

create table passenger(
id int not null primary key auto_increment,
pName varchar(100) not null ,
userName varchar(100) not null unique,
email varchar(100) not null unique,
pswd varchar(50) not null,
mobile double not null unique,
address varchar(200) not null,
dob date not null
);

//...................................
//'''''''''''''''''''''''''''''''''''




//CAB SCHEDULE TABLE
//..................

create table cabSchedule(
id int not null primary key auto_increment,
cabFrom varchar(150) not null,
cabTo varchar(150) not null,
cabDate date not null,
cabTime time not null,
amount int not null check(amount >= 0),
cabno int not null,

constraint FK_cabSchedule_cabno foreign key
(cabno) references cab(cabno) on delete cascade
);

//............................................
//'''''''''''''''''''''''''''''''''''''''''''



//CAB BOOKING TABLE
//.................

create table cabBooking(
bookingNo int not null unique primary key,
bookingDate date not null,
dateOfTravel date not null,
cabno int not null,
cabFrom varchar(150) not null,
cabTo varchar(150) not null,
startingTime time not null,
pId int not null,

constraint FK_cabBooking_cabno foreign key
(cabno) references cab(cabno),

constraint FK_cabBooking_pId foreign key
(pId) references passenger(id)

);

//......................................................
//''''''''''''''''''''''''''''''''''''''''''''''''''''''

//CAB DRIVER TABLE
//................


create table cabDriver(
id int not null primary key auto_increment,
driverName varchar(100) not null ,
driverUsername varchar(100) not null unique,
email varchar(100) not null unique,
pswd varchar(50) not null,
mobile double not null unique,
address varchar(200) not null,
dob date not null,
cabno int not null,

constraint FK_cabDriver_cabno foreign key
(cabno) references cab(cabno)
);

//......................................................
//''''''''''''''''''''''''''''''''''''''''''''''''''''''