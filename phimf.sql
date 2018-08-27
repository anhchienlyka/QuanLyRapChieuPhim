
create database Phim 
use Phim 
go



create table Rap(
Marap nvarchar(50) primary key not null,
Tenrap nvarchar(100),
Diachi nvarchar(100),
Dienthoai nvarchar(20),
Sophong float ,
Tongsoghe float
)
go
create table Phongchieu
(
Maphong nvarchar(50) primary key not null,
Marap nvarchar(50) REFERENCES Rap(Marap)  not null,
Tenphong nvarchar(50),
Tongsoghe float,
)
go

create table Hangsanxuat(
Mahangsx nvarchar(50) primary key not null,
Tenhangsx nvarchar(100),
)
go
create table Nuocsanxuat(
Manuocsx nvarchar(50) primary key not null ,
Tennuocsx nvarchar(100),
)
go

create table Giochieu (
Magiochieu nvarchar(50) primary key not null,
Marap nvarchar (50) references Rap(Marap) not null,
Dongia float
)
go
create table Ghe(
Maghe nvarchar(50) primary key not null,
Maphong nvarchar(50) references Phongchieu(Maphong) not null,
Marap nvarchar(50) references Rap(Marap) not null,

)
go

create table Theloai (
Matheloai nvarchar(50) primary key ,
Tentheloai nvarchar (100) 
)
go
create table Phim (
Maphim nvarchar(50) primary key not null ,
Tenphim nvarchar(100),
Mahangsanxuat nvarchar(50) REFERENCES Hangsanxuat(Mahangsx) not null,
Manuocsanxuat nvarchar(50) REFERENCES Nuocsanxuat(Manuocsx) not null,
Daodien nvarchar(50),
Matheloai nvarchar(50) REFERENCES Theloai(Matheloai) not null,
Ngaykhoichieu date ,
Ngayketthuc date ,
Nudienvienchinh nvarchar(80),
Namdienvienchinh nvarchar(80),
Noidungchinh nvarchar (200),
Tongchiphi float ,
Tongthu float ,
Anh nvarchar (200)
)
go
create table Lichchieu(
Maphim nvarchar(50) references Phim(Maphim) not null,
Mashow nvarchar(50) primary key not null,
Marap nvarchar(50) references rap(Marap) not null,
Maphong nvarchar(50) references PhongChieu(Maphong) not null,
Magiochieu nvarchar(50) references Giochieu(Magiochieu) not null,
Ngaychieu date ,
Giave float ,
Sovedaban float ,
Tongtien float 
)
go
create table Ve (
Mashow nvarchar(50) references Lichchieu(Mashow) not null,
Maghe nvarchar(50) references Ghe(Maghe) not null,
)
go
create table tbtUse
( ID nvarchar(50),
pass nvarchar(50)
)
select * from tbtUse
go




select * from Rap
select * from Phongchieu

go


UPDATE Rap
set [Sophong] = (select count (*) from Phongchieu where Marap=p.Marap)

from Rap p
go
create trigger rap2
on Phongchieu
after insert 
as
set nocount on
update Rap 
set Sophong = Sophong + s.dem
from Rap p join (select Marap ,count (*) as dem from inserted group by Marap) s
on p.Marap = s.Marap
go
select * from Phongchieu
select * from Rap
go


