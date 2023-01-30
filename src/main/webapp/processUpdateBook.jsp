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
String sql = "select bookID from book where bookID=?"; // bookID가 유효한지 검사
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, bookID);
rs = pstmt.executeQuery();
if(rs.next()){ // bookID 존재하면
	if(fileName != null){ // 새로운 이미지 업로드 시 
		sql = "update book set name=?, unitPrice=?, author=?, bookDescription=?, publisher=?, "
				+ "category=?, unitsInStock=?, totalPages=?, releaseDate=?, bookCondition=?, fileName=? "
				+ "where bookID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, price);
		pstmt.setString(3, author);
		pstmt.setString(4, description);
		pstmt.setString(5, publisher);
		pstmt.setString(6, category);
		pstmt.setLong(7, stock);
		pstmt.setLong(8, pages);
		pstmt.setString(9, releaseDate);
		pstmt.setString(10, condition);
		pstmt.setString(11, fileName);
		pstmt.setString(12, bookID);
		pstmt.executeUpdate(); // 쿼리문 실행
	}
	else { // 이미지 업로드 x
		sql = "update book set name=?, unitPrice=?, author=?, bookDescription=?, publisher=?, "
				+ "category=?, unitsInStock=?, totalPages=?, releaseDate=?, bookCondition=? "
				+ "where bookID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, price);
		pstmt.setString(3, author);
		pstmt.setString(4, description);
		pstmt.setString(5, publisher);
		pstmt.setString(6, category);
		pstmt.setLong(7, stock);
		pstmt.setLong(8, pages);
		pstmt.setString(9, releaseDate);
		pstmt.setString(10, condition);
		pstmt.setString(11, bookID);
		pstmt.executeUpdate(); // 쿼리문 실행
	}
}

if(rs != null) rs.close();
if(pstmt != null) pstmt.close();
if(conn != null) conn.close();
 
// 도서 목록 페이지로 이동
response.sendRedirect("editBook.jsp?edit=update");
%>