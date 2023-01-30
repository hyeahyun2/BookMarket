<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.BookDTO" %>
<%@ page import="dao.BookRepository" %>
<%@ include file="DB/connDB.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 상세 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 목록</h1>
		</div>
	</div>
	<%
	String id = request.getParameter("id");
	String sql = "select * from book where bookID=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	if(rs.next()){
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="${pageContext.request.contextPath}/resources/images/<%= rs.getString("fileName") %>"
					style="width: 100%" alt="">
			</div>
			<div class="col-md-6">
				<h3><%= rs.getString("name") %></h3>
				<p><b>저자</b> : <%= rs.getString("author") %></p>
				<p><b>도서 코드 : </b><span class="badge badge-danger"> <%= rs.getString("bookID") %></span>
				<p><%= rs.getString("bookDescription") %></p>
				<p><b>출판사</b> : <%= rs.getString("publisher") %></p>
				<p><b>분류</b> : <%= rs.getString("category") %></p>
				<p><b>재고 수</b> : <%= rs.getLong("unitsInStock") %></p>
				<p><b>페이지 수</b> : <%= rs.getLong("totalPages")%></p>
				<p><b>출판일</b> : <%= rs.getString("releaseDate") %></p>
				<p><b>도서 상태</b> : <%= rs.getString("bookCondition") %></p>
				<h4><%= rs.getInt("unitPrice") %>원</h4>
				<form action="./addCart.jsp" method="post" name="cartForm">
					<input type="hidden" name="id" value="<%= rs.getString("bookID") %>">
					<span class="btn btn-info" id="addBookBtn"> 도서 주문 &raquo;</span>
					<a href="./cart.jsp" class="btn btn-info">장바구니 &raquo;</a>
					<a href="./books.jsp" class="btn btn-secondary"> 도서 목록 &raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<%
	} else { // 요청 bookID가 DB에 저장되지 않은 값일 때
		response.sendRedirect("./errorPage/exceptionNoBookId.jsp");
	}
	%>
	<jsp:include page="footer.jsp"/>
	<script>
		const form = document.cartForm;
		const addBookBtn = document.getElementById("addBookBtn");
		addBookBtn.addEventListener("click", ()=>{
			if(confirm("장바구니에 추가하시겠습니까?")){
				form.submit();
			}
		})
	</script>
</body>
</html>