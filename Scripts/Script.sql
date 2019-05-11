CREATE
	TABLE
		lib_book( book_id NUMBER PRIMARY KEY ,
		genre NUMBER ,
		book_name VARCHAR2(200) ,
		publisher NUMBER ,
		writer VARCHAR2(50));

DROP
	TABLE
		lib_book;

CREATE
	TABLE
		lib_book_Detail( barcode VARCHAR2(20) PRIMARY KEY ,
		book_id NUMBER ,
		book_state NUMBER ,
		book_regist_date VARCHAR2(20) ,
		rental_state NUMBER );

CREATE
	TABLE
		lib_book_state( book_state_id NUMBER PRIMARY KEY ,
		book_state VARCHAR2(20) NOT NULL );

INSERT
	INTO
		lib_book_state(book_state_id,
		book_state)
	VALUES(1,
	'����');

INSERT
	INTO
		lib_book_state(book_state_id,
		book_state)
	VALUES(2,
	'�н�');

INSERT
	INTO
		lib_book_state(book_state_id,
		book_state)
	VALUES(3,
	'�ļ�');

CREATE
	TABLE
		lib_publisher( publisher_id NUMBER PRIMARY KEY ,
		publisher VARCHAR2(20) );

INSERT
	INTO
		lib_publisher(publisher_id,
		publisher)
	VALUES(1,
	'zino1187');

INSERT
	INTO
		lib_publisher(publisher_id,
		publisher)
	VALUES(2,
	'google');

CREATE
	TABLE
		lib_genre( genre_id NUMBER PRIMARY KEY ,
		genre VARCHAR2(20) );

INSERT
	INTO
		lib_genre(genre_id,
		genre)
	VALUES(1,
	'����');

INSERT
	INTO
		lib_genre(genre_id,
		genre)
	VALUES(2,
	'�Ҽ�');

INSERT
	INTO
		lib_genre(genre_id,
		genre)
	VALUES(3,
	'������');

CREATE
	TABLE
		lib_book_request( req_id NUMBER PRIMARY KEY ,
		genre NUMBER ,
		book_name VARCHAR2(200) NOT NULL ,
		publisher VARCHAR2(50) ,
		writer VARCHAR2(30) NOT NULL ,
		request_date VARCHAR2(20) NOT NULL ,
		pay NUMBER ,
		member_id VARCHAR2(20) NOT NULL ,
		request_state NUMBER NOT NULL );

CREATE
	TABLE
		lib_rental_Table( rental_id NUMBER PRIMARY KEY ,
		rental_date VARCHAR2(50) DEFAULT TO_CHAR(SYSDATE, 'YYYY-MM-DD') NOT NULL ,
		member_id VARCHAR2(20) NOT NULL ,
		book_id NUMBER ,
		rental_state NUMBER );

SELECT
	*
FROM
	LIB_RENTAL_TABLE;

SELECT*FROM LIB_BOOK;

SELECT*FROM LIB_BOOK_DETAIL;

CREATE
	TABLE
		lib_request_state( request_state_id NUMBER PRIMARY KEY ,
		request_state VARCHAR2(20) NOT NULL );

INSERT
	INTO
		lib_request_state(request_state_id,
		request_state)
	VALUES(1,
	'ó����');

INSERT
	INTO
		lib_request_state(request_state_id,
		request_state)
	VALUES(2,
	'ó���Ϸ�');

CREATE
	TABLE
		lib_book_buy( buy_id NUMBER PRIMARY KEY ,
		genre NUMBER ,
		buy_bookname VARCHAR2(200) ,
		publisher NUMBER ,
		buy_writer VARCHAR2(200) ,
		buy_date VARCHAR2(20) ,
		buy_ea NUMBER ,
		buy_price VARCHAR2(40) ,
		buy_charge VARCHAR2(30) ,
		buy_state NUMBER );

CREATE
	SEQUENCE buy_seq
START WITH
	1 INCREMENT BY 1;

CREATE
	TABLE
		lib_buy_state( buy_state VARCHAR2(15) ,
		buy_state_id NUMBER PRIMARY KEY );

INSERT
	INTO
		lib_buy_state(buy_state,
		buy_state_id)
	VALUES('ó����',
	1);

INSERT
	INTO
		lib_buy_state(buy_state,
		buy_state_id)
	VALUES('ó���Ϸ�',
	2);

CREATE
	TABLE
		lib_member( mem_id VARCHAR2(20) PRIMARY KEY ,
		mem_name VARCHAR2(20) NOT NULL ,
		mem_password VARCHAR2(15) NOT NULL ,
		mem_birth VARCHAR2(8) NOT NULL ,
		mem_phone VARCHAR2(12) ,
		mem_addr VARCHAR2(200) ,
		mem_regist_date VARCHAR2(8) NOT NULL ,
		mem_state VARCHAR2(20) NOT NULL,
		mem_email VARCHAR2(40) );

CREATE
	TABLE
		lib_member_state( mem_state_id NUMBER PRIMARY KEY ,
		mem_state VARCHAR2(20) NOT NULL );

INSERT
	INTO
		lib_member_state(mem_state_id,
		mem_state)
	VALUES(1,
	'����');

INSERT
	INTO
		lib_member_state(mem_state_id,
		mem_state)
	VALUES(2,
	'��ü��');

INSERT
	INTO
		lib_member_state(mem_state_id,
		mem_state)
	VALUES(3,
	'��������');

INSERT
	INTO
		lib_member_state(mem_state_id,
		mem_state)
	VALUES(4,
	'����');

ALTER TABLE
	lib_book_request ADD (user_comment VARCHAR2(1500));

SELECT*FROM LIB_BOOK_DETAIL;

INSERT
	INTO
		lib_book(book_id,
		genre,
		book_name,
		publisher,
		writer)
	VALUES(seq_book.nextval,
	2,
	'�ڹ�å',
	2,
	'�ڹ����ǻ�');

INSERT
	INTO
		lib_book(book_id,
		genre,
		book_name,
		publisher,
		writer)
	VALUES(seq_book.nextval,
	1,
	'��Ƽ�̵�� ���',
	2,
	'�������ǻ�');

INSERT
	INTO
		lib_book(book_id,
		genre,
		book_name,
		publisher,
		writer)
	VALUES(seq_book.nextval,
	3,
	'��Ƽ�̵�� ó��',
	2,
	'��ó���ǻ�');

INSERT
	INTO
		lib_book(book_id,
		genre,
		book_name,
		publisher,
		writer)
	VALUES(seq_book.nextval,
	2,
	'�ڹ����α׷���',
	1,
	'�ڹ��ڹ����ǻ�');

INSERT
	INTO
		lib_book(book_id,
		genre,
		book_name,
		publisher,
		writer)
	VALUES(seq_book.nextval,
	2,
	'����',
	1,
	'�ڻ�');

INSERT
	INTO
		lib_book_Detail(barcode,
		book_id,
		book_state,
		book_regist_date,
		rental_state)
	VALUES('12',
	60,
	2,
	SYSDATE,
	2);

INSERT
	INTO
		lib_book_Detail(barcode,
		book_id,
		book_state,
		book_regist_date,
		rental_state)
	VALUES('23456789',
	54,
	2,
	'19990930',
	2);

INSERT
	INTO
		lib_book_Detail(barcode,
		book_id,
		book_state,
		book_regist_date,
		rental_state)
	VALUES('3456789',
	55,
	2,
	'19940918',
	2);

INSERT
	INTO
		lib_book_Detail(barcode,
		book_id,
		book_state,
		book_regist_date,
		rental_state)
	VALUES('456789',
	56,
	2,
	'19940813',
	2);

SELECT*FROM lib_book;

SELECT*FROM LIB_BOOK_DETAIL;

ALTER TABLE
	lib_book DROP
		COLUMN book_same_amount;

SELECT
	b.book_id,
	g.genre,
	b.book_name,
	p.publisher,
	b.writer,
	d.book_regist_date,
	s.book_state
FROM
	lib_book b,
	lib_genre g,
	lib_publisher p,
	lib_book_detail d,
	lib_book_state s
WHERE
	( b.genre = g.genre_id
	AND b.publisher = p.publisher_id
	AND b.book_id = d.book_id
	AND d.book_state = s.book_state_id
	AND s.book_state_id = 1
	AND d.rental_state IN(2,
	3))
ORDER BY
	book_id ASC
