<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="dto.BookDTO" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="java.awt.*" %>
<%@ include file="DB/connDB.jsp" %>
<%
// 기본 세팅 (인코딩)
request.setCharacterEncoding("utf-8");

// 저장될 위치 정해주기
String realPath = request.getServletContext().getRealPath("resources/images");
File dir = new File(realPath);
if(!dir.exists()){ // 만약 해당 경로가 존재하지 않으면
	dir.mkdirs(); // 해당 경로를 만들어주기
}

// 디렉토리 열기
if(!Desktop.isDesktopSupported()){
	return;
}
Desktop desktop = Desktop.getDesktop();
if(dir.exists()){
	desktop.open(dir);
}

String filename = ""; // 업로드된 파일명
String encType = "utf-8"; // 인코딩 타입
int maxSize = 5 * 1024 * 1024; // 최대 파일 크기 (5MB)

MultipartRequest multi = new MultipartRequest(request, realPath, maxSize,
		encType, new DefaultFileRenamePolicy());

// 파라미터 값 받아오기
String bookID = multi.getParameter("bookID");
String name = multi.getParameter("name");
String author = multi.getParameter("author");
String publisher = multi.getParameter("publisher");
String unitPrice = multi.getParameter("unitPrice");
String description = multi.getParameter("description");
String category = multi.getParameter("category");
String totalPages = multi.getParameter("totalPages");
String unitsInStock = multi.getParameter("unitsInStock");
String releaseDate = multi.getParameter("releaseDate");
String condition = multi.getParameter("condition");

// 가격 형변환(int)
Integer price;
if(unitPrice.isEmpty()) price = 0;
else price = Integer.valueOf(unitPrice);
// 페이지수 형변환(long)
long pages;
if(totalPages.isEmpty()) pages = 0;
else pages = Long.valueOf(totalPages);
// 재고수 형변환(long)
long stock;
if(unitsInStock.isEmpty()) stock = 0;
else stock = Long.valueOf(unitsInStock);

// 속성값이 file인 파라미터 받아오기
Enumeration files = multi.getFileNames();
String fname = (String)files.nextElement();
String fileName = multi.getFilesystemName(fname); // 디렉토리에 저장될 파일명

// db에 새로운 책 등록
String sql = "insert into book values(?,?,?,?,?,?,?,?,?,?,?,?)";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, bookID);
pstmt.setString(2, name);
pstmt.setInt(3, price);
pstmt.setString(4, author);
pstmt.setString(5, description);
pstmt.setString(6, publisher);
pstmt.setString(7, category);
pstmt.setLong(8, stock);
pstmt.setLong(9, pages);
pstmt.setString(10, releaseDate);
pstmt.setString(11, condition);
pstmt.setString(12, fileName);
pstmt.executeUpdate(); // 쿼리문 실행

if(pstmt != null) pstmt.close();
if(conn != null) conn.close();

// 도서 목록 페이지로 이동
response.sendRedirect("books.jsp");
%>