<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.BookDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>장바구니</title>
</head>
<body>
	<form method="post" name="frmCart">
		<input type="hidden" name="id">
	</form>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><span class="btn btn-danger" onclick="deleteCart()">삭제하기</span></td>
					<td align="right"><a href="./shippingInfo.jsp?cartId=<%=session.getId() %>" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px;">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%
				int sum = 0; // 모든 상품 합계
				ArrayList<BookDTO> cartList = (ArrayList<BookDTO>) session.getAttribute("cartlist");
				if(cartList == null){
					cartList = new ArrayList<BookDTO>();
					session.setAttribute("cartlist", cartList);
				}
				
				for(BookDTO book : cartList){
					// 한 상품의 토탈값 = 상품가격 * 개수
					int total = book.getUnitPrice() * book.getQuantity();
					sum += total;
				%>
				<tr>
					<td><%=book.getBookID()%> - <%= book.getName() %></td>
					<td><%= book.getUnitPrice() %></td>
					<td><%= book.getQuantity() %></td>
					<td><%= total %></td>
					<td><span class="badge badge-danger" id="removeBtn" onclick="removeToCart('<%= book.getBookID() %>')">삭제</span></td>
				</tr>
				<%
				}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%= sum %></th>
					<th></th>
				</tr>
			</table>
			<a href="./products.jsp" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
<script type="text/javascript">
	const form = document.frmCart;
	const removeBtn = document.getElementById("removeBtn");
	function removeToCart(removeId){
		if(confirm("장바구니에서 상품을 삭제하시겠습니까?")){
			form.id.value = removeId;
			form.action = "removeCart.jsp";
			form.submit(); // 장바구니에서 삭제
		}
	}
	function deleteCart(){
		if(confirm("장바구니에서 상품을 삭제하시겠습니까?")){
			form.action = "deleteCart.jsp";
			form.submit(); // 장바구니에서 삭제
		}
	}
</script>
</body>
</html>