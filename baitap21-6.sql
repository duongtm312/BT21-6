create database quanlydiem;
create table khoa(
Makhoa int primary key,
Tenkhoa varchar(50) not null
);
create table lop(
Malop int primary key,
Tenlop varchar(50) not null,
Makhoa int,
   FOREIGN KEY (Makhoa) REFERENCES khoa(Makhoa)
);
create table SinhVien(
Masv int primary key,
name varchar(50)  not null,
birth date not null,
hocb varchar(50),
gender varchar(10) not null,
Malop int,
 FOREIGN KEY (Malop) REFERENCES lop(Malop)
);
create table Monhoc(
Mamh int primary key,
Tenmh varchar(50) not null,
Sotiet int not null
);
create table ketqua(
diem int not null,
Mamh int,
Masv int,
FOREIGN KEY (Mamh) REFERENCES Monhoc(Mamh),
FOREIGN KEY (Masv) REFERENCES SinhVien(Masv)
);
INSERT INTO `quanlydiem`.`khoa` (`Makhoa`, `Tenkhoa`) VALUES ('1', 'Kinh tế');
INSERT INTO `quanlydiem`.`khoa` (`Makhoa`, `Tenkhoa`) VALUES ('2', 'CNTT');
INSERT INTO `quanlydiem`.`khoa` (`Makhoa`, `Tenkhoa`) VALUES ('3', 'Logitic');
INSERT INTO `quanlydiem`.`khoa` (`Makhoa`, `Tenkhoa`) VALUES ('4', 'Xây dưng');
INSERT INTO `quanlydiem`.`lop` (`Malop`, `Tenlop`, `Makhoa`) VALUES ('1', 'Kinh tế 1', '1');
INSERT INTO `quanlydiem`.`lop` (`Malop`, `Tenlop`, `Makhoa`) VALUES ('2', 'CNTT_1', '2');
INSERT INTO `quanlydiem`.`lop` (`Malop`, `Tenlop`, `Makhoa`) VALUES ('3', 'Logitic_1', '3');
INSERT INTO `quanlydiem`.`lop` (`Malop`, `Tenlop`, `Makhoa`) VALUES ('4', 'Xây dưng gia đình', '4');
INSERT INTO `quanlydiem`.`sinhvien` (`Masv`, `name`, `birth`, `hocb`, `gender`, `Malop`) VALUES ('1', 'Trần Minh Dương', '1999/1/2', 'xuat sac', 'nam', '1');
INSERT INTO `quanlydiem`.`sinhvien` (`Masv`, `name`, `birth`, `hocb`, `gender`, `Malop`) VALUES ('2', 'NGuyễn thị nga', '199/12/1', 'gioi', 'nu', '1');
INSERT INTO `quanlydiem`.`sinhvien` (`Masv`, `name`, `birth`, `hocb`, `gender`, `Malop`) VALUES ('3', 'Le thi linh', '1998/2/2', 'kha', 'nu', '2');
INSERT INTO `quanlydiem`.`sinhvien` (`Masv`, `name`, `birth`, `hocb`, `gender`, `Malop`) VALUES ('4', 'Phan van tuong', '1995/6/3', 'gioi', 'nam', '4');
INSERT INTO `quanlydiem`.`monhoc` (`Mamh`, `Tenmh`, `Sotiet`) VALUES ('1', 'Toán', '12');
INSERT INTO `quanlydiem`.`monhoc` (`Mamh`, `Tenmh`, `Sotiet`) VALUES ('2', 'Văn', '10');
INSERT INTO `quanlydiem`.`monhoc` (`Mamh`, `Tenmh`, `Sotiet`) VALUES ('3', 'Triết', '30');
UPDATE `quanlydiem`.`sinhvien` SET `hocb` = '100' WHERE (`Masv` = '1');
UPDATE `quanlydiem`.`sinhvien` SET `hocb` = '200' WHERE (`Masv` = '2');
UPDATE `quanlydiem`.`sinhvien` SET `hocb` = '300' WHERE (`Masv` = '3');
UPDATE `quanlydiem`.`sinhvien` SET `hocb` = '400' WHERE (`Masv` = '4');
ALTER TABLE `quanlydiem`.`sinhvien` 
CHANGE COLUMN `hocb` `hocb` INT NULL DEFAULT NULL ;

-- cau5
select * from Sinhvien where name like'Trần%';
-- cau6
select*from sinhvien where gender='nu' and hocb <>9;
-- cau8 
select * from Sinhvien where year(birth) between 1998 and 1999 ;
-- cau9
select * from Sinhvien order by Masv;
-- cau14
select lop.Tenlop, count(sinhvien.Masv) as 'Số sinh viên' from lop join Sinhvien on lop.Malop = Sinhvien.Malop group by lop.Tenlop;
-- cau15
select khoa.Tenkhoa, count(sinhvien.Masv) as 'Số sinh viên' from khoa join lop on khoa.Makhoa = lop.Makhoa 
join Sinhvien on lop.Malop = Sinhvien.Malop  group by khoa.Tenkhoa;
-- cau16
select khoa.Tenkhoa, count(sinhvien.Masv) as 'Số sinh viên' from khoa join lop on khoa.Makhoa = lop.Makhoa 
join Sinhvien on lop.Malop = Sinhvien.Malop where sinhvien.gender='nu' group by khoa.Tenkhoa;
-- cau 17
select lop.Tenlop, sum(sinhvien.hocb) as 'Số sinh viên' from lop join Sinhvien on lop.Malop = Sinhvien.Malop group by lop.Tenlop;
-- cau18
select khoa.Tenkhoa, sum(sinhvien.hocb) as 'Số sinh viên' from khoa join lop on khoa.Makhoa = lop.Makhoa 
join Sinhvien on lop.Malop = Sinhvien.Malop  group by khoa.Tenkhoa;
-- cau19
select khoa.Tenkhoa, count(sinhvien.Masv) as 'Số sinh viên' from khoa join lop on khoa.Makhoa = lop.Makhoa 
join Sinhvien on lop.Malop = Sinhvien.Malop  group by khoa.Tenkhoa having count(sinhvien.Masv)>1;
-- cau 20
select khoa.Tenkhoa, count(sinhvien.Masv) as 'Số sinh viên' from khoa join lop on khoa.Makhoa = lop.Makhoa 
join Sinhvien on lop.Malop = Sinhvien.Malop where sinhvien.gender='nu' group by khoa.Tenkhoa  having count(sinhvien.Masv)>1;
select *  from sinhvien where  hocb = (select max(hocb) From sinhvien);