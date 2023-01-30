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
if(book == null){
	response.sendRedirect("./error/exceptionNoBookId.jsp");
}

ArrayList<BookDTO> bookList = (ArrayList<BookDTO>)session.getAttribute("bookList");
BookDTO removeP = null;
for(BookDTO p : bookList){
	if(p.getBookID().equals(id)){ // 요청된 id값과 일치하면
		removeP = p;
	}
}
bookList.remove(removeP); // 카트에서 해당 id를 가지는 product 삭제
response.sendRedirect("cart.jsp");
%>