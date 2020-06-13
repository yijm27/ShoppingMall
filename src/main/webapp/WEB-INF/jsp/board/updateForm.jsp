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
		<h5 class="alert alert-info">/board/updateForm.jsp</h5>
		<form method="post" action="update.do" >
		<table>
			
			
			<tr>
				<td>번호</td>
				<td><input type="hidden" name="bno" style="width: 400px" readonly value="${board.bno}"> </td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="btitle" style="width: 400px;" value="${board.btitle}"></td>
			</tr>
			
			<tr>
				<td>글쓴이</td>
				<td><input type="text" style="width: 400px;" disabled value="${board.bwriter}"></td>
			</tr>
			<tr>
				<td>글쓴 날짜</td>
				<td><input type="text" style="width: 400px;" disabled value="${board.bdate}"></td>
			</tr>
			<tr>
				<td>조회수</td>
				<td><input type="text" style="width: 400px;" disabled value="${board.bhitcount}"></td>
			</tr>
			<tr>
				<td>평점</td>
				<td><input type="text" style="width: 400px;" disabled value="${board.bstarscore}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="bcontent" rows="5" style="width: 400px;">${board.bcontent}</textarea> </td>
			</tr>
			<tr>
				<td>첨부</td>
				<td>${board.battachoname}</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" class="btn btn-outline-primary"/>
					<a class="btn btn-outline-primary" href="list.do?pageNo=${pager.pageNo}">목록</a>
				</td>	
			</tr>
		</table>
		
	</form>	
		
	</body>
</html>