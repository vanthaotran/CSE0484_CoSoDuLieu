select sname from dbo.s

-- ten mat hang mau xanh, trong luong 5-10
select pname from dbo.p where pcolor='blue' and pweight between 5 and 10

--  in thong tin tat ca cac nha cc o hn
select * from dbo.s where scity='ha noi'

-- ma mat hang da ban voi lan mua thanh tien  > 50
select p# from dbo.sp where price*quantity>50

-- cho biet ma va ten cua ncc co ho Nguyen
select s#,sname from dbo.s where sname like 'Nguyen%'

-- in ra ma va ten cua mat hang co kitu thu 3 la 'k'
select p#, pname from dbo.p where pname like '__k%'

-- cho biet ten mat hang ban boi mcc ma s1
select pname from dbo.p, dbo.sp where p.p#=sp.p# and s#='s1'

-- cho biet ten ncc nao cung cap mat hang co xuat xu o quang ninh, weight>10
select sname 
from dbo.s,dbo.p,dbo.sp 
where (p.p#=sp.p#) and (s.s#=sp.s#) and  pcity='quang ninh' and pweight>10

--1. Cho biết mã, tên nhà cung cấp có tên là 'Hoa'
select s#, sname from dbo.s where sname='Hoa'

--2. Cho biết mã những NCC bán mặt hàng mã 'P5' và có màu 'Xanh'
select s# from dbo.s, dbo.p, dbo.sp 
where  (p.p#=sp.p#) and (s.s#=sp.s# and  (p#='P5') and (pcolor='Xanh')

--3. Cho biết danh sách tên những NCC bán những mặt hàng xuất xứ ở 'Quảng Ninh' 
--    trong ngày 15/3/2021
select sname from dbo.s, dbo.p,dbo.sp
where (p.p#=sp.p#) and (s.s#=sp.s#) and (pcity='Quảng Ninh') and (date='2001-03-15')



-- bang can bo va phong ban

-- 1 can bo 05 lam o phong nao
select tenphongban from phongban
where maphongban in
	select phong
	from canbo
	where macanbo='05';

-- 2 truong phong của PĐT ten la gì
select tencanbo from canbo
where phong in
	select tentruongphong
	from phongban
	where tenphongban='Phong Dao Tao'

-- 3 danh sach ten all cac can bo lam viec o phong co ma P01
select tencanbo from canbo
where phong in
	select maphongban
	from phongban
	where maphongban='01'

-- 4 in dsach ma, ten, nam sinh cua all can bo co sinh nhat thang 3
--		ngay sinh theo mau dd/mm//yyyy
-- note: ngaysinh co kieu DL la date => co kieu bieu dien la yyyy
select FORMAT(GETDATE(),'dd/mm/yyy') as date
select macanbo, tencanbo, extract(year from ngaysinh) from canbo
where (date like'__/03/____%')

-- 5 cho biet ten cua truong phong cua nhan vien co ma 'CB01'
select tentruongphong from phongban
where tentruongphong in
	select macanbo,tencanbo
	from canbo
	where macanbo='CB01'