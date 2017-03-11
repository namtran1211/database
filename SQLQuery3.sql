USE master
IF EXISTS(select * from sys.databases where name='claim')
DROP DATABASE claim

CREATE DATABASE newdatabase
Create table Role
(
RoleId int,
RoleName varchar(50),
primary key(RoleId)
)
CREATE TABLE Users
(
UserId int,
UserName varchar(255),
Password varchar(50),
Fullname varchar(255),
Email varchar(50),
PermissionId int,
primary key (UserId),
foreign key (PermissionId) references Role(RoleId) 
);
Create table Facility
(
FacilityId int,
FacilityName varchar(50),
CoodinatorId int,
primary key (FacilityId),
foreign key (CoodinatorId) references Users(UserId)
)
Create table Claim
(
ClaimId int,
Content varchar(max),
Readed bit,
StudentId int,
primary key(ClaimId),
foreign key (StudentId) references Users(UserId) 
)
Create table Status
(
StatusId int,
StatusName varchar(50),
primary key (StatusId)
)
Create table Processing
(
ProcessId int,
ClaimId int,
CoodinatorId int,
Startdate date,
Enddate date,
StatusId int,
primary key (ProcessId),
foreign key (ClaimId) references Claim(ClaimId),
foreign key (CoodinatorId) references Users(UserId),
foreign key (StatusId) references Status(StatusId)
)


