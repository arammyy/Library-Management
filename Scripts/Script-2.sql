SELECT*FROM DEPT;
SELECT*FROM emp;

SELECT*FROM emp e, dept d
 WHERE e.DEPTNO=d.DEPTNO;
 
//부서별 사원 수를 출력
SELECT*FROM emp e, dept d
 WHERE e.DEPTNO=d.DEPTNO
 GROUP BY dname;