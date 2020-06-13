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
		
		<script>
			function validate() {
				if(!$("#memail").val().includes("@",0)) {
					window.alert("@를 꼭 해주세요")
					return false;
				}
			}
			
		</script>
	</head>
	<body>
			<div class="wrap">
			    <div class="form-wrap">
					<div >
						<form action="idCheck.do" method="post" onsubmit="return validate()">
							<div>
								<ul><input id="memail" type="text" name="memail" class="input-field" placeholder="Email" required></ul>
							</div>
							<div class="button-wrap">
								<input class="togglebtn" type="submit" value="email로 ID 보내기"/>
								<input class="togglebtn" type="reset"  value="입력취소"/>
							</div>
						</form>
					</div>
				
			</div>
		</div>	
	</body>

</html>
