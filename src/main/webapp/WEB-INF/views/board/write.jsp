<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=chrome">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Board Write</title>

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
      
      <section>
        <div class="container-fluid">
            <div class="row">    
            	<div class="col-xl-10 col-lg-9 col-md-8 ml-auto" id="boardMain"> <!-- 추후CSS작업 시 바뀔이름 -->
            		<div class="row" style="margin-top: 7rem">
						<div class="col-12 h3_1 px-5" style="text-align:left">Write to Board </div>
                		<div class="col-12 body2 colortext_gray600 px-5" >  : 글쓰기 페이지입니다. </div>
                	</div>
             		
            		<div class="row" style="margin-top: 1rem" id="roundboxParent">
                		<div class="col " style="align-item :center"" id="roundbox">
            				<div class="row pt-2 m-3 mb-4">
								<div class="h3_2">Write</div>
							</div>
							<div class="row">
                             	<form action="/board/insert" method="post" enctype="multipart/form-data">
								<div class="col">
									<div class="row">
										<div class="col-12 d-none d-xl-block p-0 body2 marg_left00">게시글 카테고리</div>
									</div>
									<div class="row" style="text-align:center">
										<div class="col-12 p-0">
											<select name="type" id="type" class="select1">
												<option value='O'>일반 </option>
												<option value='H'>유머 </option>
												<option value='N'>뉴스 </option>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="col-12 d-none d-xl-block p-0 body2 marg_left00">글 제목</div>
									</div>
									<div class="row" style="text-align:center">
										<div class="col-12 p-0" style="text-align:center">
											<input type="text" name="title" id="title" placeholder="Input title" maxlength="50" >
										</div>
									</div>
									<div class="row">
										<div class="col-12 d-none d-xl-block p-0 body2 marg_left00">작성자</div>
									</div>
									<div class="row" style="text-align:center">
										<div class="col-12 p-0" style="text-align:center">
											<input type="text" name="writer" id="writer" value="${loginID}" readonly >
											<input type="hidden" id="writer1" value="${loginID}">
										</div>
									</div>
									<div class="row">
										<div class="col-12 d-none d-xl-block p-0 body2 marg_left00">글 내용</div>
									</div>
									<div class="row" style="text-align:center;">
										<div class="col-12 p-0">
											<textarea rows="" cols="" name="contents" id="contents" placeholder="Input contents" maxlength="1300"></textarea>
											<!-- <input type="text" name="title" id="title" placeholder="Input contents" > -->
										</div>
									</div>
									<div class="row">
										<div class="col-12 d-none d-xl-block p-0 body2 marg_left00">파일 첨부</div>
									</div>
									<div class="row" style="text-align:center">
										<div class="col-12 p-0 ">
											<!-- <input class="upload_view" id="pe_img" value="" placeholder="Input Exhibition Images" readonly>
											<span>	
												<label class="btn1_2 " for="file"> <i class="bi bi-upload"></i> </label> -->	
												<!-- <input id="file" type="file" name="file" style="display:none" accept="image/*" onchange=isFileImg(this)> -->
												
												<input class="body2" type="file" name="file" placeholder="첨부파일" multiple>
												
											<!-- </span> -->
										</div>
										
									</div>  
								<!-- 	<div class="row" style="text-align:center">
										<div class="col-12 p-0">
											<img src="" id="img_section" value="N">
											<input class="btn1_0 mrg_left1" type="button" id="cancel_Btn" onclick="img_cancel()" style="display: none" value="첨부 취소">
										</div>
									</div> -->
									
									<!-- <input type="text" name="pe_img" placeholder="get in link" id="file" name="pe_img"  accept="image/*" onchange=isFileImg(this) > -->
									<div class="row pt-4 pb-4" style="text-align:center">
										<div class="col-12 p-0">
											<a href="/board/toWrite">
											<input class="btn1" type="button" id="return" value="초기화"></a> 
											<input class="btn2_1" type="submit" id="upload" value="등록" disabled>
										</div>
									</div>
								</div>
								</form>
            				</div>
            			</div>
            		</div>
            	</div>
            </div>
        </div>
    </section>
    
    <div class="row" id="footer" style="margin-top: 80px;">
            <div class="container">
                <div class="row">
                    <div class="col-12 h3 " style = "color: #637381; margin-top: 3.75rem;">(주)이안소프트</div>
                    <div class="col-12 body2 " style = "color: #637381;">사업자 등록번호 : 123-45-012345 | 대표 : 홍길동 | IT업 신고번호 : 2022-서울성동-012345</div><br>
                    <div class="col-12 body2 " style = "color: #637381;" >ITCT 지식산업센터 | eemoon23@gmail.com</div>

                </div>
            </div>
        </div>
    
    
    
<script>
let isTitle = false;
let isContents = false;
let isWriter = false;

let writer = $("#writer").val();

if(writer == ""){
	isWriter = false;
}else {
	isWriter = true;
	console.log("writer Pass");
}

$("#title").on("keyup", ()=>{
	let title = $("#title").val();

	if(title == ""){
		isTitle = false;
	}else {
		isTitle = true;
		console.log("title Pass");
	}
	
	if(isTitle && isContents && isWriter){
		$("#upload").removeAttr("disabled");
	}
})

$("#contents").on("keyup", ()=>{
	let contents = $("#contents").val();
	
	if(contents == ""){
		isContents = false;
	}else {
		isContents = true;
		console.log("contents Pass");
	}
	
	if(isTitle && isContents && isWriter){
		$("#upload").removeAttr("disabled");
	}
})



</script>
      
      

</div>
</body>
</html>