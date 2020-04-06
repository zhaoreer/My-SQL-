--第9章 视图和索引
1、什么是视图？
是从一个或者是多个基本表或视图中导出的虚表。
数据库中只存放视图的定义，视图对应的数据存放在基本表中。
对视图可以进行select，update，insert， delete操作。
对视图的操作，都会转换为对基本表的操作。
并不是所有的视图都可以更新。
当基本表中的数据发生改变，通过视图看到的数据也会发生改变。

2、为什么要使用视图？
(1)可以简化查询操作
(2)提高数据的安全性

3、如何使用视图？
例1：建立信息系学生的视图
CREATE VIEW vwIS_Student 
AS
  SELECT Sno, Sname, Sage
  FROM Student
  WHERE Sdept = 'IS'

例2：建立信息系学生的视图，并要求进行修改和插入操作时仍须保证该视图只有IS系的学生 
--由于在定义IS_Student视图时加上了WITH CHECK OPTION子句，以后对该视图进行插入、
--修改和删除操作时，DBMS会自动加上Sdept='IS'的条件
CREATE VIEW vwIS_Student 
AS
   SELECT Sno, Sname, Sage
   FROM Student
   WHERE Sdept = 'IS'
   WITH CHECK OPTION

--select视图
select * from csStudent
select * from Student
--insert视图
insert into csStudent values('2017007', 'wtq', '女', 20, 'cs')
insert into csStudent values('2017008', 'lyc', '男', 18, 'ma')

insert into csStudent values('2017009', 'ldf', '女', 20, 'cs')
insert into csStudent values('2017006', 'gc', '男', 20, 'ma')

例3：建立IS系选修了2号课程的学生的视图
CREATE VIEW vwIS_S1 
AS
    SELECT Student.Sno, Sname, Grade
    FROM Student, SC
   WHERE Student.Sno = SC.Sno AND Cno = '2' and Sdept = 'IS'

例4：建立IS系选修了2号课程且成绩在90分以上的学生的视图
CREATE VIEW vwIS_S2 
AS
   SELECT Sno, Sname, Grade
   FROM IS_S1
   WHERE Grade > 90

例5：定义一个反映学生出生年份的视图
CREATE VIEW vwYear
AS
   SELECT Sno, Sname, Year(GetDate()) - Sage 出生年份  
   FROM Student

例6：将学生的学号及他的平均成绩定义为一个视图 
CREATE VIEW vwS_G 
AS
  SELECT Sno, AVG(Grade) avgGrade
  FROM SC
  GROUP BY Sno

例7：在信息系学生的视图中找出年龄小于20岁的学生
SELECT * FROM vwIS_Student
WHERE Sage < 20

例8：查询信息系选修了2号课程且成绩在90分以上的学生
SELECT * FROM vwIS_S2

例9：将信息系学生视图vwIS_Student中学号为2017002的学生姓名改为“刘成”
UPDATE  vwIS_Student 
SET Sname = '刘成'
WHERE Sno = '2017002'

例10：删除信息系学生视图vwIS_Student中学号为2017004的学生
DELETE FROM vwIS_Student
WHERE Sno = '2017004'

例11：不可更新的视图
CREATE VIEW vwS_G AS
  SELECT Sno, AVG(Grade) avgGrade
  FROM SC
  GROUP BY Sno
--更新该视图，提示错误：此视图的数据操纵操作非法
UPDATE vwS_G SET avgGrade = 66 WHERE Sno = '2017002'

例12：删除视图S_G
DROP VIEW S_G

