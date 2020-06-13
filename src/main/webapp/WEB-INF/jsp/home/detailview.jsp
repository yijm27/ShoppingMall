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
		<style>
			td{
			width:400px;
			text-align: center;
			}
		</style>
		<script type="text/javascript">
			pno = ${product.pno};
		</script>
		<script>
			var color = new Array();
			var amount = new Array();
			<c:forEach var="product" items="${productlist}">
				color.push("${product.pcolor}");
				amount.push("${product.pamount}");
			</c:forEach>
			function image_main()
			{
				var img_src;
				img_src = "${pageContext.request.contextPath}/resource/img/product"+ pno +".gif"; 

				return img_src;
			}
			
			function fun1()
			{
				var selectcolor = $("#color").val();
				console.log(selectcolor);
				
				var amountnum = amount[(color.indexOf(selectcolor))];
				console.log(amountnum);
				
				$("#countselects").attr("value",amountnum);
			}
		</script>
	</head>
	<body>
		<h5 class="alert alert-info">/product/detailview.jsp</h5>
		<h3 style="margin-bottom:20px">상세 보기</h3>
		
		<table>
			<th>제품 사진
				<div><img id="img"/>
					<script>
						document.getElementById('img').src=image_main();
					</script>
				</div>
				</th>
		</table>
		
		<table>
			<th>제품 이름</th>
			<tr>
				<td>${product.pname}</td>
			</tr>
		</table>
		
		<table>
			<th>제품 가격</th>
			<tr>
				<td>${product.pprice}</td>
			</tr>
			<th>제품 색상</th>
		</table>
		
		
		<table>
		
			<select id = "color" name ="colorselect" onchange="fun1()">
				<option  selected disabled hidden>선택</option>
				<c:forEach var="product" items="${productlist}">
						<option>${product.pcolor}</option>
				</c:forEach>
			</select>
			
			<%-- <c:forEach var="product" items="${productlist}">
					 <tr>
						<td>${product.pcolor}</td>
					</tr> 
			</c:forEach> --%>
		</table>
		
		<table>
			<th>제품 재고</th>
					<tr>
						<td><input id = "countselects" type="text" value ="0" readonly></td>
					</tr>
		</table>
		
		<table>
			<th>제품 내용</th>
			<tr>
				<td>${product.pcontent}</td>
			</tr>
		</table>
		
		<table>
			<th>좋아요 수</th>
			<tr>
				<td>${product.plike}</td>
			</tr>
		</table>
		
		<form action ="basket.do" method ="POST">
			<input type = "hidden" name = "mid" value = "${sessionMid}"/>
			<input type = "hidden" name = "pno" value = "${product.pno}"/>
			<input type = "hidden" name = "pname" value = "${product.pname}"/>
			<input type = "hidden" name = "pprice" value = "${product.pprice}"/>
			
		<%-- product board --%>
		
			<input type = "submit" class="btn btn-outline-primary" style= "margin-top:10px" value="장바구니">
		</form>
		<a href="main.do" class="btn btn-outline-danger" style="margin-top:10px">뒤로가기</a>
		<a href="order.do?pno=${product.pno}&mid=${sessionMid}" class="btn btn-success" style="margin-top:10px">주문하기</a>
		
	</body>
</html>