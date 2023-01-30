<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DB/connDB.jsp" %>

<%
String bookID = request.getParameter("id");

String sql = "select bookID from book where bookID=?"; // bookID 검사
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, bookID);
rs = pstmt.executeQuery();
if(rs.next()){ // 해당되는 bookID가 있다면
	sql = "delete from book where bookID = ?"; // 해당되는 bookID 삭제
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bookID);
	pstmt.executeUpdate();
	
	response.sendRedirect("./editBook.jsp?edit=delete");
}
else { // 해당되는 bookID 없다면
	response.sendRedirect("./errorPage/exceptionNoBookId.jsp");
}
%>