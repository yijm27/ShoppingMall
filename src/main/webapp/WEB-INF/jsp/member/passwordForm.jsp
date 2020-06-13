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
			// 공백
			function checkSpace(str) { 
				if(str.search(/\s/) != -1) { 
					return true; } 
				else { 
					return false; } 
				} 
			// 특수 문자
			function checkSpecial(str) { 
				var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi; 
				if(special_pattern.test(str) == true) { 
					return true; } 
				else { 
					return false; } 
				} 
			// 비밀번호 패턴 체크 8자 이상, 문자, 숫자, 특수문자
			function checkPasswordPattern(str) { 
				var pattern1 = /[0-9]/; 
				// 숫자 
				var pattern2 = /[a-zA-Z]/; 
				// 문자 
				var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; 
				// 특수문자 
				if(!pattern1.test(str) || !pattern2.test(str) || !pattern3.test(str) || str.length < 8) { 
					alert("비밀번호는 8자리 이상의 문자, 숫자, 특수문자로 구성"); 
					return false; } 
				else { 
					return true; } 
				} 
		</script>


		
		<script>
						
			var check = 0;
			function checkId() {
				$("#idexist").html("");
				$("#idnone").html("");
				var mid = $("#mid").val();
					
				$.ajax({
					url:"joinCheck.do",
					data: {mid:mid},
					success:function(data) {
						if(data.result == "ok") {
							$("#idexist").html("ID존재");
							check = 1;
							$("#getkey" ).attr( "class", "btn btn-primary" );
							
						} else {
							if(mid=="" ||mid == null){
								$("#idnone").html("ID는 필수 입력");
								check=0
							} else {
								$("#idnone").html("회원가입 진행하세요");
								check=0;
							}
							
						}
					}
				});
			}
			</script>
			<script>
			function validate() {
				
				if(state == false) {
					window.alert("이메일 인증을 진행해 주세요.");
					return false
				}
				
				if(check != 1) {
					window.alert("ID가 존재하지 않습니다. 회원가입을 진행해 주세요.");
					return false;
				}
				/* if(!checkPasswordPattern($("#mpass1").val())){
					return false;
				}
				if($("#mpass1").val() != $("#mpass2").val()) {
					window.alert("비밀번호가 다릅니다.")
					return false;
				} */
				
			/* 	if($("#mname").val() == "" || $("#mname").val()==null) {
					window.alert("이름은 필수 입력 값 입니다.");
					return false;
				} */
				
				/* if($("#mpass1").val() == null || $("#mpass1").val() == ""|| $("#mpass2").val() == null || $("#mpass2").val() == "") {
					window.alert("비밀번호는 필수 입력 값입니다.");
					return false;
				} */
				
								
				/* if($("#mid").val() == "" || $("#mid").val()==null) {
					window.alert("아이디는 필수 입력 값입니다.")
					return false;
				}  */
				/* if(!$("#mtel").val().includes("-",0)) {
					window.alert("000-0000-0000 이 기본 form 입니다.")
					return false;
				}
				if(!$("#memail").val().includes("@",0)) {
					window.alert("qqqq@qqqq.com 이 기본 form 입니다.")
					return false;
				} */
				
			}
		</script>
	
		<script>
			function checkEmail() {
				myWindow = window.open(
						"http://localhost:8080/project/member/emailcheckpass.do", "", "width=500,height=500");
			}
		</script>
		<script type="text/javascript">
			function checkKey() {
				myWindow = window.open(
						"http://localhost:8080/project/member/emailPkey.do", "", "width=500,height=500");
			}
		</script>
		<script type="text/javascript">
			//$("#getkey" ).attr( "", "Photo by Kelly Clark" );

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
			    <div class="form-wrap" style="height: 500px;">
			      <div class="col-lg-12 text-center">
					<br/>
					<div >
						<form action="passwordChange.do" method="post" onsubmit="return validate()">
							<div>
								<input id="mid" type="text" name="mid" class="input-field" placeholder="Enter ID" required/>
								
								
								<div class="button-wrap">
									<input class="togglebtn" onclick="checkId()" type="button" value="ID 존재 여부 확인" />
									<div><span id="idexist" style="color: black;"></span><span id="idnone" style="color: black;"></span><span id="nullid" style="color: black;"></span></div>
								</div>
								
								<div class="button-wrap">	
									<a class="togglebtn" href="joinStep1.do" type="button" style="font-family: monospace; color: black; ">회원가입</a>
								</div>	
								
							</div>
							
							
					</div>
							
							<input id="getkey" onclick="checkEmail()" type="button" value="email 인증키 받기" class="btn btn-outline-primary"/>
							<input id="ckey" onclick="checkKey()" type="button" value="email 인증키 입력" class="btn btn-outline-primary "/>
							<!-- <div class="social-icons">
			                    <img src="img/fb.png" alt="facebook">
			                    <img src="img/tw.png" alt="twitter">
			                    <img src="img/gl.png" alt="google">
			                </div> -->
							<div class="button-wrap">
								<input class="togglebtn" type="submit" value="비밀번호 찾기"/>
								<input class="togglebtn" type="reset"  value="입력취소"/>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>	
	</body>

</html>
