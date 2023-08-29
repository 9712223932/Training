/*create table EmployeeInfromation(EmployeeID int identity(101,1) primary key,EmployeeName varchar(20),
EmployeeSalary int,EmployeeGender varchar(10),EmployeeCity varchar(20))
insert into EmployeeInfromation values('Darshan',4500,'Male','Surat')
insert into EmployeeInfromation values('Aman',80500,'Male','UP')
insert into EmployeeInfromation values('Tithi',10500,'FeMale','Mehsana')
insert into EmployeeInfromation values('Dhriti',2500,'FeMale','Ahemdabad')
insert into EmployeeInfromation values('Rushi',90500,'Male','Nashik')
create clustered index EmployeeInfromationSalaryAsc on EmployeeInfromation (gender Asc)
create nonclustered index EmployeeInfromationName on EmployeeInfromation(EmployeeName)*/

sp_helpindex EmployeeInfromation

create unique clustered index EmployeeInfromationName on EmployeeInfromation(EmployeeName,EmployeeSalary asc)

select * from EmployeeInfromation


SELECT *, ROW_NUMBER() OVER(ORDER BY EmployeeSalary asc) AS Row_Number
FROM EmployeeInfromation

drop table EmployeeInfromation