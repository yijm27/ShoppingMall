<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="utf-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
	
	<!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/vendor-bare/vendor/bootstrap/css/bootstrap.min.css" />
		<!-- Bootstrap core JavaScript -->
		<script src="${pageContext.request.contextPath}/resource/vendor-bare/vendor/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/vendor-bare/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/form.css" />
		<c:if test="${sessionMid==null}">
			<script>
				loginState = false;
			</script>
		</c:if>
		<c:if test="${sessionMid!=null}">
			<script>
				loginState = true;
			</script>
		</c:if>
		<c:if test="${checkpass!=null}">
			<script>
				state = true;
			</script>
		</c:if>
		<c:if test="${checkpass==null}">
			<script>
				state = false;
			</script>
		</c:if>
		<script>
			function check() {
				console.log("실행")
								
				if(state == false) {
					window.alert("이메일 인증을 진행해 주세요.");
					return false
				}
		</script>	
		<script>
			$(function() {
				if (loginState == true) {
					//$("#loginForm").hide();
					$("#join").hide();
				
					$("#mypage").show();
					$("#logout").show();
					$("#basket").show()
				} else {
					//$("#loginForm").show();
					$("#join").show();
				
					$("#mypage").hide();
					$("#logout").hide();
					$("#basket").hide()
				}
			});
		</script>
		
		
		
		<script>
			function checkEmail() {
				myWindow = window.open(
						"http://localhost:8080/project/member/idCheck.do", "", "width=500,height=500");
			}
		</script>
		
		
		
	</head>

	<body>
	
		<!-- Navigation -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
			<div class="container">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/home/main.do">M3.com(비밀번호 확인)</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/home/main.do">Home
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item">
			            <a class="nav-link" href="${pageContext.request.contextPath}/board/list.do">Agora</a>
				          </li>
				          <li class="nav-item">
				            <a id="join" class="nav-link" href="${pageContext.request.contextPath}/member/joinStep1.do">Join</a>
				          </li>
				          <li  class="nav-item">
				            <a id="logout" class="nav-link" href="javascript:ajax_logout()">Logout</a>
				          </li>
				          <li  class="nav-item">
				          	<a id="mypage" class="nav-link" href="${pageContext.request.contextPath}/member/mypage.do?mid=${sessionMid}">Mypage</a>
				          </li>
				          <li  class="nav-item">
				            <a id="basket" class="nav-link" href="basket.do">basket</a>
					</ul>
				</div>
			</div>
			
		</nav>
		
			<div class="wrap" style="background-image: url('${pageContext.request.contextPath}/resource/img/password.jpg');">
				</br>
				</br>
			    <div class="form-wrap" style="height: 250px;">
			      <div class="col-lg-12 text-center">
					<br/>
					<div >
						 
											
							<input id="gkey" onclick="checkEmail()" type="button" value="email로 id 받기" class="btn btn-outline-primary"/>
								<!-- <div class="social-icons">
			                    <img src="img/fb.png" alt="facebook">
			                    <img src="img/tw.png" alt="twitter">
			                    <img src="img/gl.png" alt="google">
			                </div> -->
							<div class="button-wrap">
								<a class="togglebtn" href="${pageContext.request.contextPath}/home/main.do"/>홈으로</a>
							</div>
						
					</div>
				</div>
			</div>
		</div>	
	</body>

</html>
