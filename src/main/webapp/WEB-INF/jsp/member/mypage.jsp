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
		<h5 class="alert alert-info">/member/mypage.jsp</h5>
			<div>
				<a href="${pageContext.request.contextPath}/member/update.do?mid=${sessionMid}">회원정보수정</a>
				<a href="${pageContext.request.contextPath}/member/delete.do?mid=${sessionMid}">회원탈퇴</a>
				<a href="${pageContext.request.contextPath}/member/password.do">비밀번호 찾기</a>
				<a href="${pageContext.request.contextPath}/board/list.do">문의게시판</a>	
				<a href="${pageContext.request.contextPath}/account/mypoint.do?mid=${sessionMid}">마이포인트</a>	
				<a href="">활동관리</a>	
			</div>
			
	</body>
</html>