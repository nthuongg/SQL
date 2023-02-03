create table products_firm(
id int not null primary key,
name varchar(20) not null unique,
address varchar(20) not null,
tel varchar(20) not null unique,
);

create table products(
pf_id int not null  foreign key references products_firm(id),
name varchar(50) not null,
describe varchar(50) not null,
donvi varchar(10) not null,
price decimal not null check (price > 0),
SoLuong int not null,
);

insert into products_firm (id, name, address, tel)
values (123, 'Asus', 'USA', '983232'),
(124, 'Dell', 'USA','852147');

select * from products_firm;

insert into products(pf_id, name, describe, donvi,price, SoLuong)
values (123, 'May tinh T450', 'May nhap cu', 'Chiec', '1000',10),
(123, 'Dien thoai Nokia5670', 'Dien thoai dang hot', 'Chiec', '200',200),
(123, 'May in Samsung450', 'May in loai binh', 'Chiec', '100',10),
(123, 'May tinh T450', 'May nhap cu', 'Chiec', '1000',10),
(124, 'Laptop Dell Vostro', 'May nhap moi', 'Chiec', '3000',100),
(124, 'Laptop Dell Vostro', 'May nhap cu', 'Chiec', '1000',100);

select * from products;

--Cau 4
select name from products_firm;

select name from products;

--Cau 5
select name from products_firm order by name asc;

select * from products order by price desc;

select * from products_firm where name = 'Asus';

select * from products where SoLuong < 11;

select * from products where pf_id in 
  (select id from products_firm where name = 'Asus');

--Cau 6
select count(*) as sohangsp from products_firm;

select count(*) as SoMatHang from products;