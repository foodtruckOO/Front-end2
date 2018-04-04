
/* Drop Tables */

DROP TABLE EVENT CASCADE CONSTRAINTS;
DROP TABLE ADMINISTRATOR CASCADE CONSTRAINTS;
DROP TABLE C_BOARD_COMMENT CASCADE CONSTRAINTS;
DROP TABLE C_BOARD CASCADE CONSTRAINTS;
DROP TABLE ORDERFORM CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE FOOD CASCADE CONSTRAINTS;
DROP TABLE FOODTRUCKS CASCADE CONSTRAINTS;
DROP TABLE FOODTYPE CASCADE CONSTRAINTS;
DROP TABLE IMAGES CASCADE CONSTRAINTS;
DROP TABLE MYSITE CASCADE CONSTRAINTS;
DROP TABLE PAYMENT CASCADE CONSTRAINTS;
DROP TABLE S_BOARD_COMMENT CASCADE CONSTRAINTS;
DROP TABLE S_BOARD CASCADE CONSTRAINTS;
DROP TABLE TRUCKPAGE CASCADE CONSTRAINTS;
DROP TABLE TRUCK_EVENT CASCADE CONSTRAINTS;
DROP TABLE SELLER CASCADE CONSTRAINTS;
DROP TABLE SNS CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_ADMIN;
DROP SEQUENCE SEQ_CUS;
DROP SEQUENCE SEQ_C_BOARD;
DROP SEQUENCE SEQ_EVENT;
DROP SEQUENCE SEQ_F_NO;
DROP SEQUENCE SEQ_REVIEW;
DROP SEQUENCE SEQ_SEL;
DROP SEQUENCE SEQ_S_BOARD;




/* Create Sequences */

CREATE SEQUENCE SEQ_ADMIN;
CREATE SEQUENCE SEQ_CUS START WITH 100000;
CREATE SEQUENCE SEQ_C_BOARD;
CREATE SEQUENCE SEQ_EVENT;
CREATE SEQUENCE SEQ_F_NO;
CREATE SEQUENCE SEQ_REVIEW;
CREATE SEQUENCE SEQ_SEL START WITH 200000;
CREATE SEQUENCE SEQ_S_BOARD;



/* Create Tables */

CREATE TABLE ADMINISTRATOR
(
	A_NO number NOT NULL,
	ID varchar2(10) NOT NULL UNIQUE,
	PWD varchar2(200) NOT NULL,
	GRADE number(2) NOT NULL,
	EMAIL nvarchar2(25) NOT NULL,
	PRIMARY KEY (A_NO)
);


CREATE TABLE CUSTOMER
(
	G_NO number NOT NULL,
	ID varchar2(10) NOT NULL UNIQUE,
	PWD varchar2(200) NOT NULL,
	NAME nvarchar2(10) NOT NULL,
	tel nvarchar2(15) NOT NULL,
	REGIDATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (G_NO)
);


CREATE TABLE C_BOARD
(
	CB_NO number NOT NULL,
	G_NO number NOT NULL,
	TITLE nvarchar2(30) NOT NULL,
	CONTENT nvarchar2(2000) NOT NULL,
	ATTACHEDFILE varchar2(100),
	POSTDATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (CB_NO)
);


CREATE TABLE C_BOARD_COMMENT
(
	CRB_NO number NOT NULL,
	G_NO number NOT NULL,
	CB_NO number NOT NULL,
	COMMEN nvarchar2(500) NOT NULL,
	CPOSTDATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (CRB_NO)
);


-- 지역 행사
-- 
-- 홈페이지 이벤트
CREATE TABLE EVENT
(
	-- 이벤트 게시물 no
	ENO number NOT NULL,
	A_NO number NOT NULL,
	TITLE nvarchar2(30) NOT NULL,
	CONTENT nvarchar2(2000) NOT NULL,
	TITLEFILE varchar2(100) NOT NULL,
	CONTENTFILE varchar2(100),
	S_DATE date DEFAULT SYSDATE NOT NULL,
	E_DATE date DEFAULT SYSDATE NOT NULL,
	POSTDATE date DEFAULT SYSDATE NOT NULL,
	-- 1=메인
	-- 2=지역
	BOARDTYPE number DEFAULT 1,
	PRIMARY KEY (ENO)
);


CREATE TABLE FOOD
(
	F_NO number NOT NULL,
	S_NO number NOT NULL,
	T_NO number NOT NULL,
	FNAME nvarchar2(20) NOT NULL,
	CONTENT nvarchar2(1000) NOT NULL,
	PICTURE varchar2(200),
	PRICE number(7) NOT NULL,
	PRIMARY KEY (F_NO)
);


CREATE TABLE FOODTRUCKS
(
	F_NO number NOT NULL,
	TNAME nvarchar2(15) NOT NULL,
	ADDR nvarchar2(50) NOT NULL,
	ADDR2 nvarchar2(50) NOT NULL,
	TEL nvarchar2(15) NOT NULL,
	CORPORATE_NO nvarchar2(12) NOT NULL,
	PRIMARY KEY (F_NO)
);


CREATE TABLE FOODTYPE
(
	T_NO number NOT NULL,
	TYPE nvarchar2(20) NOT NULL,
	PRIMARY KEY (T_NO)
);


CREATE TABLE IMAGES
(
	S_NO number NOT NULL,
	IMG varchar2(200)
);


CREATE TABLE MYSITE
(
	S_NO number NOT NULL,
	SNS_NO number NOT NULL,
	PATH varchar2(100) NOT NULL
);


CREATE TABLE ORDERFORM
(
	O_NO number NOT NULL,
	G_NO number NOT NULL,
	F_NO number NOT NULL,
	NUM number DEFAULT 1 NOT NULL,
	timeOfReceipt varchar2(10) NOT NULL,
	CONTENT nvarchar2(500),
	POSTDATE date DEFAULT SYSDATE NOT NULL
);


CREATE TABLE PAYMENT
(
	PAY_NO number NOT NULL,
	PAYDATE date DEFAULT SYSDATE NOT NULL,
	-- 주문(ORDER) TABLE에서 같은 주문번호키만 가져와
	-- 주문의 총 금액을 계산한다
	-- 
	-- 페이지에서 뿌려줄 때는 ORDER TABLE과 PAY TABLE을 함께 이용해서 나의 내역을 확인한다.
	O_NO varchar2(10) NOT NULL,
	PRIMARY KEY (PAY_NO)
);


CREATE TABLE REVIEW
(
	R_NO number NOT NULL,
	S_NO number NOT NULL,
	G_NO number NOT NULL,
	STAR number(2) NOT NULL,
	onememo nvarchar2(500) NOT NULL,
	-- 작성일
	POSTDATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (R_NO)
);


CREATE TABLE SELLER
(
	S_NO number NOT NULL,
	ID varchar2(10) NOT NULL UNIQUE,
	PWD varchar2(200) NOT NULL,
	NAME nvarchar2(10) NOT NULL,
	TNAME nvarchar2(15) NOT NULL,
	ADDR nvarchar2(50) NOT NULL,
	-- 상세주소
	ADDR2 nvarchar2(50),
	TEL nvarchar2(15) NOT NULL,
	CORPORATE_NO nvarchar2(12) NOT NULL,
	REGIDATE date NOT NULL,
	PRIMARY KEY (S_NO)
);


CREATE TABLE SNS
(
	SNS_NO number NOT NULL,
	SNS nvarchar2(10) NOT NULL,
	PRIMARY KEY (SNS_NO)
);


CREATE TABLE S_BOARD
(
	SB_NO number NOT NULL,
	S_NO number NOT NULL,
	TITLE nvarchar2(30) NOT NULL,
	CONTENT nvarchar2(2000) NOT NULL,
	ATTACHEDFILE varchar2(100),
	POSTDATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (SB_NO)
);


CREATE TABLE S_BOARD_COMMENT
(
	SBC_NO number NOT NULL,
	S_NO number NOT NULL,
	SB_NO number NOT NULL,
	COMMEN nvarchar2(500) NOT NULL,
	CPOSTDATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (SBC_NO)
);


CREATE TABLE TRUCKPAGE
(
	S_NO number NOT NULL,
	INTRO nvarchar2(500) NOT NULL,
	MAIN_IMG varchar2(100) NOT NULL,
	BACK_IMG varchar2(100) NOT NULL
);


CREATE TABLE TRUCK_EVENT
(
	-- 이벤트 게시물 no
	ENO number NOT NULL,
	S_NO number NOT NULL,
	TITLE nvarchar2(30) NOT NULL,
	CONTENT nvarchar2(2000) NOT NULL,
	TITLEFILE varchar2(100) NOT NULL,
	CONTENTFILE varchar2(100) NOT NULL,
	S_DATE date DEFAULT SYSDATE NOT NULL,
	E_DATE date DEFAULT SYSDATE NOT NULL,
	POSTDATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (ENO)
);



/* Create Foreign Keys */

ALTER TABLE EVENT
	ADD FOREIGN KEY (A_NO)
	REFERENCES ADMINISTRATOR (A_NO)
	ON DELETE CASCADE
;


ALTER TABLE C_BOARD
	ADD FOREIGN KEY (G_NO)
	REFERENCES CUSTOMER (G_NO)
	ON DELETE CASCADE
;


ALTER TABLE C_BOARD_COMMENT
	ADD FOREIGN KEY (G_NO)
	REFERENCES CUSTOMER (G_NO)
	ON DELETE CASCADE
;


ALTER TABLE ORDERFORM
	ADD FOREIGN KEY (G_NO)
	REFERENCES CUSTOMER (G_NO)
	ON DELETE CASCADE
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (G_NO)
	REFERENCES CUSTOMER (G_NO)
	ON DELETE CASCADE
;


ALTER TABLE C_BOARD_COMMENT
	ADD FOREIGN KEY (CB_NO)
	REFERENCES C_BOARD (CB_NO)
	ON DELETE CASCADE
;


ALTER TABLE ORDERFORM
	ADD FOREIGN KEY (F_NO)
	REFERENCES FOOD (F_NO)
	ON DELETE CASCADE
;


ALTER TABLE FOOD
	ADD FOREIGN KEY (T_NO)
	REFERENCES FOODTYPE (T_NO)
	ON DELETE CASCADE
;


ALTER TABLE FOOD
	ADD FOREIGN KEY (S_NO)
	REFERENCES SELLER (S_NO)
	ON DELETE CASCADE
;


ALTER TABLE IMAGES
	ADD FOREIGN KEY (S_NO)
	REFERENCES SELLER (S_NO)
	ON DELETE CASCADE
;


ALTER TABLE MYSITE
	ADD FOREIGN KEY (S_NO)
	REFERENCES SELLER (S_NO)
	ON DELETE CASCADE
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (S_NO)
	REFERENCES SELLER (S_NO)
	ON DELETE CASCADE
;


ALTER TABLE S_BOARD
	ADD FOREIGN KEY (S_NO)
	REFERENCES SELLER (S_NO)
	ON DELETE CASCADE
;


ALTER TABLE S_BOARD_COMMENT
	ADD FOREIGN KEY (S_NO)
	REFERENCES SELLER (S_NO)
	ON DELETE CASCADE
;


ALTER TABLE TRUCKPAGE
	ADD FOREIGN KEY (S_NO)
	REFERENCES SELLER (S_NO)
	ON DELETE CASCADE
;


ALTER TABLE TRUCK_EVENT
	ADD FOREIGN KEY (S_NO)
	REFERENCES SELLER (S_NO)
	ON DELETE CASCADE
;

 
ALTER TABLE MYSITE
	ADD FOREIGN KEY (SNS_NO)
	REFERENCES SNS (SNS_NO)
	ON DELETE CASCADE
;


ALTER TABLE S_BOARD_COMMENT
	ADD FOREIGN KEY (SB_NO)
	REFERENCES S_BOARD (SB_NO)
	ON DELETE CASCADE
;



/* Comments */

COMMENT ON TABLE EVENT IS '지역 행사

홈페이지 이벤트';
COMMENT ON COLUMN EVENT.ENO IS '이벤트 게시물 no';
COMMENT ON COLUMN EVENT.BOARDTYPE IS '1=메인
2=지역';
COMMENT ON COLUMN PAYMENT.O_NO IS '주문(ORDER) TABLE에서 같은 주문번호키만 가져와
주문의 총 금액을 계산한다

페이지에서 뿌려줄 때는 ORDER TABLE과 PAY TABLE을 함께 이용해서 나의 내역을 확인한다.';
COMMENT ON COLUMN REVIEW.POSTDATE IS '작성일';
COMMENT ON COLUMN SELLER.ADDR2 IS '상세주소';
COMMENT ON COLUMN TRUCK_EVENT.ENO IS '이벤트 게시물 no';



