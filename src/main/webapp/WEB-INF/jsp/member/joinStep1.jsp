<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
	<script
		src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
	<script
		src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" type="text/scc"
		href="${pageContext.request.contextPath}/resource/vendor-scroll/vendor/bootstrap/css/bootstrap.css">
	
	<!-- Custom styles for this template -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resource/css/scrolling-nav.css">
	
	<c:if test="${check!=null}">
			<script>
				state = true;
			</script>
		</c:if>
		<c:if test="${check==null}">
			<script>
				state = false;
			</script>
		</c:if>
	<script>
		function check() {
			console.log("실행")
			
			/* if($("#check1").val()!="agree" || $("#check11").val()=="disagree"){
				window.alert("게인정보제공 동의에 체크해 주세요");
				console.log("1");
				return false;
			}else if($("#check2").val()!="agree" || $("#check22").val()=="disagree"){
				window.alert("서비스 제공, 환불 규약에 동의해주세요");
				console.log("2");
				return false;
			}else if($("#check3").val()!="agree" || $("#check33").val()=="disagree"){
				window.alert("세번쩨 동의에 체크해 주세요");
				console.log("3");
				return false;
			} else {
				return true;
			} */
			
			if(state == false) {
				window.alert("이메일 인증을 진행해 주세요.");
				$("#getkey" ).attr( "class", "btn btn-primary" );
				$("#checkkey" ).attr( "class", "btn btn-primary" );
				return false
			}	
			/* if ($("#check1").val() == "agree") {
				if ($("#check2").val() == "agree") {
					if ($("#check3").val() == "agree") {
						
						console.log("1");
						return true;
					}
					else{
						window.alert("동의에 체크해 주세요");
						return false;
					}
				}else{
					window.alert("동의에 체크해 주세요");
					return false;
				}
			}else{
				window.alert("동의에 체크해 주세요");
				return false;
			}
			return false; */
		}
	</script>
	
	<script type="text/javascript">
		function checkEmail() {
			myWindow = window.open(
					"http://localhost:8080/project/member/emailcheck.do", "", "width=500,height=500");
		}
	</script>
	<script type="text/javascript">
		function checkKey() {
			myWindow = window.open(
					"http://localhost:8080/project/member/emailKey.do", "", "width=500,height=500");
		}
	</script>
	<script type="text/javascript">
		function atag() {
			location.href = "http://localhost:8080/project/home/main.do";
		}
	</script>
	
</head>

<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="${pageContext.request.contextPath}/home/main.do">M3.com</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#about">개인정보제공동의</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#services">서비스규정동의</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#contact">광고수신동의</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<header>
		<div align="center">
			<img src="${pageContext.request.contextPath}/resource/img/joinForm.png" />
		</div>
	</header>

	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<h2>개인 정보 제공 동의</h2>
					<p class="lead">This is a great place to talk about your
						webpage. This template is purposefully unstyled so you can use it
						as a boilerplate or starting point for you own landing page
						designs! This template features:</p>
					<ul>
						<li>Clickable nav links that smooth scroll to page sections</li>
						<li>Responsive behavior when clicking nav links perfect for a
							one page website</li>
						<li>Bootstrap's scrollspy feature which highlights which
							section of the page you're on in the navbar</li>
						<li>Minimal custom CSS so you are free to explore your own
							unique design options</li>
					</ul>
				</div>
				<div>
				<form action="joinStep1.do" method="post" onsubmit="return check()">
					
					<input id="check1" type="radio" name="result" value="agree" checked/>동의
					<input id="check11" type="radio" name="result" value="disagree" />비동의
				</div>
				</div>
			</div>
		</div>
	</section>

	<section id="services" class="bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<h2>서비스 제공 환불 동의</h2>
					<p class="lead">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Aut optio velit inventore, expedita quo
						laboriosam possimus ea consequatur vitae, doloribus consequuntur
						ex. Nemo assumenda laborum vel, labore ut velit dignissimos.</p>
				</div>
				<div>
					<input id="check2" type="radio" name="result2" value="agree" checked/>동의
					<input id="check22" type="radio" name="result2" value="disagree" />비동의
				</div>
			</div>
		</div>
	</section>

	<section id="contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<h2>광고수신동의</h2>
					<p class="lead">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Vero odio fugiat voluptatem dolor, provident
						officiis, id iusto! Obcaecati incidunt, qui nihil beatae magnam et
						repudiandae ipsa exercitationem, in, quo totam.</p>
				</div>
				<div>
					<input id="check3" type="radio" name="result3" value="agree" checked/>동의
					<input id="check33" type="radio" name="result3" value="disagree" />비동의
				</div>
			</div>
			</br>
				
		
			 
			<div style="margin-top: 10px;" align="center">
				<input id="getkey" onclick="checkEmail()" type="button" value="email 인증키 받기" class="btn btn-outline-primary "/>
				<c:if test="${mkey != null}">
				<input id="checkkey" onclick="checkKey()" type="button" value="email 인증키 입력" class="btn btn-outline-primary "/>
				</c:if>
				<input type="submit" value="저장" class="btn btn-outline-primary "/>
				<input type="reset" onclick="atag()" value="취소" class="btn btn-outline-primary "/>
				</form>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; M3 
				Website 2020</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/resource/vendor-scroll/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/vendor-scroll/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="${pageContext.request.contextPath}/resource/vendor-scroll/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom JavaScript for this theme -->
	<script src="${pageContext.request.contextPath}/resource/js/scrolling-nav.js"></script>

</body>

</html>