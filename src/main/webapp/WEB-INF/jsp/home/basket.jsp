<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- 외부 라이브러리이용, UI꾸미기 -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
		
	</head>
	<body>
		<h5 class="alert alert-info">/home/basket.jsp</h5>	
		<h3 id ="header">장바구니</h3>
		<div>
			<table>
				<tr style="background-color: red;" >
					<th style = "width:150px">담아둔 제품</th>
					<th style = "width:150px">제품 가격 </th>
					<th style = "width:150px">삭제</th>
				</tr>
				
				<c:forEach var="basket" items="${basketlist}">
					<tr>
						<td><a href ="${pageContext.request.contextPath}/home/detailview.do?pno=${basket.bkpno}">${basket.bkpno}</a></td>
						<td>${basket.bkprice}</td>
						<td><a href="delete.do?bkkey=${basket.bkkey}">삭제하기</a></td> 
					</tr>
				</c:forEach>
			</table>
			<a href = "${pageContext.request.contextPath}/home/detailview.do?mid=${mid}&pno=${pno}">뒤로가기</a>
			<form action="orderall.do" method="POST">
				<c:forEach var="basket" items="${basketlist}">
					<input type="hidden" name = "pno" value = "${basket.bkpno}">
				</c:forEach>
				<input type = "submit" class="btn btn-outline-primary" style= "margin-top:10px" value="주문하기"> 
			</form>	
		</div>		
	</body>
</html>