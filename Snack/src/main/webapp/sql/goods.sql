--DB 초기화
drop table review;
drop table detail;
drop table orders;
drop table cart;
drop table goods;
drop table member;

drop sequence detail_seq;
drop sequence cart_seq;
drop sequence review_seq;

--ERDCloud
CREATE TABLE member (
	member_code	varchar2(100)		NOT NULL,
	id	varchar2(100)		NULL,
	pw	varchar2(100)		NULL,
	member_name	varchar2(100)		NULL,
	member_phone	varchar2(100)		NULL,
	member_address	varchar2(100)		NULL,
	email	varchar2(100)		NULL
);

CREATE TABLE goods (
	goods_code	varchar2(100)		NOT NULL,
	goods_name	varchar2(100)		NULL,
	company	varchar2(100)		NULL,
	price	number		NULL,
	category	varchar2(100)		NULL,
	thumb_image	varchar2(100)		NULL,
	detail_image	varchar2(100)		NULL
);

CREATE TABLE orders (
	order_code	varchar2(100)		NOT NULL,
	member_code	varchar2(100)		NULL,
	order_date	varchar2(100)		NULL,
	order_address	varchar2(500)		NULL,
	order_name	varchar2(100)		NULL,
	order_phone	varchar2(100)		NULL,
	memo	varchar2(500)		NULL,
	delivery_fee	number		NULL,
	total_price	number		NULL
);

CREATE TABLE review (
	review_code	number		NOT NULL,
	goods_code	varchar2(100)		NOT NULL,
	title	varchar2(500)		NULL,
	content	clob		NULL,
	stars	number		NULL,
	review_date	varchar2(100)		NULL
);

CREATE TABLE cart (
	cart_code	number		NOT NULL,
	goods_code	varchar2(100)		NOT NULL,
	member_code	varchar2(100)		NULL,
	quantity	number		NULL
);

CREATE TABLE detail (
	detail_code	varchar2(100)		NOT NULL,
	order_code	varchar2(100)		NOT NULL,
	goods_code	varchar2(100)		NOT NULL,
	quantity	number		NULL,
	detail_price	number		NULL
);

ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	member_code
);

ALTER TABLE goods ADD CONSTRAINT PK_GOODS PRIMARY KEY (
	goods_code
);

ALTER TABLE orders ADD CONSTRAINT PK_ORDERS PRIMARY KEY (
	order_code
);

ALTER TABLE review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	review_code
);

ALTER TABLE cart ADD CONSTRAINT PK_CART PRIMARY KEY (
	cart_code
);

ALTER TABLE detail ADD CONSTRAINT PK_DETAIL PRIMARY KEY (
	detail_code
);

ALTER TABLE review ADD CONSTRAINT FK_goods_TO_review_1 FOREIGN KEY (
	goods_code
)
REFERENCES goods (
	goods_code
);

ALTER TABLE cart ADD CONSTRAINT FK_goods_TO_cart_1 FOREIGN KEY (
	goods_code
)
REFERENCES goods (
	goods_code
);

ALTER TABLE detail ADD CONSTRAINT FK_orders_TO_detail_1 FOREIGN KEY (
	order_code
)
REFERENCES orders (
	order_code
);

ALTER TABLE detail ADD CONSTRAINT FK_goods_TO_detail_1 FOREIGN KEY (
	goods_code
)
REFERENCES goods (
	goods_code
);

--샘플파일
insert into member values('M-00001', 'user1', '0000', '회원1', '010-1111-1111', '대구시 중구 중앙대로', 'user1@naver.com');
insert into member values('M-00002', 'user2', '0000', '회원2', '010-2222-2222', '대구시 중구 중앙대로', 'user2@naver.com');
insert into member values('M-00003', 'user3', '0000', '회원3', '010-3333-3333', '대구시 중구 중앙대로', 'user3@naver.com');
insert into member values('M-00004', 'user4', '0000', '회원4', '010-4444-4444', '대구시 중구 중앙대로', 'user4@naver.com');
insert into member values('M-00005', 'user5', '0000', '회원5', '010-5555-5555', '대구시 중구 중앙대로', 'user5@naver.com');
insert into member values('M-00006', 'user6', '0000', '회원6', '010-6666-6666', '대구시 중구 중앙대로', 'user6@naver.com');
insert into member values('M-00007', 'user7', '0000', '회원7', '010-7777-7777', '대구시 중구 중앙대로', 'user7@naver.com');
insert into member values('M-00008', 'user8', '0000', '회원8', '010-8888-8888', '대구시 중구 중앙대로', 'user8@naver.com');
insert into member values('M-00009', 'user9', '0000', '회원9', '010-9999-9999', '대구시 중구 중앙대로', 'user9@naver.com');
insert into member values('M-00010', 'user10', '0000', '회원10', '010-0000-0000', '대구시 중구 중앙대로', 'user10@naver.com');

insert into goods values('G-00001', '상품1', '예담', 1000, '과자/,쿠키', '새우깡.png', '새우깡.png');
insert into goods values('G-00002', '상품2', '예담', 2000, '과자/,쿠키', '새우깡.png', '새우깡.png');
insert into goods values('G-00003', '상품3', '예담', 3000, '과자/,쿠키', '새우깡.png', '새우깡.png');
insert into goods values('G-00004', '상품4', '예담', 4000, '초콜릿/젤리', '새우깡.png', '새우깡.png');
insert into goods values('G-00005', '상품5', '예담', 5000, '초콜릿/젤리', '새우깡.png', '새우깡.png');
insert into goods values('G-00006', '상품6', '예담', 6000, '초콜릿/젤리', '새우깡.png', '새우깡.png');
insert into goods values('G-00007', '상품7', '예담', 7000, '캔디/껌', '새우깡.png', '새우깡.png');
insert into goods values('G-00008', '상품8', '예담', 8000, '캔디/껌', '새우깡.png', '새우깡.png');
insert into goods values('G-00009', '상품9', '예담', 9000, '캔디/껌', '새우깡.png', '새우깡.png');
insert into goods values('G-00010', '상품10', '예담', 10000, '음료/커피', '새우깡.png', '새우깡.png');
insert into goods values('G-00011', '상품11', '예담', 11000, '음료/커피', '새우깡.png', '새우깡.png');
insert into goods values('G-00012', '상품12', '예담', 12000, '음료/커피', '새우깡.png', '새우깡.png');

create sequence cart_seq;

insert into cart values(cart_seq.nextval, 'G-00001', 'M-00001', 1);
insert into cart values(cart_seq.nextval, 'G-00002', 'M-00001', 1);
insert into cart values(cart_seq.nextval, 'G-00003', 'M-00001', 1);
insert into cart values(cart_seq.nextval, 'G-00004', 'M-00001', 1);
insert into cart values(cart_seq.nextval, 'G-00005', 'M-00001', 1);
insert into cart values(cart_seq.nextval, 'G-00006', 'M-00002', 1);
insert into cart values(cart_seq.nextval, 'G-00007', 'M-00002', 1);
insert into cart values(cart_seq.nextval, 'G-00008', 'M-00002', 1);
insert into cart values(cart_seq.nextval, 'G-00009', 'M-00002', 1);
insert into cart values(cart_seq.nextval, 'G-00010', 'M-00002', 1);

insert into orders values('O-00001', 'M-00001', '2024-01-01', '서울시 송파구 올림픽로', '수령인1', '010-1234-1234', '부재시 문 앞에 놓아주세요', 3000, 15000);
insert into orders values('O-00002', 'M-00002', '2024-05-05', '서울시 송파구 올림픽로', '수령인2', '010-5678-5678', '경비실에 맡겨주세요', 0, 45000);

create sequence detail_seq;

insert into detail values(detail_seq.nextval, 'O-00001', 'G-00001', 1, 1000);
insert into detail values(detail_seq.nextval, 'O-00001', 'G-00002', 1, 2000);
insert into detail values(detail_seq.nextval, 'O-00001', 'G-00003', 1, 3000);
insert into detail values(detail_seq.nextval, 'O-00001', 'G-00004', 1, 4000);
insert into detail values(detail_seq.nextval, 'O-00001', 'G-00005', 1, 5000);
insert into detail values(detail_seq.nextval, 'O-00002', 'G-00006', 1, 6000);
insert into detail values(detail_seq.nextval, 'O-00002', 'G-00007', 1, 7000);
insert into detail values(detail_seq.nextval, 'O-00002', 'G-00008', 1, 8000);
insert into detail values(detail_seq.nextval, 'O-00002', 'G-00009', 1, 9000);
insert into detail values(detail_seq.nextval, 'O-00002', 'G-00010', 1, 10000);

create sequence review_seq;

insert into review values(review_seq.nextval, 'G-00001', '상품평1', '상품평입니다. 최소 30자 이상 작성해주세요.', 1, '2024-01-05');
insert into review values(review_seq.nextval, 'G-00002', '상품평2', '상품평입니다. 최소 30자 이상 작성해주세요.', 1, '2024-01-05');
insert into review values(review_seq.nextval, 'G-00003', '상품평3', '상품평입니다. 최소 30자 이상 작성해주세요.', 2, '2024-01-05');
insert into review values(review_seq.nextval, 'G-00004', '상품평4', '상품평입니다. 최소 30자 이상 작성해주세요.', 2, '2024-01-05');
insert into review values(review_seq.nextval, 'G-00005', '상품평5', '상품평입니다. 최소 30자 이상 작성해주세요.', 3, '2024-01-05');
insert into review values(review_seq.nextval, 'G-00006', '상품평6', '상품평입니다. 최소 30자 이상 작성해주세요.', 3, '2024-05-12');
insert into review values(review_seq.nextval, 'G-00007', '상품평7', '상품평입니다. 최소 30자 이상 작성해주세요.', 4, '2024-05-12');
insert into review values(review_seq.nextval, 'G-00008', '상품평8', '상품평입니다. 최소 30자 이상 작성해주세요.', 4, '2024-05-12');
insert into review values(review_seq.nextval, 'G-00009', '상품평9', '상품평입니다. 최소 30자 이상 작성해주세요.', 5, '2024-05-12');
insert into review values(review_seq.nextval, 'G-00010', '상품평10', '상품평입니다. 최소 30자 이상 작성해주세요.', 5, '2024-05-12');





select * from member;
select * from goods;
select * from cart;
select * from detail;
select * from orders;
select * from review;

commit;