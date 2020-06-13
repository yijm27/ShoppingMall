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
		<script type="text/javascript">
			function ajax_logout() {
				$.ajax({
					url : "${pageContext.request.contextPath}/member/ajax_logout.do",
					success : function(data) {
						if (data.check == "ok") {
							
							//$("#loginForm").show();
							$("#join").show();
						
							$("#mypage").hide();
							$("#logout").hide();
							$("#basket").hide()
						}
					}
			});
		}
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
			function validate() {
				
				
				if(!checkPasswordPattern($("#mpass3").val())){
					return false;
				}
				if($("#mpass3").val() != $("#mpass4").val()) {
					window.alert("비밀번호가 다릅니다.")
					return false;
				}
				
				
				
				
				/* if($("#mpass1").val() == null || $("#mpass1").val() == ""|| $("#mpass2").val() == null || $("#mpass2").val() == "") {
					window.alert("비밀번호는 필수 입력 값입니다.");
					return false;
				} */
				
								
				/* if($("#mid").val() == "" || $("#mid").val()==null) {
					window.alert("아이디는 필수 입력 값입니다.")
					return false;
				}  */
				 
				if(!$("#mtel").val().includes("-",0)) {
					window.alert("tel에 -를 추가해 주세요.")
					return false;
				}
				if(!$("#memail").val().includes("@",0)) {
					window.alert("email에 @를 추가해 주세요.")
					return false;
				}
				
			}
		</script>
		<script type="text/javascript">
			function fun1() {
				location.href = "${pageContext.request.contextPath}/home/main.do";
			}
		</script>
		
	</head>

	<body>
	
		<!-- Navigation -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
			<div class="container">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/home/main.do">M3.com(updateForm)</a>
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
			          </li>
					</ul>
				</div>
			</div>
		</nav>
			<div class="wrap">
			    <div class="form-wrap">
			      <div class="col-lg-12 text-center">
		
					<div >
						<form method="post" onsubmit="return validate()">
							<div>
								<ul><input id="mname1" type="text" name="mname" class="input-field" readonly value="${member.mname}"/></ul>
							</div>
							<div>
								<ul><input id="mid" type="text" name="mid" class="input-field" disabled placeholder="${member.mid}"/></ul>
							</div>
							<div>
								<ul><input id="mpass3" type="password" name="mpassword" class="input-field" value="${member.mpassword}"/></ul>
								
							</div>
							<div>
								<ul><input id="mpass4" type="password" class="input-field" value="${member.mpassword}"/></ul>
							</div>
							
							<div>
								
								<ul><input id="mbirth1" type="text" name="mbirth" size="10" maxlength="6" class="input-field" pattern="[0-9]{6}-[0-9]{7}" readonly value="${member.mbirth}" />
							</div>
							<div>
								
								<ul><input id="mtel" type="tel" name="mtel" maxlength="20" class="input-field" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" value="${member.mtel}"/></ul>
							</div>
							<div>
								<ul><input id="memail" type="email" name="memail" maxlength="20" class="input-field" value="${member.memail}">
							</div>
							<div>
								<ul><input type="address" name="maddress" class="input-field" value="${member.maddress}"/></ul>
							</div>
							<!-- <div class="social-icons">
			                    <img src="img/fb.png" alt="facebook">
			                    <img src="img/tw.png" alt="twitter">
			                    <img src="img/gl.png" alt="google">
			                </div> -->
							<div class="button-wrap">
								<input class="togglebtn" type="submit" value="회원 정보 수정"/>
								<button class="togglebtn" onclick="fun1()">홈으로</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>	
	</body>

</html>
