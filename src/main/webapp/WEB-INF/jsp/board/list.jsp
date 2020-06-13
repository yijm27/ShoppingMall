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
		
		<style type="text/css">
			table {
			  border-collapse: collapse;
			}
			
			table, th, td {
			  border: 1px solid black;
			}
		</style>
		
		<!-- <script>
			function autoimage(bno) {
				var src;
				var img1;
				$.ajax({
					url : "${pageContext.request.contextPath}/board/image.do",
					data : {"bno" : bno},
					success : function(data) {
						var src =  data.image;
					}
				
				});
				console.log(src);
				return src;
			}
		</script>	 -->
		
		<script>
			
		</script>
	</head>
	<body>
		<h5 class="alert alert-info">/board/productReview.jsp</h5>
		<h3 style="margin-bottom: 10px;">상품 리뷰 게시판</h3>
		<div align="left">
			<a href="${pageContext.request.contextPath}/board/sortbyHitcount.do" style="color: black; margin: 20px;" class="btn btn-outline-primary">조회수순</a>
			<a href="${pageContext.request.contextPath}/board/sortbyDate.do" style="color: black; margin: 20px;" class="btn btn-outline-primary">오래된 순</a>
			<a href="${pageContext.request.contextPath}/board/list.do" style="color: black; margin: 20px;" class="btn btn-outline-primary">최신순</a>
			<a href="${pageContext.request.contextPath}/board/reviewlist.do" style="color: black; margin: 20px;" class="btn btn-outline-primary">사진 있는 평점</a>
			<a href="${pageContext.request.contextPath}/board/reviewMe.do" style="color: black; margin: 20px;" class="btn btn-outline-primary">내가 쓴 후기</a>
		</div>
		
		
		
		<div>
			<table style="width: 1100px;">
				<tr style="background-color: lime;">
					<th style="width: 100px; text-align: center;">상품 사진</th>
					<th style="text-align: center;">내용</th>
					<th style="width: 125px; text-align: center;">회원</th>
					<th style="width: 100px; text-align: center;">조회수</th>
					<th style="width: 150px; text-align: center;">날짜</th>
									
										
				</tr>
				<c:forEach var="board" items="${boardlist}">
					<tr>
						<td style="text-align: center;">
							<img  id="profile" width="100px" height="100px" src="${pageContext.request.contextPath}/board/image.do?bno=${board.bno}" alt="no image"/>
						</td>
						<td><a href="detail.do?bno=${board.bno}">${board.btitle}</a></td>
						<td style="text-align: center;">${board.bwriter}</td>
						<td style="text-align: center;">${board.bhitcount}</td>
						<td style="text-align: center;"><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						
					</tr>
				</c:forEach>
				<c:if test="${sortNew ==1}">
					<tr>
						<td colspan="5" style="text-align: center;">
							<a href="list.do?pageNo=1" class="btn btn-outline-primary btn-sm">처음</a>
							<c:if test="${pager.groupNo > 1}">
								<a href="list.do?pageNo=${pager.startPageNo-pager.pagesPerGroup}">[이전]</a>
							</c:if>
							
							
							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
									<c:if test="${pager.pageNo != i}">
										<a href="list.do?pageNo=${i}" class="btn btn-online-success btn-sm">${i}</a>
									</c:if>
									<c:if test="${pager.pageNo == i}">
										<a href="list.do?pageNo=${i}" class="btn btn-danger btn-sm">${i}</a>
									</c:if>
							</c:forEach>
							 
							 <c:if test="${pager.groupNo < pager.totalGroupNo }">
							 	<a href="list.do?pageNo=${pager.endPageNo + 1}">[다음]</a>
							 </c:if>
							
							<a href="list.do?pageNo=${pager.totalPageNo}" class="btn btn-outline-primary btn-sm" >맨끝</a>
							<c:if test="${sessionMid != null}">
								<a href="write.do" class="btn btn-outline-primary btn-sm" >상품 리뷰</a>
							</c:if>
						</td>
					</tr>
				</c:if>
				<c:if test="${sortHit ==1}">
					<tr>
						<td colspan="5" style="text-align: center;">
							<a href="list.do?pageNo=1" class="btn btn-outline-primary btn-sm">처음</a>
							<c:if test="${pager.groupNo > 1}">
								<a href="sortbyHitcount.do?pageNo=${pager.startPageNo-pager.pagesPerGroup}">[이전]</a>
							</c:if>
							
							
							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
									<c:if test="${pager.pageNo != i}">
										<a href="sortbyHitcount.do?pageNo=${i}" class="btn btn-online-success btn-sm">${i}</a>
									</c:if>
									<c:if test="${pager.pageNo == i}">
										<a href="sortbyHitcount.do?pageNo=${i}" class="btn btn-danger btn-sm">${i}</a>
									</c:if>
							</c:forEach>
							 
							 <c:if test="${pager.groupNo < pager.totalGroupNo }">
							 	<a href="sortbyHitcount.do?pageNo=${pager.endPageNo + 1}">[다음]</a>
							 </c:if>
							
							<a href="sortbyHitcount.do?pageNo=${pager.totalPageNo}" class="btn btn-outline-primary btn-sm" >맨끝</a>
							<c:if test="${sessionMid != null}">
								<a href="write.do" class="btn btn-outline-primary btn-sm" >상품 리뷰</a>
							</c:if>
						</td>
					</tr>
				</c:if>	
				<c:if test="${sortOld ==1}">
					<tr>
						<td colspan="5" style="text-align: center;">
							<a href="sortbyDate.do?pageNo=1" class="btn btn-outline-primary btn-sm">처음</a>
							<c:if test="${pager.groupNo > 1}">
								<a href="sortbyDate.do?pageNo=${pager.startPageNo-pager.pagesPerGroup}">[이전]</a>
							</c:if>
							
							
							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
									<c:if test="${pager.pageNo != i}">
										<a href="sortbyDate.do?pageNo=${i}" class="btn btn-online-success btn-sm">${i}</a>
									</c:if>
									<c:if test="${pager.pageNo == i}">
										<a href="sortbyDate.do?pageNo=${i}" class="btn btn-danger btn-sm">${i}</a>
									</c:if>
							</c:forEach>
							 
							 <c:if test="${pager.groupNo < pager.totalGroupNo }">
							 	<a href="sortbyDate.do?pageNo=${pager.endPageNo + 1}">[다음]</a>
							 </c:if>
							
							<a href="sortbyDate.do?pageNo=${pager.totalPageNo}" class="btn btn-outline-primary btn-sm" >맨끝</a>
							<c:if test="${sessionMid != null}">
								<a href="write.do" class="btn btn-outline-primary btn-sm" >상품 리뷰</a>
							</c:if>
						</td>
					</tr>
				</c:if>	
				<c:if test="${sortPhoto ==1}">
					<tr>
						<td colspan="5" style="text-align: center;">
							<a href="reviewlist.do?pageNo=1" class="btn btn-outline-primary btn-sm">처음</a>
							<c:if test="${pager.groupNo > 1}">
								<a href="reviewlist.do?pageNo=${pager.startPageNo-pager.pagesPerGroup}">[이전]</a>
							</c:if>
							
							
							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
									<c:if test="${pager.pageNo != i}">
										<a href="reviewlist.do?pageNo=${i}" class="btn btn-online-success btn-sm">${i}</a>
									</c:if>
									<c:if test="${pager.pageNo == i}">
										<a href="reviewlist.do?pageNo=${i}" class="btn btn-danger btn-sm">${i}</a>
									</c:if>
							</c:forEach>
							 
							 <c:if test="${pager.groupNo < pager.totalGroupNo }">
							 	<a href="reviewlist.do?pageNo=${pager.endPageNo + 1}">[다음]</a>
							 </c:if>
							
							<a href="reviewlist.do?pageNo=${pager.totalPageNo}" class="btn btn-outline-primary btn-sm" >맨끝</a>
							<c:if test="${sessionMid != null}">
								<a href="write.do" class="btn btn-outline-primary btn-sm" >상품 리뷰</a>
							</c:if>
						</td>
					</tr>
				</c:if>
				<c:if test="${sortMe ==1}">
					<tr>
						<td colspan="5" style="text-align: center;">
							<a href="reviewlist.do?pageNo=1" class="btn btn-outline-primary btn-sm">처음</a>
							<c:if test="${pager.groupNo > 1}">
								<a href="reviewlist.do?pageNo=${pager.startPageNo-pager.pagesPerGroup}">[이전]</a>
							</c:if>
							
							
							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
									<c:if test="${pager.pageNo != i}">
										<a href="reviewlist.do?pageNo=${i}" class="btn btn-online-success btn-sm">${i}</a>
									</c:if>
									<c:if test="${pager.pageNo == i}">
										<a href="reviewlist.do?pageNo=${i}" class="btn btn-danger btn-sm">${i}</a>
									</c:if>
							</c:forEach>
							 
							 <c:if test="${pager.groupNo < pager.totalGroupNo }">
							 	<a href="reviewlist.do?pageNo=${pager.endPageNo + 1}">[다음]</a>
							 </c:if>
							
							<a href="reviewlist.do?pageNo=${pager.totalPageNo}" class="btn btn-outline-primary btn-sm" >맨끝</a>
							<c:if test="${sessionMid != null}">
								<a href="write.do" class="btn btn-outline-primary btn-sm" >상품 리뷰</a>
							</c:if>
						</td>
					</tr>
				</c:if>		
			</table>
		</div>
		
		

		
	</body>
</html>