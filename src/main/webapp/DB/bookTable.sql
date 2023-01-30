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
	('K1003', 'ū�� ������', 15300, '�ϰ�', 'ū���� �������� ģ���� �Ǵ� �̾߱�', 'Ų������', '���� â�۵�ȭ',
	800, 60, '2022-12-20', 'New', 'K1003.jpg'),
	('K1004', '��ȣ�� �˸� ������ ���̴� ����', 10100, '������', 'ȭ���� ������ ����ִ� ���ҿ� �ֱ���ǥ �̾߱�', '����������', '�ι�/��ȸ',
	1000, 37, '2023-01-31', 'E-Book', 'K1004.jpg'),
	('Y3017', '���ڿ���', 20000, 'David j. Griffiths', '���ڿ��� ���� ����', 'û�����ǻ�', '���б���',
	453, 2500, '2006-03-10', 'Refurbished', 'Y3017.jpg');
select * from book;