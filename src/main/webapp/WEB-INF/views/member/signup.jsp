<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=chrome">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SignUp</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
   rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="/css/member.css">
	
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
                                       
                           <li class="nav-item"> <a id="Admin" class="nav-link" href="/"
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
                                       
                           <li class="nav-item"> <a id="Mypage" class="nav-link" href="/"
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
      <div class="row" style="padding-top : 150px;">

	<div class="container"  style="max-width: 600px; padding-bottom: 80px;">
		<div class="row">
			<div class="h2">Sign up</div>
		</div>
		
		<div class="row">
			<form action="/member/signup" method="post">
				<div class="col">
					<div class="row">
						<div class="col-12 body2">
							????????? (5?????????)
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<input type="text" id="id" name="id" placeholder="??????,?????? ?????? 5~10???" maxlength="10">
						</div>
					</div>
					<div class="row">
						<div class="col-12" id="idCheck"></div>
					</div>
					
					<div class="row">
						<div class="col-12 body2">
							????????????
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<input type="password" id="pw" name="pw" placeholder="??????????????? ???????????????" maxlength="12">
						</div>					
					</div>
					<div class="row">
						<div class="col-12" id="pwCheck"></div>
					</div>
					
					<div class="row">
						<div class="col-12 body2">
							???????????? ??????
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<input type="password" id="pw2" placeholder="??????????????? ???????????????" maxlength="12">
						</div>
					</div>
					<div class="row">
						<div class="col-12" id="pw2Check"></div>
					</div>
					
					<div class="row">
						<div class="col-12 body2">
							??????
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<input type="text" id="name" name="name" placeholder="????????? ???????????????" maxlength="10">
						</div>
					</div>
					<div class="row">
						<div class="col-12" id="nameCheck"></div>
					</div>
					
					<div class="row">
						<div class="col-12 body2">
							?????????
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<input type="text" id="email" name="email" placeholder="???????????? ???????????????" maxlength="30">
						</div>
					</div>
					<div class="row">
						<div class="col-12" id="emailCheck"></div>
					</div>
					
					<div class="row">
						<div class="col" align="center">
							<input type="submit" value="JOIN" class="btn2" id="join" disabled>
						</div>
					</div>
					
				</div>

			</form>
		</div>
	</div>
	
	<div class="row" id="footer" style="margin-top: 80px;">
            <div class="container">
                <div class="row">
                    <div class="col-12 h3 " style = "color: #637381; margin-top: 3.75rem;">(???)???????????????</div>
                    <div class="col-12 body2 " style = "color: #637381;">????????? ???????????? : 123-45-012345 | ?????? : ????????? | IT??? ???????????? : 2022-????????????-012345</div><br>
                    <div class="col-12 body2 " style = "color: #637381;" >ITCT ?????????????????? | eemoon23@gmail.com</div>

                </div>
            </div>
        </div>
	</div>

<script>
	
	let isIdOk = false;
	let isPwOk = false;
	let isPw2Ok = false;
	let isNameOk = false;
	let isEmailOk = false;
	
	
	$("#id").on("keyup", ()=>{
		let id = $("#id").val();

		if(id == ""){
			$("#id").css("border", "1px solid #FF4842");
			$("#idCheck").css("color", "#FF4842");
			$("#idCheck").text("???????????? ??????????????????");
			isIdOk = false;
			$("#join").attr("disabled", "true");
			return false;
		}
		
		let idRegex = /^[a-zA-Z][a-zA-Z\d_]{4,9}$/;
		let idRegexResult = idRegex.test(id);
		
		if(!idRegexResult) {
			$("#id").css("border", "1px solid #FF4842");
			$("#idCheck").css("color", "#FF4842");
			$("#idCheck").text("????????? ID??? ??????????????????.");
			isIdOk = false;
			$("#join").attr("disabled", "true");
			return false;
		} else {
			$.ajax({
				url : "/member/idDuplCheck",
				data : {
					id : $("#id").val()
				}
			}).done(function(resp){
				let result = JSON.parse(resp);
				console.log(result);
				if (result) {
					$("#id").css("border", "1px solid #FF4842");
					$("#idCheck").css("color", "#FF4842");
					$("#idCheck").text("?????? ????????? ??????????????????.");
					isIdOk = false;
					$("#join").attr("disabled", "true");
					return false;
				}else {
					$("#id").css("border", "1px solid #1890FF");
					$("#idCheck").css("color", "#1890FF");
					$("#idCheck").text("?????? ????????? ??????????????????.");
					isIdOk = true;
					
					if(isIdOk && isPwOk && isPw2Ok && isNameOk && isEmailOk) {
						$("#join").removeAttr("disabled");
					}
				}
			})
		}
	})
	
	$("#pw").on("keyup", ()=>{
		let pw = $("#pw").val();
		
		if(pw == ""){
			$("#pw").css("border", "1px solid #FF4842");
			$("#pw2").css("border", "1px solid #FF4842");
			$("#pwCheck").css("color", "#FF4842");
			$("#pwCheck").text("??????????????? ?????? ?????? ???????????????.");
			$("#pw2Check").text("");
			isPwOk = false;
			isPw2Ok = false;
			$("#join").attr("disabled", "true");
			return false;
		}
		
		let pwRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}$/gm;
		let pwRegexResult = pwRegex.test(pw);
		
		if (!pwRegexResult) {
			$("#pw").css("border", "1px solid #FF4842");
			$("#pw2").css("border", "1px solid #FF4842");
			$("#pwCheck").css("color", "#FF4842");
			$("#pwCheck").text(
					"?????????, ????????? ???????????? 8~12?????? ??????");
			$("#pw2Check").text("");
			isPwOk = false;
			isPw2Ok = false;
			$("#join").attr("disabled","true");
			return false;
		}else {
			$("#pw").css("border", "1px solid #1890FF");
			$("#pwCheck").text("");
			isPwOk = true;
			
			let pw2 = $("#pw2").val();
			if(pw2 == pw) {
				$("#pw2").css("border", "1px solid #1890FF");
				$("#pw2Check").css("color", "#1890FF");
				$("#pw2Check").text("??????????????? ???????????????.");
				isPw2Ok = true;
				
				if(isIdOk && isPwOk && isPw2Ok && isNameOk && isEmailOk) {
					$("#join").removeAttr("disabled");
				}
			} else {
				$("#pw2").css("border", "1px solid #FF4842");
				$("#pw2Check").css("color", "#FF4842");
				$("#pw2Check").text("??????????????? ???????????? ????????????.");
				isPw2Ok = false;
				
				$("#join").attr("disabled","true");
				return false;
			}
		}
	})
	
	$("#pw2").on("keyup",()=> { // ??????2 ?????? ??????
		let pw = $("#pw").val();
		let pw2 = $("#pw2").val();
		if (pw2 == "") {
			$("#pw2").css("border", "1px solid #FF4842");
			$("#pw2Check").css("color", "#FF4842");
			$("#pw2Check").text("???????????? ????????? ??????????????????.")
			isPw2Ok = false;
			
			$("#join").attr("disabled","true");
			return false;
		}
		if (pw2 == pw) {
			$("#pw2").css("border", "1px solid #1890FF");
			$("#pw2Check").css("color", "#1890FF");
			$("#pw2Check").text("??????????????? ???????????????.");
			isPw2Ok = true;
			
			
			if(isIdOk && isPwOk && isPw2Ok && isNameOk && isEmailOk) {
				$("#join").removeAttr("disabled");
			}
		} else {
			$("#pw2").css("border", "1px solid #FF4842");
			$("#pw2Check").css("color", "#FF4842");
			$("#pw2Check").text("??????????????? ???????????? ????????????.");
			isPw2Ok = false;
			
			$("#join").attr("disabled","true");
			return false;
		}
	})
	
	$("#name").on("keyup", ()=>{
		let name = $("#name").val();
		
		if (name == "") {
			$("#name").css("border", "1px solid #FF4842");
			$("#nameCheck").css("color", "#FF4842");
			$("#nameCheck").text("????????? ?????? ?????? ???????????????.")
			isNameOk = false;
			
			$("#join").attr("disabled","true");
			return false;
		}
		
		let nameRegex = /^[???-???]{2,7}$/;
		let nameRegexResult = nameRegex.test(name);
		
		if (!nameRegexResult) {
			$("#name").css("border", "1px solid #FF4842");
			$("#nameCheck").css("color", "#FF4842");
			$("#nameCheck").text("????????? ??????????????? ???????????? ????????????.");
			isNameOk = false;
			
			$("#join").attr("disabled","true");
			return false;
		} else {
			$("#name").css("border", "1px solid #1890FF");
			$("#nameCheck").text("");
			isNameOk = true;


			if(isIdOk && isPwOk && isPw2Ok && isNameOk && isEmailOk) {
				$("#join").removeAttr("disabled");
			}
		}
	})
	
	$("#email").on("keyup", ()=>{
		let email = $("#email").val();
		
		if (email == "") {
			$("#email").css("border", "1px solid #FF4842");
			$("#emailCheck").css("color", "#FF4842");
			$("#emailCheck").text("???????????? ?????? ?????? ???????????????.")
			isEmailOk = false;
			
			$("#join").attr("disabled","true");
			return false;
		}
		
		let emailRegex = /^[a-z\d]([\da-z-_\.]?)*@([\da-z-_\.])*\.([a-z]{2,3})(\.[a-z]{2})?$/i;
		let emailRegexResult = emailRegex.test(email);
		
		if (!emailRegexResult) {
			$("#email").css("border", "1px solid #FF4842");
			$("#emailCheck").css("color", "#FF4842");
			$("#emailCheck").text("???????????? ????????? ???????????? ????????????.");
			isEmailOk = false;
			
			$("#join").attr("disabled","true");
			return false;
		} else {
			$("#email").css("border", "1px solid #1890FF");
			$("#emailCheck").text("");
			isEmailOk = true;


			if(isIdOk && isPwOk && isPw2Ok && isNameOk && isEmailOk) {
				$("#join").removeAttr("disabled");
			}
		}
	})
	
	
</script>
</body>
</html>