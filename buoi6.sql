create table provider(
id varchar(20) primary key,
name varchar(255) not null unique,
address varchar(50) not null,
tell varchar(20) not null unique,
tax_id int not null
);

create table service(
id varchar(20) primary key,
name varchar(100) not null
);

create table price(
id varchar(20) primary key,
price decimal not null check (price > 0),
description varchar(50) not null
);

create table dongxe(
name varchar(50) primary key,
firm varchar(20) not null,
seats_number int not null check (seats_number > 0)
);

create table register(
id varchar(20) primary key,
provider_id varchar(20) foreign key references provider(id),
service_id varchar(20) foreign key references service(id),
dongxe varchar(50) foreign key references dongxe(name),
price_id varchar(20) foreign key references price(id),
supply_start_date datetime not null,
date datetime not null,
quantity int not null check (quantity > 0)
);
