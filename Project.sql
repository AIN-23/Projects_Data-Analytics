create database AbleJobs;
use AbleJobs;
create table Sales1 
(salesman_id int primary key, name varchar(30) unique, city varchar(30), commission float);
insert into Sales1 values
(5001, "James Hoog","New York", 0.15);
insert into Sales1 values
(5002, "Nail Knite","Paris", 0.13);
insert into Sales1 values
(5005, "Pit Alex","London", 0.11);
insert into Sales1 values
(5006, "Mc Lyon","Paris", 0.14);
insert into Sales1 values
(5007, "Paul Adam","Rome", 0.13);
insert into Sales1 values
(5003, "Lauson Hen","San Jose", 0.12);
select * from Sales1;

create table Sales2
(customer_id int primary key, cust_name varchar(30) unique, city varchar(30),
 grade int, salesman_id int);
insert into Sales2 values
(3002, "Nick Rimando","New York", 100, 5001);
insert into Sales2 values
(3007, "Brad Davis","New York", 200, 5001);
insert into Sales2 values
(3005, "Graham Zusi","California", 200, 5002);
insert into Sales2 values
(3008, "Julian Green","London", 300, 5002);
insert into Sales2 values
(3004, "Fabian Johnson","Paris", 300, 5006);
insert into Sales2 values
(3009, "Geoff cameron","Berlin", 100, 5003);
insert into Sales2 values
(3003, "Jozy Altidor","Moscow", 200, 5007);
select * from Sales2;

update Sales1
set commission = 0.22
where name = "Pit Alex";

update Sales1
set city = "Paris"
where salesman_id = 5003;
select * from Sales1;

update Sales2
set grade = 300
where cust_name = "Graham Zusi";

update Sales2
set city = "London"
where customer_id = 3009;
select * from Sales2;

#Changing the details of Table Sales1 back to original condition
update Sales1
set commission = 0.11
where name = "Pit ALex";
update Sales1
set city = "San Jose"
where salesman_id = 5003;
select * from Sales1;

select * from Sales1
where city = "Paris" or city = "Rome";
# or - where city in ("Paris" ,"Rome");

select * from Sales1
where city not in ("Paris", "Rome");

select * from Sales1
where commission between 0.12 and 0.14;

select * from Sales1
where name like '(A-L)%';

select * from Sales2
where cust_name like 'B%';

select * from Sales2
where cust_name like '%N';

select * from Sales1
where name like 'N__L';

create table Orders (ord_no int primary key,
purch_amt float, ord_date date, customer_id int,
salesman_id int);
insert into Orders values
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);
select * from Orders;

select sum(purch_amt) as "Total Purchase Amount"
from Orders;

select avg(purch_amt) as "Average Purchase Amount"
from Orders;

select salesman_id, count(*) from Orders
group by salesman_id;

select count(customer_id) from Orders;

select customer_id, count(customer_id) from Orders
group by customer_id;

select * from Sales2
inner join Sales1
on Sales2.city = Sales1.city;

use AbleJobs;
create table Nobel
(Year int, Subject varchar(20), Winner varchar(50),
Country varchar(20), Category varchar(30));
insert into Nobel values
(1970, "Physics", "Hannes Alfven", "Sweden", "Scientist"),
(1970, "Physics", "Louis Neel", "France", "Scientist"),
(1970, "Chemistry", "Luis Federico Leloir", "France", "Scientist"),
(1970, "Physiology", "Ulf Von Euler", "Sweden", "Scientist"),
(1970, "Physiology", "Bernard Katz", "Germany", "Scientist"),
(1970, "Literature", "Aleksander Solzhenitsyn", "Russia", "Linguist"),
(1970, "Economics", "Paul Samuelson", "USA", "Economist"),
(1970, "Physiology", "Julius Axelrod", "USA", "Scientist"),
(1971, "Physics", "Dennis Gabor", "Hungary", "Scientist"),
(1971, "Chemistry", "Gerhard Herzberg", "Germany", "Scientist"),
(1971, "Peace", "Willy Brandt", "Germany", "Chancellor"),
(1971, "Literature", "Pablo Neruda", "Chile", "Linguist"),
(1971, "Economics", "Simon Kuznets", "Russia", "Economist"),
(1978, "Peace", "Anwar al-Sadat", "Egypt", "President"),
(1978, "Peace", "Menachem Begin", "Israel", "Prime Minister"),
(1987, "Chemistry", "Donald J.Cram", "USA", "Scientist"),
(1987, "Chemistry", "Jean-Marie Lehn", "France", "Scientist"),
(1987, "Physiology", "Susumu Tonegawa", "Japan", "Scientist"),
(1994, "Economics", "Reinhard Selten", "Germany", "Economist"),
(1994, "Peace", "Yitzhak Rabin", "Israel", "Prime Minister"),
(1987, "Physics", "Johannes Georg Bednorz", "Germany", "Scientist"),
(1987, "Literature", "Joseph Brodsky", "Russia", "Linguist"),
(1987, "Economics", "Robert Solow", "USA", "Economist"),
(1994, "Literature", "Kenzaburo Oe", "Japan", "Linguist");

select * from Nobel;

select Year, Subject, Winner from Nobel
where Year = "1970";

select Year, Subject, Winner from Nobel
where Year = "1987";

select Winner from Nobel
where Year = 1971 and Subject = "Literature";

select Year, Subject from Nobel
where Winner = "Dennis gabor";

select Winner from Nobel
where subject = "Physics" and year > 1950;

select Year, Subject, Winner, Country from Nobel
where Subject = "Chemistry" and
Year between 1965 and 1975;

select * from Nobel
where year > 1972 and Category = "Prime Minister";

select * from Nobel
where Winner like 'Louis%';

select * from Nobel
where Winner = "Johannes Georg Bednorz";

select * from Nobel
where Subject = "Physics" and year = 1970
union
select * from Nobel
where Subject = "Economics" and year = 1971;

# Joins
select * from Sales2;
update Sales2
set city = "Berlin"
where cust_name = "Geoff Cameron";

select s1.name, s2.cust_name, s1.city 
from Sales1 s1
inner join Sales2 s2
on s1.city = s2.city;

select s1.name, s2.cust_name, s1.city 
from Sales1 s1
inner join Sales2 s2
on s1.salesman_id = s2.salesman_id and s1.city = s2.city;

select s2.cust_name as Customer_Name, s2.city, s1.name as Salesman, s1.commission
from Sales1 s1
inner join Sales2 s2
on s1.salesman_id = s2.salesman_id;

select s1.name as Salesperson from Sales1 s1
where commission > 0.12;

select s2.cust_name as 'Customer Name', s2.city as 'Customer City',
s1.name as Salesman, s1.city as 'Salesman City', s1.commission
from Sales1 s1 inner join Sales2 s2
on s1.salesman_id = s2.salesman_id
and s1.city not in (s2.city)
where s1.commission > 0.12;

use AbleJobs;
create table Customers_Table
(CustomerID smallint primary key, CustomerName varchar(30),
City varchar(30));
insert into Customers_Table values
(1, "john Smith", "New York"),
(2, "Jane Doe", "Los Angeles"),
(3, "Bob Johnson", "Chicago");
select * from Customers_Table;

create table Orders_Table
(OrderID smallint primary key, CustomerID smallint, 
Product varchar(20), Quantity smallint, Price int);
insert into Orders_Table values
(1, 1, "Laptop", 2, 340),
(2, 1, "Printer", 1, 240),
(3, 2, "SMartphone", 3, 70),
(4, 3, "Tablet", 2, 80);
select * from Orders_Table;

select c.CustomerName, c.CustomerID, o.Price 
from Customers_Table c inner join Orders_Table o
on c.CustomerID = o.CustomerID
where o.Price > 100;

select o.Product, c.CustomerName, c.City
from Customers_Table c inner join Orders_Table o
on o.CustomerID = c.CustomerID
where c.City = (select city from Customers_Table where CustomerName = "John Smith");

select OrderID, Product, (Price*Quantity) as 'Total Order amounts'
from Orders_Table
where Quantity > 2;

select OrderID, Product, sum(Price*Quantity) as 'Total Order amounts'
from Orders_Table
where Quantity >2
group by OrderID;
