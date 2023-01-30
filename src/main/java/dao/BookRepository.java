package dao;

import java.util.ArrayList;

import dto.BookDTO;

public class BookRepository {
	private ArrayList<BookDTO> listOfBooks = new ArrayList<BookDTO>();
	// 싱글톤 객체
	private static BookRepository instance = new BookRepository();
	
	public static BookRepository getInstance() {
		return instance;
	}

	public BookRepository() {
		BookDTO star = new BookDTO("K1003", "큰별 작은별", 15300);
		star.setAuthor("일곱");
		star.setDescription("큰별과 작은별이 친구가 되는 이야기");
		star.setPublisher("킨더랜드");
		star.setCategory("유아 창작동화");
		star.setUnitsInStock(800);
		star.setTotalPages(60);
		star.setReleaseDate("2022-12-20");
		star.setCondition("New");
		star.setFilename("K1003.jpg");
		
		BookDTO elements = new BookDTO("K1004", "기호를 알면 성격이 보이는 원소", 10100);
		elements.setAuthor("도영실");
		elements.setDescription("화학자 엄마가 들려주는 원소와 주기율표 이야기");
		elements.setPublisher("자음과모음");
		elements.setCategory("인문/사회");
		elements.setUnitsInStock(1000);
		elements.setTotalPages(37);
		elements.setReleaseDate("2023-01-31");
		elements.setCondition("E-Book");
		elements.setFilename("K1004.jpg");
		
		BookDTO quantumMechanics = new BookDTO("Y3017", "양자역학", 20000);
		quantumMechanics.setAuthor("David j. Griffiths");
		quantumMechanics.setDescription("양자역학 대학 교재");
		quantumMechanics.setPublisher("청범출판사");
		quantumMechanics.setCategory("대학교재");
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
	
	// 싱글톤 객체에 새로운 책 추가
	public void addBook(BookDTO book) {
		listOfBooks.add(book);
	}
}
