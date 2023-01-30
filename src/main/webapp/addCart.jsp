<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.BookDTO" %>
<%@ page import="dao.BookRepository" %>

<%
String id = request.getParameter("id");

if(id == null || id.trim().equals("")){
	response.sendRedirect("books.jsp");
}

BookRepository dao = BookRepository.getInstance();
BookDTO book = dao.getBookById(id);
if(book == null){ // id가 존재하지 않는 책일 경우 (등록되지 않은 책)
	response.sendRedirect("./errorPage/exceptionNoBookId.jsp");
}

if(session.getAttribute("bookList") == null){ // bookList 세션 존재하지 않으면
	ArrayList<BookDTO> list = new ArrayList<BookDTO>();
	session.setAttribute("bookList", list); // bookList 세션 추가
}

// bookList 세션 불러오기
ArrayList<BookDTO> bookList = (ArrayList<BookDTO>)session.getAttribute("bookList");

boolean isCartMember = false;
for(BookDTO b : bookList){
	if(b.getBookID().equals(id)){ // 이미 장바구니에 추가된 책이면
		isCartMember = true;
		b.setQuantity(b.getQuantity() + 1); // 개수 1 추가
	}
}

if(!isCartMember){ // 아직 장바구니에 추가되지 않은 책이면
	book.setQuantity(1); // 개수 = 1개
	bookList.add(book); // 목록에 해당 책 추가
}

response.sendRedirect("book.jsp?id=" + id); // 해당 책 상세 페이지로 이동
%>