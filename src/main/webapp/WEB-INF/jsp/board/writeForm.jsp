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
		<h5 class="alert alert-info">/board/writeForm.jsp</h5>
		<h6 style="margin-bottom: 20px;">게시물 입력</h6>
		
		<form method="post" action="write.do" enctype="multipart/form-data">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="btitle" style="width: 400px;"/></td> 
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="bcontent" rows="5" style="width: 400px;"></textarea></td> 
				</tr>
				<tr>
					<td>첨부</td>
					<td><input type="file" name="battach"/></td> 
				</tr>
				
			</table>
			<input type="submit" value="글쓰기" 
				class="btn btn-outline-primary btn-sm" 
				style="margin-top: 20px;"/>
		</form>	
	</body>
</html>