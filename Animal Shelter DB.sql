create table Staff(
Staff_ID int primary key,name varchar (100) not null,
Salary decimal (20,0) check (Salary>0),Hire_Date Date not null
, Role varchar(100) not null
);
Insert into Staff values
 (1,'Ahmed',5000,'2024-04-15','Assistant'),
 (2,'Sara',8500,'2022-02-02','Manager'),
 (3,'Roaa',7000,'2022-09-13','Assistant'),
 (4,'Ramy',12000,'2025-09-01','Vet'),
 (5,'Sama',12500,'2024-12-26','Vet'),
 (6,'Ali',6500,'2022-04-01','Assistant'),
 (7,'Showky',10500,'2019-12-30','Manager'),
 (8,'Ola',13000,'2023-09-08','Vet');

 Select * from Staff

 create table Adopter(
 Adopter_ID int primary key,name varchar (100) not null,
 Address varchar (100), Email varchar(100) unique
 );

 insert into Adopter values
 (1,'Rahma','Cairo','rahma@mail.com'),
 (2,'Laila','Giza','laila@mail.com'),
 (3,'Mona','Giza','mona@mail.com'),
 (4,'Hossam','Fayoum','hossam@mail.com'),
 (5,'Ahmed','Aswan','ahmed@mail.com'),
 (6,'Ali','Sohag','ali@mail.com'),
 (7,'Salah','Luxor','salah@mail.com'),
 (8,'Sara','Cairo','sarah@mail.com');

 Select * from Adopter

 create table phone_Number(
 phone_ID int primary key,Adopter_ID int not null,
 Phone_Number varchar (100) not null,
 unique (Phone_Number), 
 foreign key (Adopter_ID) REFERENCES Adopter (Adopter_ID)
 );

 insert into phone_Number values
  (1,1,'01023456700'),
 (2,2,'01234567969'),
 (3,3,'01123467894'),
 (4,4,'01523488789'),
 (5,5,'01275656541'),
 (6,6,'01298492847'),
 (7,7,'01148329879'),
 (8,8,'01113827489');

 Select * from phone_Number

 create table Housing_Unit(
 Unit_ID int primary key,Section varchar (100) not null,
 Type varchar(100) not null,Capacity int check(Capacity>=1),
 Occupied int check (Occupied>=0)
 );
 
 insert into Housing_Unit values
  (1,'A','DOGS',20,10),
 (2,'B','CATS',20,20),
 (3,'C','RABBITS',30,30),
 (4,'D','BIRDS',20,10),
 (5,'F','WILD',10,5);

 Select * from Housing_Unit

 create table Animal(
 Animal_ID int primary key,name varchar(100)not null,
 type varchar (100) not null,Arrival_Date Date not null,
 Adoption_Date Date,Status varchar(100) check (Status in ('Available','Adopted','Treatment')),
 Gender varchar (100) check (Gender in ('Female','Male')),
 Staff_ID int not null,Adopter_ID int,Unit_ID int not null,
 foreign key (Staff_ID) REFERENCES Staff (Staff_ID),
  foreign key (Adopter_ID) REFERENCES Adopter (Adopter_ID),
   foreign key (Unit_ID) REFERENCES Housing_Unit (Unit_ID)
   );

   insert into Animal values
   (1, 'Buddy', 'Dog', '2024-01-10', NULL, 'Available', 'Male', 1, NULL, 1),
(2, 'Luna', 'Cat', '2024-02-05', '2024-03-01', 'Adopted', 'Female', 2, 1, 2),
(3, 'Rocky', 'Dog', '2024-02-20', NULL, 'Treatment', 'Male', 4, NULL, 1),
(4, 'Mimi', 'Cat', '2024-01-25', '2024-02-15', 'Adopted', 'Female', 3, 2, 2),
(5, 'Snow', 'Rabbit', '2024-03-10', NULL, 'Available', 'Female', 6, NULL, 3),
(6, 'Coco', 'Bird', '2024-03-18', NULL, 'Available', 'Male', 8, NULL, 4),
(7, 'Leo', 'Dog', '2024-04-01', '2024-04-20', 'Adopted', 'Male', 7, 3, 1),
(8, 'Nala', 'Cat', '2024-04-05', NULL, 'Treatment', 'Female', 5, NULL, 2);

Select *from Animal

create table Medical_Record(
Med_ID int primary key, Med_Date Date not null,
Spay varchar(100) check (Spay in('DONE','UNAVAILABLE','NO')),
Vaccination varchar(100) check (Vaccination in('Yes','No')),
Staff_ID int not null,Animal_ID int not null,
foreign key (Staff_ID) REFERENCES Staff (Staff_ID),
foreign key (Animal_ID) REFERENCES Animal (Animal_ID)
);

insert into Medical_Record values
(1, '2024-01-15', 'NO', 'Yes', 4, 1),
(2, '2024-02-07', 'DONE', 'Yes', 5, 2),
(3, '2024-02-22', 'UNAVAILABLE', 'No', 4, 3),
(4, '2024-01-28', 'DONE', 'Yes', 5, 4),
(5, '2024-03-12', 'NO', 'No', 4, 5),
(6, '2024-03-20', 'UNAVAILABLE', 'Yes', 8, 6),
(7, '2024-04-03', 'DONE', 'Yes', 5, 7),
(8, '2024-04-10', 'NO', 'No', 4, 8);

Select * from Medical_Record

 SELECT NAME,TYPE FROM ANIMAL
 WHERE STATUS = 'AVAILABLE'

 SELECT NAME, TYPE
FROM ANIMAL
WHERE STATUS = 'TREATMENT';

SELECT COUNT(*) AS Total_Animals
FROM Animal;

SELECT COUNT(*) AS Adopted_Animals
FROM Animal
WHERE Status = 'Adopted';

SELECT DISTINCT Type
FROM Animal;

SELECT Name, Salary
FROM Staff
WHERE Salary BETWEEN 6000 AND 10000;

SELECT Name
FROM Staff
WHERE Name LIKE 'A%';


SELECT Type, COUNT(*) AS Total
FROM Animal
GROUP BY Type;

SELECT Name, Salary
FROM Staff
ORDER BY Salary DESC;






