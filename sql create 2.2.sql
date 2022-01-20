create table LOPHOC 
(
MaLop char(10) primary key not null,
TenLop varchar(30),
CapDo char(5),
NgayBatDau date,
NgayKetThuc date
)
go

create table HOCVIEN
(
MaHocVien char(10) primary key not null,
TenHocVien varchar(30)
)
go
create table HOCVIEN_LOP
(
MaHocVien char(10),
MaLop char(10),
CapDo char(5)
foreign key (MaHocVien) references HOCVIEN(MaHocVien),
foreign key (MaLop) references LOPHOC(MaLop)
)
go
create table CAPDO
(
MaCapDo char(5) primary key not null,
MoTa text,
QuyDinh text
)
go
create table GIAOVIEN
(
MaGiaoVien char(10) primary key not null,
TenGiaoVien char(30),
Email char(30),
DiaChi char(30),
SDT char(20)
)
go
create table GIAOVIEN_LOP
(
MaGiaoVien char(10),
MaCapDo char(5),
TrangThai text,
foreign key (MaGiaoVien) references GIAOVIEN(MaGiaoVien),
foreign key (MaCapDo) references CAPDO(MaCapDo)
)
go