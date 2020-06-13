%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
		<!-- 외부 라이브러리이용, UI꾸미기 -->
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
					/* $("#logout").hide();
					$("#mypage").hide(); */
					$("#loginForm").hide();
					$("#joinForm").hide();
					$("#div2").show();
				} else {
					/* $("#logout").show();
					$("#mypage").show(); */
					$("#loginForm").show();
					$("#joinForm").show();
					$("#div2").hide();
				}
			});
			//수정 확인 하기
			function ajax_login() {
				var mid = $("#loginForm #mid").val();
				var mpassword = $("#loginForm #mpassword").val();
				if (mid == "") {
					window.alert("아이디 입력해라");
					return;
				}
				if (mpassword == "") {
					window.alert("비밀번호 입력해라");
					return;
				}
				
				$.ajax({
					url : "${pageContext.request.contextPath}/member/ajax_login.do",
					data : {
						mid : mid,
						mpassword : mpassword
					},
					success : function(data) {
						
						if (data.check == "success") {
							$("#loginForm").hide();
							$("#joinForm").hide();
							/* $("#logout").show();
							$("#mypage").show(); */
							$("#div2").show();
						} else {
							$("#loginForm").show();
							$("#joinForm").show();
							/* $("#logout").hide();
							$("#mypage").hide(); */
							$("#div2").hide();
							if(data.check == "wrongMid" && data.check !=""){
								console.log("wrongmid")
								window.alert("ID가 존재하지 않습니다. 회원가입을 진행해 주세요.");
								
							} 
							if(data.check == "wrongMpassword" && data.check !=""){
								console.log("wrongmpass")
								window.alert("password가 다릅니다.")
							} 
						}
						
					}
				});
			}
			function ajax_logout() {
				$.ajax({
					url : "${pageContext.request.contextPath}/member/ajax_logout.do",
					success : function(data) {
						if (data.check == "ok") {
							
							$("#loginForm").show();
							$("#joinForm").show();
						/* 	$("#logout").hide();
							$("#mypage").hide(); */
							$("#div2").hide();
							
						}
					}
				});
		
			}
		</script>
		<script>
			function profile() {
				var src = "${pageContext.request.contextPath}/resource/img/test.jpg"
				return src;
			}
		</script>
	
	</head>
	<body>
		<h5 class="alert alert-info">/home/main.jsp</h5>
		<div align="right">
			<a href="basket.do">장바구니</a>
		</div>
		<div id="login">
			<div id="div1">
				<form id="loginForm" name="loginForm">
					<div>아이디<input id="mid" name="mid" type="text" /></div>
				  	<div>비밀번호<input id="mpassword" name="mpassword" type="password" /></div>
				  	<div><input	onclick="ajax_login()" type="button" value="로그인" /></div>  
				</form>
		
				<div id="joinForm">
					<a href="${pageContext.request.contextPath}/member/joinStep1.do">회원가입</a>
				</div>
			</div>
			
			<div id="div2">
				<div style="margin: 10px; padding: 10px; box-sizing: border-box; ">
					<img  id="profile" width="100px" height="100px" src=""/>
					<script>
						$("#profile").attr("src",profile());
					</script>
				</div>
				<div>
					<a id="logout" href="javascript:ajax_logout()">로그아웃</a>
					<a id="mypage" href="${pageContext.request.contextPath}/member/mypage.do?mid=${sessionMid}">myPage</a>
				</div>
			</div>	
		</div>
		<div style="overflow:auto; width: 200px;">
			<%-- <a onclick="return test()" href="main.do" class="btn btn-primary btn-sm">인기</a>--%>
			<a id="test" href="main.do">인기</a>
			
		</div>
		


		
		
	</body>
</html>