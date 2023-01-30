package dto;

/*
 * CREATE TABLE IF NOT EXISTS book(
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
*/
public class BookDTO {
	private String bookID; // 도서 아이디
	private String name; // 도서명
	private Integer unitPrice; // 가격
	private String author; // 저자
	private String description; // 설명
	private String publisher; // 출판사
	private String category; // 분류
	private long unitsInStock; // 재고 수
	private long totalPages; // 페이지 수
	private String releaseDate; // 출판일
	private String condition; // 신규 도서 or 중고 도서 or E-Book;
	private String filename; // 파일명
	private int quantity; // 남은 도서의 개수
	
	// 생성자
	public BookDTO() {
		super();
	}
	public BookDTO(String bookID, String name, Integer unitPrice) {
		super();
		this.bookID = bookID;
		this.name = name;
		this.unitPrice = unitPrice;
	}
	
	// getter setter
	public String getBookID() {
		return bookID;
	}
	public void setBookID(String bookID) {
		this.bookID = bookID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public long getUnitsInStock() {
		return unitsInStock;
	}
	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	public long getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(long totalPages) {
		this.totalPages = totalPages;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
