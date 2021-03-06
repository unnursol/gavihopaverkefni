create table offenses (
	id serial,
	offense varchar(250),
	primary key (id)
);

create table cities (
	id serial,
	city varchar(250),
	primary key (id)
);

create table moons (
	id serial,
	phase varchar (250),
	time timestamp(6),
	primary key (id)
);

create table crimes (
	id serial,
	time timestamp,
	offense_id int references offenses(id),
	primary key (id)
);

create table emergencyCalls (
	id serial,
	time timestamp(6),
	address varchar(250),
	primary key (id)
);

Create table fatalPoliceShootings (
	id serial,
	time timestamp,
	causeOfDeath varchar(250),
	state varchar(250),
	city_id int references cities(id),
	primary key(id)
);

create table drugDeaths (
    id serial,
    time timestamp,
    sex varchar(50),
    age varchar(5),
    race varchar(250),
    cause varchar(250),
    city_id int references cities(id),
    primary key (id)
);
