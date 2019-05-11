
BEGIN FOR rec IN (
SELECT
	table_name
FROM
	user_tables
WHERE
	table_name LIKE '%LIB%') LOOP EXECUTE IMMEDIATE 'drop table ' || rec.table_name || ' cascade constraint';
END LOOP;
END;

CREATE
	TABLE
		lib_member_state( mem_state_id NUMBER PRIMARY KEY ,
		mem_state VARCHAR2(30) NOT NULL );

CREATE
	TABLE
		lib_rental_state( rental_state_id NUMBER PRIMARY KEY ,
		rental_state VARCHAR2(30) NOT NULL );

CREATE
	TABLE
		lib_book_state( book_state_id NUMBER PRIMARY KEY ,
		book_state VARCHAR2(30) NOT NULL );

CREATE
	TABLE
		lib_publisher( publisher_id NUMBER PRIMARY KEY ,
		publisher VARCHAR2(300) );

CREATE
	TABLE
		lib_genre( genre_id NUMBER PRIMARY KEY ,
		genre VARCHAR2(30) );

CREATE
	TABLE
		lib_request_state( request_state_id NUMBER PRIMARY KEY ,
		request_state VARCHAR2(30) NOT NULL );
	
CREATE
	TABLE
		lib_book( book_id NUMBER PRIMARY KEY ,
		genre NUMBER NOT NULL ,
		book_name VARCHAR2(300) NOT NULL ,
		publisher NUMBER NOT NULL ,
		writer VARCHAR2(300) );
	
CREATE
	TABLE
		lib_book_Detail( barcode NUMBER PRIMARY KEY ,
		book_id NUMBER NOT NULL ,
		book_state NUMBER NOT NULL ,
		book_regist_date VARCHAR2(20) DEFAULT TO_CHAR(SYSDATE, 'yyyymmdd') NOT NULL ,
		rental_state NUMBER NOT NULL );
	
CREATE
	TABLE
		lib_book_request( req_id NUMBER PRIMARY KEY ,
		genre NUMBER ,
		book_name VARCHAR2(300) NOT NULL ,
		publisher VARCHAR2(300) ,
		writer VARCHAR2(300) NOT NULL ,
		request_date VARCHAR2(20) DEFAULT TO_CHAR(SYSDATE, 'yyyymmdd') NOT NULL ,
		pay NUMBER ,
		member_id VARCHAR2(36) NOT NULL ,
		request_state NUMBER NOT NULL );

CREATE
	TABLE
		lib_rental_Table( rental_id NUMBER PRIMARY KEY ,
		rental_date VARCHAR2(20) DEFAULT TO_CHAR(SYSDATE, 'yyyymmdd') NOT NULL ,
		return_date VARCHAR2(20) DEFAULT TO_CHAR(SYSDATE + 15, 'yyyymmdd') ,
		member_id VARCHAR2(36) NOT NULL ,
		book_id NUMBER NOT NULL ,
		rental_state NUMBER NOT NULL );

CREATE
	TABLE
		lib_member( mem_id VARCHAR2(36) PRIMARY KEY ,
		mem_password VARCHAR2(20) NOT NULL ,
		mem_name VARCHAR2(30) NOT NULL ,
		mem_state NUMBER NOT NULL ,
		mem_birth VARCHAR2(8) NOT NULL ,
		mem_phone VARCHAR2(50) ,
		mem_addr VARCHAR2(300) ,
		mem_email VARCHAR2(150) ,
		mem_regist_date VARCHAR2(20) DEFAULT TO_CHAR(SYSDATE, 'yyyymmdd') NOT NULL ,
		mem_overdue VARCHAR2(20) );

CREATE
	TABLE
		lib_book_buy( buy_id NUMBER PRIMARY KEY ,
		genre NUMBER ,
		buy_bookname VARCHAR2(300) NOT NULL ,
		publisher NUMBER NOT NULL ,
		buy_writer VARCHAR2(300) NOT NULL ,
		buy_date VARCHAR2(20) DEFAULT TO_CHAR(SYSDATE, 'yyyymmdd') ,
		buy_ea NUMBER NOT NULL ,
		buy_price VARCHAR2(40) ,
		buy_charge VARCHAR2(30) ,
		buy_state NUMBER );

CREATE
	TABLE
		lib_buy_state( buy_state_id NUMBER PRIMARY KEY ,
		buy_state VARCHAR2(15) NOT NULL );

CREATE
	TABLE
		lib_memo( book_id NUMBER UNIQUE ,
		officer VARCHAR2(30) ,
		reason VARCHAR2(90) ,
		detail VARCHAR2(900) );

INSERT
	INTO
		lib_buy_state(buy_state,
		buy_state_id)
	VALUES('贸府吝',
	1);

INSERT
	INTO
		lib_buy_state(buy_state,
		buy_state_id)
	VALUES('贸府肯丰',
	2);
