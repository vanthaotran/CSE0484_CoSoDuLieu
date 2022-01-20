-- query tren lop (group by)

-- 1. ma ncc vua ban p1 vua ban p2
(select s# from dbo.sp 
where p# = 'p1')
intersect
(select s# from dbo.sp 
where p# = 'p2')
-- 2. ma ncc chua ban mat hang nao
(select s# from s)
minus
(select s# from sp)
-- 3. ma ncc vua ban p1 vua ban p2
select s# from sp as sp1, sp as sp2
where (sp1.p# = 'p1') and (sp2.p# = 'p2') and (sp1.s# = sp2.s#)
-- 4.
select s# from sp
group by s#
-- where set(p#) contain {'p1','p2} ? 

-- 5. dem co bnhieu ncc co dia chi HN ban p1
select COUNT(s#) from sp,s
where (s.s#=sp.s#) and (scity = 'HN') and (sp.p# = 'p1')

-- 6.ten ncc vua ban mat hang xanh, vua ban mat hang do
select s# from s
where s# in
	(
	select s# from sp
	where p# in
		(
		select p# from p where pcolor = 'red'
		)
	)
	intersect
	(
	select s# from sp
	where p# in
		(
		select p# from p where pcolor = 'blue'
		)
	)
-- 7. ten ncc vua ban mat hang xanh, vua ban mat hang do
select s# from s
where s# in
	(
	select s# from sp
	where p# in
		(
		select p# from p where pcolor = 'red'
		)
	)
intersect
select s# from s
where s# in
	(
	select s# from sp
	where p# in
		(
		select p# from p where pcolor = 'red'
		)
	)

-- 8. in ra so tien cua ban ghi duoc ban lon nhat
select MAX(quantity*price) from sp

-- 9. in ra ma ncc ma ban max
select p# from sp
where (quantity*price) = max(quantity*price)

-- 10. in danh sach ma ncc ma ban trong nam 2021
select s# from sp 
where YEAR(date)=2021

-- 11. ten mat hang nao da duoc ban trong 2021
select pname from p
where p# in
	(
	select p# from sp where YEAR(date) = 2021
	)

-- 12. cho biet ten ncc bat day = 'H'
select s# from s
where (LEFT(sname,1) = 'H') or (LEFT(sname,1) = 'h')

-- 13. cho biet ten ncc da ban mat hang co xuat xu o tpho
-- bat dau = 'H'
select sname from s
where s# in
	(
	select s# from sp
	where p# in
		(
		select p# from p 
		where (LEFT(pcity,1) = 'H') or (LEFT(pcity,1) = 'h')
		)
	)

-- 14. ten ncc ban nhieu mat hang nhat
select sname from s
where s# in
	(
	select s# from sp
	where ......
	)

-- 15.