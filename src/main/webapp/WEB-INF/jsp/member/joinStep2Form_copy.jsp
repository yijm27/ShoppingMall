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
		<script> 
			// 공백이 체크 
			function checkSpace(str) { 
				if(str.search(/\s/) != -1) { 
					return true; } 
				else { 
					return false; } 
				} 
			// 특수 문자체크 
			function checkSpecial(str) { 
				var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi; 
				if(special_pattern.test(str) == true) { 
					return true; } 
				else { 
					return false; } 
				} 
			// 비밀번호 패턴 체크 (8자 이상, 문자, 숫자, 특수문자 포함여부 체크) 
			function checkPasswordPattern(str) { 
				var pattern1 = /[0-9]/; 
				// 숫자 
				var pattern2 = /[a-zA-Z]/; 
				// 문자 
				var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; 
				// 특수문자 
				if(!pattern1.test(str) || !pattern2.test(str) || !pattern3.test(str) || str.length < 8) { 
					alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다."); 
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
				;	
				$.ajax({
					url:"joinCheck.do",
					data: {mid:mid},
					success:function(data) {
						if(data.result == "ok") {
							$("#idexist").html("Id 중복");
							check = 0;
							
						} else {
							if(mid=="" ||mid == null){
								$("#idnone").html("ID는 필수 입력 값 입니다.");
								check=0
							} else {
								$("#idnone").html("사용 가능한 ID");
								check=1;
							}
							
						}
					}
				});
			}
			</script>
			<script>
			function validate() {
				
				if(check != 1) {
					window.alert("ID가 중복이거나 중복 검사를 하지 않았습니다. ID 중복검사를 해주세요");
					return false;
				}
				if(!checkPasswordPattern($("#mpass1").val())){
					return false;
				}
				if($("#mpass1").val() != $("#mpass2").val()) {
					window.alert("비밀번호가 다릅니다.")
					return false;
				}
				
				if($("#mname").val() == "" || $("#mname").val()==null) {
					window.alert("이름은 필수 입력 값 입니다.");
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
				if($("#mbirth1").val() == null || $("#mbirth1").val() == "" || $("#mbirth2").val() == null || $("#mbirth2").val() == "") {
					window.alert("주민번호는 필수 입력값 입니다.")
					return false;
				} 
				if(!$("#mtel").val().includes("-",0)) {
					window.alert("-를 추가해 주세요.")
					return false;
				} 
			}
		</script>	
	</head>
	<body>
		<h5 class="alert alert-info">/member/joinStep2.jsp</h5>
		<div>
			<form action="joinStep2.do" method="post" onsubmit="return validate()">
				<div>
					<ul>*이름</ul>
					<ul><input id="mname" type="text" name="mname" /></ul>
				</div>
				<div>
					<ul>*아이디</ul> 
					<ul><input id="mid" type="text" name="mid" /><input onclick="checkId()" type="button" value="중복확인"></ul>
					<ul><span id="idexist"></span><span id="idnone"></span><span id="nullid"></span></ul>
					
					
				</div>
				<div>
					<ul>*비밀번호</ul>
					<ul><input id="mpass1" type="password" name="mpassword"/></ul>
					
				</div>
				<div>
					<ul>*비밀번호 확인</ul>
					<ul><input id="mpass2" type="password"/></ul>
				</div>
				
				<div>
					<ul>*주민번호</ul>
					<ul><input id="mbirth1" type="text" name="num1" size="10" maxlength="6"/> - <input id="mbirth2" type="text" name = "num2" size="10" maxlength="7"/></ul>
				</div>
				<div>
					<ul>*휴대폰</ul>
					<ul><input id="mtel" type="tel" name="mtel" maxlength="20"/></ul>
				</div>
				<div>
					<ul>*email</ul>
					<ul><input type="text" name="front" maxlength="20"/> @ 
					<select name="back">
						<option>naver.com</option>
						<option>naver1.com</option>
					</select> </ul>
					
				</div>
				<div>
					<ul>*주소</ul>
					<ul><input type="address" name="maddress"/></ul>
				</div>
				<div>
					<input type="submit" name="저장"/>
					<input type="reset"  name="입력취소"/>
				</div>
			</form>
		</div>
			
	</body>
</html>