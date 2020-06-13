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
		<style>
		  .container {
		    width: 700px;
		    height: 500px;
		    overflow: auto;
		  }
		  .container::-webkit-scrollbar {
		    width: 10px;
		  }
		  .container::-webkit-scrollbar-thumb {
		    background-color: #2f3542;
		    border-radius: 10px;
		    background-clip: padding-box;
		    border: 2px solid transparent;
		  }
		  .container::-webkit-scrollbar-track {
		    background-color: grey;
		    border-radius: 10px;
		    box-shadow: inset 0px 0px 5px white;
		  }
		</style>
	</head>
	<body>
		<h5 class="alert alert-info">/member/joinForm.jsp</h5>
		
		
		<div id="div1" style="border: 1px soild black;">
			<div>
				<p>U should agree this appointment if you wanna join our mall... please</p>
				
			</div>
			<div>
				<form action="joinStep1.do" method="post" >
					<input type="radio" name="result" value="agree"/>동의
					<input type="radio" name="result" value="disagree"/>비동의
					
					<div style="margin-top: 50px;">
								개인정보 처리 방침
						<div class="container">
							
						      Lorem ipsum, dolor sit amet consectetur adipisicing elit. Enim modi in
						      exercitationem explicabo, at rem officia autem non porro soluta dolorum
						      officiis ipsa repellat, laudantium ea unde labore, temporibus quas?Lorem
						      ipsum dolor sit amet, consectetur adipisicing elit. Eveniet eius totam
						      quam pariatur ratione, in voluptatem dignissimos laboriosam sint aut!
						      Repudiandae consectetur odit quo corrupti quidem perferendis aut dolores
						      quis?Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat nam
						      optio dolore recusandae fuga voluptatibus. Ea quam deserunt consectetur
						      quo aut eligendi, molestiae incidunt molestias ullam? Repellendus ratione
						      repellat
						       Lorem ipsum, dolor sit amet consectetur adipisicing elit. Enim modi in
						      exercitationem explicabo, at rem officia autem non porro soluta dolorum
						      officiis ipsa repellat, laudantium ea unde labore, temporibus quas?Lorem
						      ipsum dolor sit amet, consectetur adipisicing elit. Eveniet eius totam
						      quam pariatur ratione, in voluptatem dignissimos laboriosam sint aut!
						      Repudiandae consectetur odit quo corrupti quidem perferendis aut dolores
						      quis?Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat nam
						      optio dolore recusandae fuga voluptatibus. Ea quam deserunt consectetur
						      quo aut eligendi, molestiae incidunt molestias ullam? Repellendus ratione
						      repellat
						       Lorem ipsum, dolor sit amet consectetur adipisicing elit. Enim modi in
						      exercitationem explicabo, at rem officia autem non porro soluta dolorum
						      officiis ipsa repellat, laudantium ea unde labore, temporibus quas?Lorem
						      ipsum dolor sit amet, consectetur adipisicing elit. Eveniet eius totam
						      quam pariatur ratione, in voluptatem dignissimos laboriosam sint aut!
						      Repudiandae consectetur odit quo corrupti quidem perferendis aut dolores
						      quis?Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat nam
						      optio dolore recusandae fuga voluptatibus. Ea quam deserunt consectetur
						      quo aut eligendi, molestiae incidunt molestias ullam? Repellendus ratione
						      repellat
					    </div>
					    
					</div>
					<input type="radio" name="result2" value="agree"/>동의
					<input type="radio" name="result2" value="disagree"/>비동의
					
					<div style="margin-top: 10px;">
						<input type="submit" value="저장">
					</div>
					
				</form>
			</div>
			
			
		</div>
		
	</body>
</html>