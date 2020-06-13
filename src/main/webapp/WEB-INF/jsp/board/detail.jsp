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
		<h5 class="alert alert-info">/board/detail.jsp</h5>
		<table>
			<tr>
				<td>번호</td>
				<td><input type="text" style="width: 400px;" disabled value="${board.bno}"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" style="width: 400px;" disabled value="${board.btitle}"></td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" style="width: 400px;" disabled value="${board.bwriter}"></td>
			</tr>
			<tr>
				<td>글쓴날짜</td>
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
				<td><textarea name="bcontent" rows="5" style="width: 400px;" disabled>${board.bcontent}</textarea></td>
			</tr>
			<tr>
				<td>첨부</td>
				<td>
					<c:if test="${board.battachoname != null}">
						<a href="battachDownload.do?bno=${board.bno}">${board.battachoname}</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>평점주기</td>
				<td>
					<form method="post" action="updateBstarscore.do">
						<input type="range" name="bstarscore" min="0" max="10" value="${board.bstarscore}"/>
						<input type="hidden" name="bno" value="${board.bno}"/>
						
						<input type="submit" value="평가하기"/>
					</form>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<c:if test="${sessionMid == board.bwriter}">
						<a  href="delete.do?bno=${board.bno}" class="btn btn-info">삭제</a>
						<a  href="update.do?bno=${board.bno}" class="btn btn-danger">수정</a>	
					</c:if>
						<a  href="list.do?pageNo=${pager.pageNo}" class="btn btn-outline-primary">목록</a>
				</td>	
			</tr>
		</table>
		
				
		
	</body>
</html>