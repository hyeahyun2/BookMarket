<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./DB/connDB.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>도서 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 수정</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-right">
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>
		<%
		String bookID = request.getParameter("id");
		String sql = "select * from book where bookID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookID);
		rs = pstmt.executeQuery();
		if(rs.next()){
			
		%>
		<form name="newBook" action="./processUpdateBook.jsp" 
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">도서 코드</label>
				<div class="col-sm-3">
					<input type="text" name="bookID" class="form-control" value="<%= rs.getString("bookID") %>" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">도서명</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control" value="<%= rs.getString("name") %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">저자</label>
				<div class="col-sm-3">
					<input type="text" name="author" class="form-control" value="<%= rs.getString("author") %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">출판사</label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control" value="<%= rs.getString("publisher") %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격(숫자만 입력)</label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" class="form-control" value="<%= rs.getInt("unitPrice") %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">도서 설명</label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2" class="form-control"><%= rs.getString("bookDescription") %></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" value="<%= rs.getString("category") %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">페이지 수(숫자만 입력)</label>
				<div class="col-sm-3">
					<input type="text" name="totalPages" class="form-control" value="<%= rs.getLong("totalPages") %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고 수(숫자만 입력)</label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" class="form-control" value="<%= rs.getLong("unitsInStock") %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">출판일</label>
				<div class="col-sm-3">
					<input type="text" name="releaseDate" class="form-control" value="<%= rs.getString("releaseDate") %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-5">
					<%
					String condition = rs.getString("bookCondition");
					%>
					<input type="radio" name="condition" value="New" <%if(condition.equals("New")) out.print("checked"); %>> 신규 도서
					<input type="radio" name="condition" value="Old" <%if(condition.equals("Old")) out.print("checked"); %>> 중고 도서
					<input type="radio" name="condition" value="E-Book" <%if(condition.equals("E-Book")) out.print("checked"); %>> E-Book
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="bookImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</div>
		</form>
		<%
		} else {
			response.sendRedirect("./errorPage/exceptionNoBookId.jsp");
		}
		%>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>