<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=chrome">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
   rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="/css/board.css">
</head>
<body>
	<div class="container-fluid">
      <div class="container-fluid"
         style="background-color: white; position: fixed; z-index:9;">
         <div class="container">
            <c:choose>
            <c:when test="${loginID =='admin'}">
            <div class="row" id="container1">
               <nav class="navbar navbar-expand-md bg-light navbar-light">
                  <div class="container" id="navparent" style = "overflow:visible;">
                     <a class="navbar-brand h3" href="/" id="container"
                        style="padding: 0px;">Ean Soft</a>

                     <div style="height: 5rem;">
                        <button class="navbar-toggler" type="button"
                           data-bs-toggle="collapse" style="margin-top: 15px;"
                           data-bs-target="#collapsibleNavbar">
                           <span class="navbar-toggler-icon"></span>
                        </button>
                     </div>

                     <div class="collapse navbar-collapse justify-content-end"
                        id="collapsibleNavbar">
                        <ul class="navbar-nav" style="background: white;">
                           <li class="nav-item"> <a id="Home" class="nav-link" href="/"
                                    style="padding-left:0px; padding-right:0px;">Home</a> </li>
                                    
                           <li class="nav-item"> <a id="Board" class="nav-link" href="/board/list?cpage=1"
                                       style="padding-left:0px; padding-right:0px;">Board</a> </li>
                                       
                           <li class="nav-item"> <a id="Logout" class="nav-link logout" href="/member/logout"
                                       style="padding-left:0px; padding-right:0px;">Logout</a> </li>
                                       
                           <li class="nav-item"> <a id="Admin" class="nav-link" href="/admin/adminMain"
                                       style="padding-left:0px; padding-right:0px;">Admin</a> </li>
                        
                        </ul>
                     </div>
                  </div>
               </nav>
            </div>
            </c:when>
            
            <c:when test="${loginID != null}">
            <div class="row" id="container1">
               <nav class="navbar navbar-expand-md bg-light navbar-light">
                  <div class="container" id="navparent" style = "overflow:visible;">
                     <a class="navbar-brand h3" href="/" id="container"
                        style="padding: 0px;">Ean Soft</a>

                     <div style="height: 5rem;">
                        <button class="navbar-toggler" type="button"
                           data-bs-toggle="collapse" style="margin-top: 15px;"
                           data-bs-target="#collapsibleNavbar">
                           <span class="navbar-toggler-icon"></span>
                        </button>
                     </div>

                     <div class="collapse navbar-collapse justify-content-end"
                        id="collapsibleNavbar">
                        <ul class="navbar-nav" style="background: white;">
                           <li class="nav-item"> <a id="Home" class="nav-link" href="/"
                                    style="padding-left:0px; padding-right:0px;">Home</a> </li>
                                    
                           <li class="nav-item"> <a id="Board" class="nav-link" href="/board/list?cpage=1"
                                       style="padding-left:0px; padding-right:0px;">Board</a> </li>
                                       
                           <li class="nav-item"> <a id="Logout" class="nav-link logout" href="/member/logout"
                                       style="padding-left:0px; padding-right:0px;">Logout</a> </li>
                                       
                           <li class="nav-item"> <a id="Mypage" class="nav-link" href="/mypage/main"
                                       style="padding-left:0px; padding-right:0px;">Mypage</a> </li>
                        
                        </ul>
                     </div>
                  </div>
               </nav>
            </div>
            </c:when>
            
            <c:otherwise>
            <div class="row" id="container1">
               <nav class="navbar navbar-expand-md bg-light navbar-light">
                  <div class="container" id="navparent" style = "overflow:visible;">
                     <a class="navbar-brand h3" href="/" id="container"
                        style="padding: 0px;">Ean Soft</a>

                     <div style="height: 5rem;">
                        <button class="navbar-toggler" type="button"
                           data-bs-toggle="collapse" style="margin-top: 15px;"
                           data-bs-target="#collapsibleNavbar">
                           <span class="navbar-toggler-icon"></span>
                        </button>
                     </div>

                     <div class="collapse navbar-collapse justify-content-end"
                        id="collapsibleNavbar">
                        <ul class="navbar-nav" style="background: white;">
                           <li class="nav-item"> <a id="Home" class="nav-link" href="/"
                                    style="padding-left:0px; padding-right:0px;">Home</a> </li>
                                    
                           <li class="nav-item"> <a id="Board" class="nav-link" href="/board/list?cpage=1"
                                       style="padding-left:0px; padding-right:0px;">Board</a> </li>
                                   
                           <li class="nav-item"> <a id="Login" class="nav-link" href="/member/toSignin"
                               style="padding-left:0px; padding-right:0px;">Login</a> </li>
                               
                           <li class="nav-item"> <a id="Signup" class="nav-link" href="/member/toSignup"
                               style="padding-left:0px; padding-right:0px;">Sign up</a> </li>
                        
                        </ul>
                     </div>
                  </div>
               </nav>
            </div>
            </c:otherwise>
            
            
            
            
            </c:choose>
         </div>

      </div>
      <div class="row" id="main_blank">
	      <div class="container">
	      빈칸
	      </div>
      </div>
      
</div>
			
<script>
					
	$("#logout").on("click", () =>{
		location.href = "/member/logout";
	})
	
/* 	$("#withdraw").on("click", () =>{
		let out = confirm ("탈퇴하실건가요?");
		if (out) {
			$.ajax({
				type : "get",
				url : "/member/memberOut?id=${loginID}"
			})
		} else {
			
		}
	}) */
	
	
	$("#signup").on("click", () =>{
		location.href = "/member/toSignup";
	})

</script>

	
</body>
</html>