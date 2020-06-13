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
	<script>	
		var pno = new Array();
		var color = new Array();
		var amount = new Array();
		var size = new Array();
		pno = ${bkpno};
		console.log(pno);
		function fun1()
		{
			var selectcolor = $("#color").val();
			console.log(selectcolor);
			
			var amountnum = amount[(color.indexOf(selectcolor))];
			console.log(amountnum);
			
			$("#countselects").attr("max",amountnum);
		}
	</script>
	
	
	<body>
	<form action="orderallconfirm.do">
		<h5 class="alert alert-info">/product/order.jsp</h5>	
		<h3>주문하기</h3>
		<c:forEach  items ="${bkpno}">
			<h1>1</h1>
			<tr>
				<td>제품이름 : ${product.pname}</td>
			</tr></br>
		
			<input type = "hidden" name = "pno" value="${product.pno}">
			<th>가격
			<input name = "pprice" value = "${product.pprice}" readonly="readonly">
			</th></br>
		
			</th>
			
			
			<tr>
				<th>색상 선택
					<select id = "color" name ="colorselect" onchange="fun1()">
					<option  selected disabled hidden>선택</option>
					<c:forEach var="product" items="${productlist}">
						<option>${product.pcolor}</option>
					</c:forEach>
					</select>
				</th>
			</tr>
			<tr>
				<th>수량 선택
					<input id= "countselects" type="number" name="countselect" min="1" max = ""/>
					</th>
			</tr>
		</c:forEach>
			</br>
			<tr>
				<th>결제 수단
					<select name="howpay" id="select_howpay">
						<option selected disabled hidden>선택</option>
						<option value="카드결제">카드결제</option>
						<option value="계좌이체">계좌이체</option>
					</select>
				</th>
			</tr>
			<tr>
				<th>쿠폰 선택
					<select name ="couponselect">
						<OPTION value="">choose</OPTION>
						<OPTION value="10">10%</OPTION>
						<OPTION value="20">20%</OPTION>
						<OPTION value="30">30%</OPTION>
					</select>
					</th>
			</tr>		
		</table>
		
		<table>
			<th>연락처</th>
			<tr>
				<td>${member.mtel}</td>
			</tr>
		</table>
		
		<table>
			<th>배송지</th>
			<tr>
				<td>${member.maddress}</td>
			</tr>
		</table>
			<input name = "mid" value = "${member.mid}" type = "hidden">
		<a href="detailview.do?pno=${product.pno}" class="btn btn-outline-danger" style="margin-top:10px">취소하기</a>
		<input type ="submit" value = "주문하기" class="btn btn-success" style="margin-top:10px"></input>
	</form>
	</body>
	
	
</html>