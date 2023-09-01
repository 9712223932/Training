create database BankingSystem
use BankingSystem

CREATE TABLE CustomerInformation(
	CustomerInformationId int IDENTITY(101,1),
	CustomerName varchar(20),
	CustomerMobileNumber int,
	CustomerAddress varchar(20),
	CreatedOn datetime default getdate())
	insert into  CustomerInformation values('Darshan',971222393,'Surat',getdate())
	insert into  CustomerInformation values('Aman',871211332,'Ahemdabad', getdate())
	insert into  CustomerInformation values('Dhriti',97814122,'Pune', getdate())
	insert into  CustomerInformation values('Tithi',98814133,'Banglore', getdate())
	insert into  CustomerInformation values('Rusih',88814133,'Nashik', getdate()) 

CREATE TABLE CustomerAccountManage(
	CustomerAccountManageId int IDENTITY(201,1),
	AccountNumber int,
	AccountType int,
	AccountBalance int,
	BranchId int,
	CustomerInformationId int,
	CreatedOn datetime default getdate())

	insert into  CustomerAccountManage values(12111,401,2000,1001,101,getdate())
	insert into  CustomerAccountManage values(12112,402,45000,1001,101,getdate())
	insert into  CustomerAccountManage values(12113,401,5600,1002,102,getdate())
	insert into  CustomerAccountManage values(12114,401,8900,1003,103,getdate())
	insert into  CustomerAccountManage values(12115,402,9000,1004,104,getdate())
	insert into  CustomerAccountManage values(12116,401,20000,1005,105,getdate())


CREATE TABLE AccountorTransectionType(
	AccountorTransectionTypeId int IDENTITY(301,1),
	AccountorTransectionTypeName varchar(20)) 

	insert into AccountorTransectionType values ('Account')
	insert into AccountorTransectionType values ('Transection')
	insert into AccountorTransectionType values ('PaymentMethod')
	insert into AccountorTransectionType values ('Loan')


CREATE TABLE AccountorTransectionValue(
	AccountorTransectionValueId int IDENTITY(401,1),
	AccountorTransectionValueName varchar(20),
	AccountorTransectionTypeId int)

	insert into AccountorTransectionValue values ('Savings',301)
	insert into AccountorTransectionValue values ('Current',301)
	insert into AccountorTransectionValue values ('Credit',302)
	insert into AccountorTransectionValue values ('Debit',302)
	insert into AccountorTransectionValue values ('Cash',303)
	insert into AccountorTransectionValue values ('UPI',303)
	insert into AccountorTransectionValue values ('NEFT',303)
	insert into AccountorTransectionValue values ('RTGS',303)
	insert into AccountorTransectionValue values ('Car',304)
	insert into AccountorTransectionValue values ('Home',304)
	insert into AccountorTransectionValue values ('Personal',304)


CREATE TABLE Transection(
	TransectionId int IDENTITY(501,1),
	TransectionType int,
	TransectionAmmount int,
	TransectionMethod int,
	CustomerAccountManageId int,
	CreatedOn datetime default getdate()) 

	insert into Transection values(403,4500,405,201,getdate())
	insert into Transection values(403,500,406,201,getdate())
	insert into Transection values(403,200,407,201,getdate())
	insert into Transection values(403,900,408,201,getdate())
	insert into Transection values(403,200,405,201,getdate())
	insert into Transection values(404,400,405,201,getdate())
	insert into Transection values(404,2000,406,201,getdate())
	insert into Transection values(404,180,407,201,getdate())
	insert into Transection values(404,800,408,201,getdate())
	insert into Transection values(403,200,405,202,getdate())
	insert into Transection values(404,700,406,203,getdate())
	insert into Transection values(403,540,405,204,getdate())
	insert into Transection values(404,2000,408,205,getdate())


CREATE TABLE CreditCardDetail(
	CreditCardDetailID int IDENTITY(601,1),
	CardNumber int,
	Expirydate datetime,
	CardLimit int,
	CustomerAccountManageId int) 

	insert into CreditCardDetail values (6081,getdate(),50000,201)
	insert into CreditCardDetail values (6082,getdate(),50000,202)
	insert into CreditCardDetail values (6083,getdate(),50000,203)
	insert into CreditCardDetail values (6084,getdate(),50000,204)

	
CREATE TABLE Loan(
	LoanID int IDENTITY(701,1),
	LoanType int,
	LoanNumber int,
	IssuedLoanAmount int,
	RemainingLoanAmmount int,
	BranchId int,
	CustomerAccountManageId int)

	insert into Loan values(409,10101,100000,98000,1001,201)
	insert into Loan values(410,10102,25000,23000,1002,201)
	insert into Loan values(411,10103,5000,3000,1003,201)
	insert into Loan values(409,10104,10000,8000,1004,202)
	insert into Loan values(410,10105,20000,18000,1005,203)

Create Table LoanPayment(
	LoanPaymentID int IDENTITY(801,1),
	PaymentAmount int,
	LoanID int) 
	
	insert into LoanPayment values(2000,701)
	insert into LoanPayment values(2000,702)
	insert into LoanPayment values(2000,703)
	insert into LoanPayment values(2000,704)
	insert into LoanPayment values(2000,705)

	
CREATE TABLE Bank(
	BankID int IDENTITY(901,1),
	BankerName varchar(20),
	BranchId int)

	insert into Bank values('Mitesh','1001')
	insert into Bank values('Naitik','1002')
	insert into Bank values('Jenil','1003')
	insert into Bank values('Shubham','1004')
	insert into Bank values('Archit','1005')

	
CREATE TABLE Branch(
	BranchId int IDENTITY(1001,1),
	BranchName varchar(20),
	BranchAddress varchar(20),
	BranchIFSC varchar (20))

	insert into Branch values('ST123','Surat','123456')
	insert into Branch values('AH123','Ahemdbad','123456')
	insert into Branch values('BD123','Baroda','123456')
	insert into Branch values('PU123','Pune','123456')
	insert into Branch values('NA123','Nasik','123456')

	
CREATE TABLE BankServer(
	BankServerId int IDENTITY(1101,1),
	CustomerAccountManageId int,
	TransectionId int,
	CreditCardDetailID int,
	LoanID int,
	CreatedOn datetime default getdate())
	
	insert into BankServer values(201,501,601,701,getdate())

select * from CustomerInformation
select * from CustomerAccountManage
select * from AccountorTransectionType
select * from AccountorTransectionValue
select * from Transection
select * from CreditCardDetail
select * from Loan
select * from LoanPayment
select * from Bank
select * from Branch
select * from BankServer
