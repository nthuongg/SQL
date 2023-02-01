create table categories(
name varchar(255) not null unique,
id int primary key
);
create table authors(
name varchar(255) not null unique,
id int primary key
);

create table subcategories(
name varchar(255) not null,
id int primary key identity(1,1),
categories_id int not null foreign key references categories(id)
);

create table posts(
title varchar(255) not null,
description varchar(255),
publish_time datetime not null,
thumbnail varchar(255) default 'abc.png',
content text not null,
id int primary key identity(1,1),
category_id int not null foreign key references categories(id),
subcategory_id int not null foreign key references subcategories(id),
author_id int not null foreign key references authors(id)
);

create table comments(
usename varchar(255) not null,
comment text not null,
post_time datetime not null check(post_time <= getdate()),
like_number int not null check(like_number >=0) default 0,
id int primary key identity(1,1),
post_id int not null foreign key references posts(id)
);
