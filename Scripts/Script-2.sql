SELECT*FROM DEPT;
SELECT*FROM emp;

SELECT*FROM emp e, dept d
 WHERE e.DEPTNO=d.DEPTNO;
 
//�μ��� ��� ���� ���
SELECT*FROM emp e, dept d
 WHERE e.DEPTNO=d.DEPTNO
 GROUP BY dname;