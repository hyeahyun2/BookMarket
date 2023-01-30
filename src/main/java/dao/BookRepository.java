package dao;

import java.util.ArrayList;

import dto.BookDTO;

public class BookRepository {
	private ArrayList<BookDTO> listOfBooks = new ArrayList<BookDTO>();
	// �̱��� ��ü
	private static BookRepository instance = new BookRepository();
	
	public static BookRepository getInstance() {
		return instance;
	}

	public BookRepository() {
		BookDTO star = new BookDTO("K1003", "ū�� ������", 15300);
		star.setAuthor("�ϰ�");
		star.setDescription("ū���� �������� ģ���� �Ǵ� �̾߱�");
		star.setPublisher("Ų������");
		star.setCategory("���� â�۵�ȭ");
		star.setUnitsInStock(800);
		star.setTotalPages(60);
		star.setReleaseDate("2022-12-20");
		star.setCondition("New");
		star.setFilename("K1003.jpg");
		
		BookDTO elements = new BookDTO("K1004", "��ȣ�� �˸� ������ ���̴� ����", 10100);
		elements.setAuthor("������");
		elements.setDescription("ȭ���� ������ ����ִ� ���ҿ� �ֱ���ǥ �̾߱�");
		elements.setPublisher("����������");
		elements.setCategory("�ι�/��ȸ");
		elements.setUnitsInStock(1000);
		elements.setTotalPages(37);
		elements.setReleaseDate("2023-01-31");
		elements.setCondition("E-Book");
		elements.setFilename("K1004.jpg");
		
		BookDTO quantumMechanics = new BookDTO("Y3017", "���ڿ���", 20000);
		quantumMechanics.setAuthor("David j. Griffiths");
		quantumMechanics.setDescription("���ڿ��� ���� ����");
		quantumMechanics.setPublisher("û�����ǻ�");
		quantumMechanics.setCategory("���б���");
		quantumMechanics.setUnitsInStock(453);
		quantumMechanics.setTotalPages(2500);
		quantumMechanics.setReleaseDate("2006-03-10");
		quantumMechanics.setCondition("Refurbished");
		quantumMechanics.setFilename("Y3017.jpg");
		
		listOfBooks.add(star);
		listOfBooks.add(elements);
		listOfBooks.add(quantumMechanics);
	}
	
	public ArrayList<BookDTO> getAllBooks(){
		return listOfBooks;
	}
	
	public BookDTO getBookById(String bookID) {
		BookDTO bookById = null;
		
		for(int i=0; i<listOfBooks.size(); i++) {
			BookDTO book = listOfBooks.get(i);
			if(book != null && book.getBookID() != null 
					&& book.getBookID().equals(bookID)) {
				bookById = book;
				break;
			}
		}
		return bookById;
	}
	
	// �̱��� ��ü�� ���ο� å �߰�
	public void addBook(BookDTO book) {
		listOfBooks.add(book);
	}
}
