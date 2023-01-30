<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<%
request.setCharacterEncoding("utf-8");
String cartId = session.getId();

String shipping_cartId = "";
String shipping_shippingDate = "";

Cookie[] cookies = request.getCookies();

if(cookies != null){
	for(int i=0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		switch(n){
		case "Shipping_cartId":
			shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			break;
		case "Shipping_shippingDate":
			shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			break;
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>주문 완료</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>주문은 <% out.println(shipping_shippingDate); %>에 배송될 예정입니다. </p>
		<p>주문번호 : <% out.println(shipping_cartId); %></p>
	</div>
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary">&laquo; 도서 목록</a></p>
	</div>
</body>
</html>
<%
session.invalidate(); // 세션(장바구니 리스트) 삭제

for(int i=0; i<cookies.length; i++){ // 쿠키(주문 정보) 삭제
	Cookie thisCookie = cookies[i];
	String n = thisCookie.getName();
	if(n.equals("Shipping_cartId") || n.equals("Shipping_name") ||
			n.equals("Shipping_shippingDate") || n.equals("Shipping_country") ||
			n.equals("Shipping_zipCode") || n.equals("Shipping_addressName")){
		thisCookie.setMaxAge(0);
	}
	response.addCookie(thisCookie);
}
%>