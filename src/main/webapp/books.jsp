<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.BookDTO" %>
<%@ page import="dao.BookRepository" %>
<%@ include file="DB/connDB.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>도서 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 목록</h1>
		</div>
	</div>
	<%
	String sql = "select * from book";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while(rs.next()){
		
	%>
	<div class="container">
		<div class="column" align="left">

			<div class="col-md-7">
				<img src="${pageContext.request.contextPath}/resources/images/<%= rs.getString("fileName") %>"
					style="width: 250px; height: 250px;" alt="">
				<h3><%= rs.getString("name") %></h3>
				<p><%= rs.getString("bookDescription") %></p>
				<p>
					<%= rs.getString("author") %> | 
					<%= rs.getString("publisher") %> | 
					<%= rs.getString("unitPrice") %>
				</p>
				<p><a href="./book.jsp?id=<%= rs.getString("bookID") %>" class="btn btn-secondary" role="button">
					상세 정보 &raquo;				
					</a>
			</div>
			<hr>
		</div>
	</div>
	<%
	}
	%>
	<jsp:include page="footer.jsp"/>
</body>
</html>