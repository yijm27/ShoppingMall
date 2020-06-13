<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
   
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
   <!-- Google Font -->
   <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">

   <!-- Css Styles -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/yunji/css/bootstrap.min.css" type="text/css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/yunji/css/font-awesome.min.css" type="text/css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/yunji/css/elegant-icons.css" type="text/css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/yunji/css/nice-select.css" type="text/css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/yunji/css/barfiller.css" type="text/css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/yunji/css/owl.carousel.min.css" type="text/css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/yunji/css/slicknav.min.css" type="text/css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/yunji/css/style.css" type="text/css">

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
		<title>Shop Homepage - Start Bootstrap Template</title>
		
		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" type="text/scc" href="${pageContext.request.contextPath}/resource/vendor/bootstrap/css/bootstrap.css" >
		
		<!-- Custom styles for this template -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/shop-homepage.css" >
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/form.css" />
		<!-- Bootstrap core JavaScript -->
  		<script src="${pageContext.request.contextPath}/resource/vendor/jquery/jquery.min.js"></script>
  		<script src="${pageContext.request.contextPath}/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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
					$("#loginForm").hide();
					$("#join").hide();
				
					$("#mypage").show();
					$("#logout").show();
					$("#basket").show()
				} else {
					$("#loginForm").show();
					$("#join").show();
				
					$("#mypage").hide();
					$("#logout").hide();
					$("#basket").hide()
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
							$("#join").hide();
						
							$("#mypage").show();
							$("#logout").show();
							$("#basket").show()
						} else {
							$("#loginForm").show();
							$("#join").show();
						
							$("#mypage").hide();
							$("#logout").hide();
							$("#basket").hide()
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
							$("#join").show();
						
							$("#mypage").hide();
							$("#logout").hide();
							$("#basket").hide()
						}
					}
				});
		
			}
		</script>
		<!-- <script>
			function enterKey() {
				if(window.event.keyCode==13){
					ajax_login();
				}
			}
		</script> -->
		
		

</head>

<body>

<header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                       <a  class="my-4" href="main.do">M3.com</a>
                    </div> 
                    <div class="col-lg-9 col-md-9">
                        
                    </div>
                </div>
                <div class="canvas__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </div>
        <div class="header__nav">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 col-md-9">
                    <nav class="header__menu">
                        <ul class="mobile-menu">
                            
                            <li><a id="join" href="${pageContext.request.contextPath}/member/joinStep1.do" style="color: black;">회원가입</a></li>
                            <li><a id="logout" href="javascript:ajax_logout()" style="color: black;">로그아웃</a></li>
                            <li class="active"><a href="${pageContext.request.contextPath}/board/list.do" style="color: black;">상품 리뷰</a></li>
                            <li><a id="mypage" href="" style="color: black;">마이페이지</a>
                                <ul class="dropdown">
                                   <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/update.do?mid=${sessionMid}" style="color: black;">회원정보수정</a></li>
                                   <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/delete.do?mid=${sessionMid}" style="color: black;">회원탈퇴</a></li>
                                   <li><a class="dropdown-item" href="${pageContext.request.contextPath}/account/mypoint.do?mid=${sessionMid}" style="color: black;">마이포인트</a></li>
                                </ul>
                            </li>
                           
                      </ul>
                    </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>





<%-- 

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="main.do">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/board/list.do">Agora</a>
          </li>
          <li class="nav-item">
            <a id="join" class="nav-link" href="${pageContext.request.contextPath}/member/joinStep1.do">Join</a>
          </li>
          <li  class="nav-item">
            <a id="logout" class="nav-link" href="javascript:ajax_logout()">Logout</a>
          </li>
          <li  id="drop" class="nav-item">
            <a id="mypage" class="nav-link" href="${pageContext.request.contextPath}/member/mypage.do?mid=${sessionMid}">Mypage</a>
          </li>
          <li  class="nav-item">
            <a id="basket" class="nav-link" href="basket.do">basket</a>
          </li>
        </ul>
      </div>
    </div>
  </nav> --%>
 

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">Manners Makes Man</h1>
        <div class="list-group">
          <div id="login">
			<div id="div1">
				<form id="loginForm" name="loginForm">
					<div><input id="mid" name="mid" type="text" class="input-field" placeholder="Enter ID" required/></div>
				  	<div><input id="mpassword" name="mpassword" type="password" class="input-field" placeholder="Enter PassWord" required/></div>
				  	<div align="right">
				  		<input class="togglebtn" onclick="ajax_login()" type="button" value="login" />
				  	</div>
				  	<div align="right">
				  		<a class="nav-link" href="${pageContext.request.contextPath}/member/password.do" style="font-style:normal; color: black;">password 찾기</a>
				  		<a class="nav-link" href="${pageContext.request.contextPath}/member/id.do" style="font-style:normal; color: black;">Id 찾기</a>
				  	</div>	
				</form>
			</div>
		  </div>
          
          <a href="main.do?pname=hat" class="list-group-item"   id="categoryhat">모자</a>
          <a href="main.do?pname=shirts" class="list-group-item" id="categoryhat">상의</a>
          <a href="main.do?pname=pants" class="list-group-item" id="categoryhat">하의</a>
          <a href="main.do?pname=summer" class="list-group-item" id="categoryhat">여름</a>
          <a href="main.do?pname=winter" class="list-group-item"  id="categoryhat">겨울</a>
          <script type="text/javascript">
	          var text1 = "${sessionPNM}";
	          switch (text1) {
				case "hat":
					text1="모자";
					break;
				case "pants":
					text1="하의";
					break;
				case "shirts":
					text1="상의";
					break;
				case "summer":
					text1="여름";
					break;
				case "winter":
					text1="겨울";
					break;
				default:
					break;
			}
	       		var items = $('.list-group-item');
	       		for (var i = 0; i < items.length; i++) { 
	                 if ($(items[i]).text()==text1) {
	                     $(items[i]).css("border","3px solid orange");
	                 }
				}
          </script>
          <form method="post" action="search.do">
			<input type="text" id="searchHtitle=" name="searchHTT"></input>
			<input type="submit" value="검색"></input>
		</form>
        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="${pageContext.request.contextPath}/resource/img/catface.jpg" style="width: 900px; height: 350px;"  alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="${pageContext.request.contextPath}/resource/img/catdress.jpg" style="width: 900px; height: 350px;" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="${pageContext.request.contextPath}/resource/img/catface.jpg" style="width: 900px; height: 350px;" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">
<c:forEach var="home" items="${homelist}">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="detailview.do?hpno=${home.hpno}" id="id${home.hpno}">
									<img class="card-img-top" id="img${home.hpno}"
									src="${pageContext.request.contextPath}/resource/img/catface.jpg" />
								</a>
								<div class="card-body">
									<h4 class="card-title">
										<%-- <a href="#">${home.hno}</a> --%>
									</h4>
									<h5 id="h5${home.hpno}"></h5>
									<p class="card-text">${home.htitle},${home.hpno}</p>
								</div>
								<div class="card-footer">
									<small class="text-muted" id="small${home.hpno}"> </small>
								</div>
							</div>
						</div>
					</c:forEach>

					<c:forEach var="product" items="${productlist}">
						<script type="text/javascript">
							var div = document.querySelector("#h5${product.pno}");
							div.innerHTML = "이름:${product.pname}" + "\n";
							div.innerHTML += "${product.pprice}" + "원\n";
							
						</script>
					</c:forEach>

					<c:forEach var="likey" items="${likeylist}">
						<script>
							var div = document.querySelector("#small${likey.lkpno}");
							div.innerHTML = "좋아요:" + "${likey.lkcount}";
						</script>
					</c:forEach>
				</div>
				
				<table style="text-align: center">
			<tr>
				<td colspan="6" style="text-align: center"><a
					class="btn btn-outline-success btn-sm"
					href="main.do?pname=${sessionPNM}&pageNo=1">처음</a> <c:if
						test="${pager.groupNo > 1}">
						<a class="btn btn-outline-success btn-sm"
							href="main.do?pname=${sessionPNM}&pageNo=${pager.startPageNo-pager.pagesPerGroup}">이전</a>
					</c:if> <c:forEach var="i" begin="${pager.startPageNo}"
						end="${pager.endPageNo}">

						<c:if test="${pager.pageNo != i}">
							<a class="btn btn-outline-success btn-sm"
								href="main.do?pname=${sessionPNM}&pageNo=${i}">${i}</a>
						</c:if>

						<c:if test="${pager.pageNo == i}">
							<a class="btn btn-outline-danger btn-sm"
								href="main.do?pname=${sessionPNM}&pageNo=${i}">${i}</a>
						</c:if>
					</c:forEach> <c:if test="${pager.groupNo < pager.totalGroupNo }">
						<a class="btn btn-outline-success btn-sm"
							href="main.do?pname=${sessionPNM}&pageNo=${pager.endPageNo+1}">다음</a>
					</c:if> <a class="btn btn-outline-success btn-sm"
					href="main.do?pname=${sessionPNM}&pageNo=${pager.totalPageNo}">맨끝</a>
				</td>
			</tr>
		</table>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

   <!-- Js Plugins -->
   <script src="${pageContext.request.contextPath}/resource/yunji/js/jquery-3.3.1.min.js"></script>
   <script src="${pageContext.request.contextPath}/resource/yunji/js/bootstrap.min.js"></script>
   <script src="${pageContext.request.contextPath}/resource/yunji/js/jquery.nice-select.min.js"></script>
   <script src="${pageContext.request.contextPath}/resource/yunji/js/jquery.barfiller.js"></script>
   <script src="${pageContext.request.contextPath}/resource/yunji/js/jquery.slicknav.js"></script>
   <script src="${pageContext.request.contextPath}/resource/yunji/js/owl.carousel.min.js"></script>
   <script src="${pageContext.request.contextPath}/resource/yunji/js/main.js"></script>

</body>


</html>