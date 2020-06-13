<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>

	</head>
	
	<body>
	
		<h5 class="alert alert-info">/product/orderconfirm.jsp</h5>	
		<h2>주문 확인</h2>
	<form action = "main.do" method="post">
			<input name = "oid" value = "${member.mid}" type = "hidden">
			<li>제품번호 :
			<input name = "pno"value = "${product.pno}" readonly="readonly"></li></br>
			<li>제품이름 : 
			<input name = "pname" value = "${product.pname}"readonly="readonly"></li></br>
			<li>가격 :
			<input name = "pprice" value = "${product.pprice}"readonly="readonly"></li></br>
			<li>결제방법 :
			<input name = "howpay" value ="${orderconfirm.howpay}"readonly="readonly"></li></br>
			<li>색상 :
			<input name = "colorselect" value = "${orderconfirm.colorselect}"readonly="readonly"></li></br>
			<li>수량 :
			<input name = "countselect" value = "${orderconfirm.countselect}"readonly="readonly"></li></br>
			<li>쿠폰 :
			<input name = "couponselect" value = "${orderconfirm.couponselect}"readonly="readonly"></li></br>
			<li>배송지 :
			<input name = "maddress" value ="${member.maddress}"readonly="readonly"></li></br>
			<li>총 결제 가격:
			<input name = "totalprice" value = "${orderby.ototalprice}" readonly = "readonly"></li></br>
		<a href="order.do?pno=${product.pno}&mid=${member.mid}" class="btn btn-outline-danger" style="margin-top:10px">정보수정</a>
		<input type ="submit" value = "주문완료" class="btn btn-success" style="margin-top:10px"></input>
	</form>
	</body>
	
	
</html>