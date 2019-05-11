CREATE
	TABLE
		memo_member( member_id NUMBER NOT NULL,
		user_id varchar2(30) PRIMARY KEY,
		user_name VARCHAR2(30) NOT NULL,
		user_pw VARCHAR2(20) NOT NULL );
	
	DROP TABLE memo_member;

CREATE
	TABLE
		memo_data( data_id VARCHAR2(30) PRIMARY KEY,
		member_id VARCHAR2(30) NOT NULL,
		data_memo VARCHAR2(1000) NOT NULL,
		font_color VARCHAR2(30) NOT NULL,
		bg_color VARCHAR2(30) NOT NULL,
		img VARCHAR2(50) );

CREATE
	SEQUENCE memoMem_seq
START WITH
	1 INCREMENT BY 1;

CREATE
	SEQUENCE memoData_seq
START WITH
	1 INCREMENT BY 1;
	
INSERT INTO memo_member(
member_id, user_id, user_name, user_pw)
 values(memoMem_seq.nextval, 'ararar', 'ÀÌ¾Æ¶÷','1234');