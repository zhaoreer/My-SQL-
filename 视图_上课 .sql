--��9�� ��ͼ������
1��ʲô����ͼ��
�Ǵ�һ�������Ƕ�����������ͼ�е��������
���ݿ���ֻ�����ͼ�Ķ��壬��ͼ��Ӧ�����ݴ���ڻ������С�
����ͼ���Խ���select��update��insert�� delete������
����ͼ�Ĳ���������ת��Ϊ�Ի�����Ĳ�����
���������е���ͼ�����Ը��¡�
���������е����ݷ����ı䣬ͨ����ͼ����������Ҳ�ᷢ���ı䡣

2��ΪʲôҪʹ����ͼ��
(1)���Լ򻯲�ѯ����
(2)������ݵİ�ȫ��

3�����ʹ����ͼ��
��1��������Ϣϵѧ������ͼ
CREATE VIEW vwIS_Student 
AS
  SELECT Sno, Sname, Sage
  FROM Student
  WHERE Sdept = 'IS'

��2��������Ϣϵѧ������ͼ����Ҫ������޸ĺͲ������ʱ���뱣֤����ͼֻ��ISϵ��ѧ�� 
--�����ڶ���IS_Student��ͼʱ������WITH CHECK OPTION�Ӿ䣬�Ժ�Ը���ͼ���в��롢
--�޸ĺ�ɾ������ʱ��DBMS���Զ�����Sdept='IS'������
CREATE VIEW vwIS_Student 
AS
   SELECT Sno, Sname, Sage
   FROM Student
   WHERE Sdept = 'IS'
   WITH CHECK OPTION

--select��ͼ
select * from csStudent
select * from Student
--insert��ͼ
insert into csStudent values('2017007', 'wtq', 'Ů', 20, 'cs')
insert into csStudent values('2017008', 'lyc', '��', 18, 'ma')

insert into csStudent values('2017009', 'ldf', 'Ů', 20, 'cs')
insert into csStudent values('2017006', 'gc', '��', 20, 'ma')

��3������ISϵѡ����2�ſγ̵�ѧ������ͼ
CREATE VIEW vwIS_S1 
AS
    SELECT Student.Sno, Sname, Grade
    FROM Student, SC
   WHERE Student.Sno = SC.Sno AND Cno = '2' and Sdept = 'IS'

��4������ISϵѡ����2�ſγ��ҳɼ���90�����ϵ�ѧ������ͼ
CREATE VIEW vwIS_S2 
AS
   SELECT Sno, Sname, Grade
   FROM IS_S1
   WHERE Grade > 90

��5������һ����ӳѧ��������ݵ���ͼ
CREATE VIEW vwYear
AS
   SELECT Sno, Sname, Year(GetDate()) - Sage �������  
   FROM Student

��6����ѧ����ѧ�ż�����ƽ���ɼ�����Ϊһ����ͼ 
CREATE VIEW vwS_G 
AS
  SELECT Sno, AVG(Grade) avgGrade
  FROM SC
  GROUP BY Sno

��7������Ϣϵѧ������ͼ���ҳ�����С��20���ѧ��
SELECT * FROM vwIS_Student
WHERE Sage < 20

��8����ѯ��Ϣϵѡ����2�ſγ��ҳɼ���90�����ϵ�ѧ��
SELECT * FROM vwIS_S2

��9������Ϣϵѧ����ͼvwIS_Student��ѧ��Ϊ2017002��ѧ��������Ϊ�����ɡ�
UPDATE  vwIS_Student 
SET Sname = '����'
WHERE Sno = '2017002'

��10��ɾ����Ϣϵѧ����ͼvwIS_Student��ѧ��Ϊ2017004��ѧ��
DELETE FROM vwIS_Student
WHERE Sno = '2017004'

��11�����ɸ��µ���ͼ
CREATE VIEW vwS_G AS
  SELECT Sno, AVG(Grade) avgGrade
  FROM SC
  GROUP BY Sno
--���¸���ͼ����ʾ���󣺴���ͼ�����ݲ��ݲ����Ƿ�
UPDATE vwS_G SET avgGrade = 66 WHERE Sno = '2017002'

��12��ɾ����ͼS_G
DROP VIEW S_G

