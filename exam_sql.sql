create table Customer(
CustomerId int primary key,
Name nvarchar(50), 
City nvarchar(50),
Country nvarchar(50),
Phone nvarchar(15),
Email nvarchar(50)
);

create table CustomerAccount(
AccountNumber char(9) primary key,
CustomerId int not null foreign key references Customer(CustomerId),
Balance money not null,
MinAccount money 
);

create table CustomerTransaction(
TransactionId int primary key,
AccountNumber char(9) foreign key references CustomerAccount(AccountNumber),
TransactionDate smalldatetime,
Amount money,
DepositorWithdraw bit
);


/* 3. Insert into each table at least 3 records.*/
insert into Customer( CustomerId, Name, City, Country, Phone, Email) 
values
(1, 'Mai Quang Linh', 'Hanoi', 'Vietnam', '0123456789', 'linh@gmail.com'),
(2, 'Nguyen Van An', 'Ho Chi Minh', 'Vietnam', '0987654321', 'an@gmail.com'),
(3, 'Jane Smith', 'New York', 'USA', '1478520369', 'jane@gmail.com');

insert into CustomerAccount( AccountNumber, CustomerId, Balance, MinAccount)
values
('000000099', 1, 550000, 5000),
('000000088', 2, 800000, 5000),
('000000077', 3, 330000, 5000);

insert into CustomerTransaction( TransactionId, AccountNumber, TransactionDate, Amount, DepositorWithdraw)
values 
(1, '000000099', '2022-09-03', 120000, 1),
(2, '000000088', '2012-12-05', 200000, 0),
(3, '000000077', '2010-10-26', 100000,1);

/* 4. Write a query to get all customers from Customer table who live in ‘Hanoi’. */
select * from Customer where City = 'Hanoi';

/* 5. Write a query to get account information of the customers (Name, Phone, Email,
AccountNumber, Balance).*/
select C.Name, C.Phone, C.Email, A.AccountNumber, A.Balance from Customer C
inner join CustomerAccount A on C.CustomerId = A.CustomerId;

/* 6 */
Alter table CustomerTransaction 
add check ( Amount >0 and Amount <= 1000000);

/* 7 */
Create View vCustomerTransactions As
Select C.Name, A.AccountNumber, T.TransactionDate, T.Amount, T.DepositorWithdraw
From Customer C
INNER JOIN CustomerAccount A 
On C.CustomerId = A.CustomerId
INNER JOIN CustomerTransaction T 
On A.AccountNumber = T.AccountNumber;