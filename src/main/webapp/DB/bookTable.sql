CREATE TABLE IF NOT EXISTS book(
	bookID VARCHAR(10) NOT NULL,
	name VARCHAR(20),
	unitPrice INTEGER,
	author VARCHAR(50),
	bookDescription TEXT,
   publisher VARCHAR(20),
	category VARCHAR(20),
	unitsInStock LONG,
	totalPages LONG,
	releaseDate VARCHAR(20),
	bookCondition VARCHAR(20),
	p_fileName  VARCHAR(20),
	PRIMARY KEY (bookID)
)default CHARSET=utf8;

desc book;
product

INSERT INTO book 
	(bookID, NAME, unitPrice, author, bookDescription, publisher, category, 
	unitsInStock, totalPages, releaseDate, bookCondition, p_fileName)
	VALUES 
	('K1003', '큰별 작은별', 15300, '일곱', '큰별과 작은별이 친구가 되는 이야기', '킨더랜드', '유아 창작동화',
	800, 60, '2022-12-20', 'New', 'K1003.jpg'),
	('K1004', '기호를 알면 성격이 보이는 원소', 10100, '도영실', '화학자 엄마가 들려주는 원소와 주기율표 이야기', '자음과모음', '인문/사회',
	1000, 37, '2023-01-31', 'E-Book', 'K1004.jpg'),
	('Y3017', '양자역학', 20000, 'David j. Griffiths', '양자역학 대학 교재', '청범출판사', '대학교재',
	453, 2500, '2006-03-10', 'Refurbished', 'Y3017.jpg');
select * from book;