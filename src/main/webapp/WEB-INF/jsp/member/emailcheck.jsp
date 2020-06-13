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
						
			/* var check = 0;
			function emailcheck() {
				var memail = $("#memail").val();
				if(!memail.includes("@",0)) {
					window.alert("qqqq@qqqq.com 이 기본 form 입니다.")
					return false;
				}
				
					
				$.ajax({
					url:"emailCheck.do",
					data: {memail:memail},
					success:function(data) {
						if(data.result == "ok") {
							window.alert("email을 발송하였습니다. 키 값을 인증폼에 입력해 주세요.")
							check = 1;
							return true;
						} else {
							if(mid=="" ||mid == null){
								$("#idnone").html("ID는 필수 입력");
								check=0
							} else {
								$("#idnone").html("회원가입 진행하세요");
								check=0;
							}
							
						} 
						return false;
					}
				});
			} 
			*/
			</script>
			<script>
			function validate() {
				
				
				if(!$("#memail").val().includes("@",0)) {
					window.alert("qqqq@qqqq.com 이 기본 form 입니다.")
					return false;
				}
				
				
			}
			
		</script>
		<!-- <script type="text/javascript">
			$(".form-wrap").css("height", "500px")
		</script> -->
	</head>

	<body>
	
		
		
			<div class="wrap">
			    <div class="form-wrap">
			     
		
					<div >
						<form action="emailCheck.do" method="post" onsubmit="return validate()">
							
							
							<div>
								<ul><input id="memail" type="text" name="memail" class="input-field" placeholder="Email" required></ul>
							</div>
							
							
							<!-- <div class="social-icons">
			                    <img src="img/fb.png" alt="facebook">
			                    <img src="img/tw.png" alt="twitter">
			                    <img src="img/gl.png" alt="google">
			                </div> -->
							<div class="button-wrap">
								<input class="togglebtn" type="submit" value="email인증번호수신"/>
								<input class="togglebtn" type="reset"  value="입력취소"/>
							</div>
						</form>
					</div>
				
			</div>
		</div>	
	</body>

</html>
