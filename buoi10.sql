create table customers(
name varchar(50) not null unique,
id_card varchar(10) not null unique,
address varchar(100) not null,
id int primary key identity(1,1),
);

create table orders(
subscriber_number varchar(10) not null unique,
type varchar(20) not null,
register_date datetime not null,
customer_id int not null foreign key references customers(id)
);

insert into customers (name, id_card, address)
values('Nguyen Nguyet Nga', '123456789', 'Ha Noi'),
('Nguyen Van An','012345678','Ha Noi');

select * from customers;

insert into orders (subscriber_number, type, register_date, customer_id)
values('123456789', 'Tra truoc', '2002-12-12', 1),
('659854625', 'Tra sau', '2012-11-16', 1),
('987456321', 'Tra truoc', '2000-10-25', 2),
('147852369', 'Tra truoc', '2000-10-25', 2);
  
select * from orders;

--Câu 5
select * from orders where subscriber_number = '0123456789';

select * from customers where id_card = '123456789';

select subscriber_number from orders where customer_id in
  (select id from customers where id_card = '123456789');
 
select subscriber_number from orders where register_date = '2002-12-12';

select subscriber_number from orders where customer_id in
  (select id from customers where address = 'Ha Noi');

--Câu 6
select count(name) as customers_total from customers;

select count(subscriber_number) as SoThueBao from orders;

select count(register_date) as SoThueBao from orders 
where register_date = '2000-10-25';

select A.*, B.register_date, B.subscriber_number, B.type 
from customers A
inner join orders B on A.id = B.customer_id;
