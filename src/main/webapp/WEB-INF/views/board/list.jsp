<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=chrome">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Board List</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
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
      
      
      <section>
        <div class="container-fluid">
            <div class="row">    
            	<div class="col-xl-10 col-lg-9 col-md-8" id="boardMain">  <!-- 추후CSS작업 시 바뀔이름 -->
            		<div class="row" style="margin-top: 7rem">
						<div class="col-12 h3_1 px-5" style="text-align:left"> Board </div>
                		<div class="col-12 body2 colortext_gray600 px-5" >  : Board Project  </div>
                	</div>
                	<div class="row" style="margin-top: 1rem" id="roundboxParent">
                		<div class="col-12" id="roundbox">  
 							<div class="row pt-4 p-4" style="text-align:left">
 								<div class="col-4" id="checkbtns">
 									<!-- <select class="body2 select0 color_gray100" name="type" id="type" style="height:3.0rem">
 										<option value='T'>종합 </option>
										<option value='O'>일반 </option>
										<option value='H'>유머 </option>
										<option value='N'>뉴스 </option>
									</select>  -->
 								</div>
 								<div class="col-6" style="text-align:right">
                               	<form action="/board/list?cpage=1" method="get">
                                    <div class="searchBox">
                                    	<select class="select2" name="category"  aria-label="Default select example">
	                               			<option value="writer">작성자</option>
	                               			<option value="title">제목</option>
	                               			<option value="contents">내용</option>
	                               		</select>
                                        <input type="text" class="searchInput select0"  name='keyword' placeholder="Search">
                                        <input type='hidden' name='cpage' value='1'>
                                        <button type="submit" class="btn btn-light searchBtn">
                                            <i class="bi bi-search"></i>
                                        </button>
                                    </div>
                                </form>
                            	</div>
 								
 								<div class="col-2" style="align:right">
 									<div class="body2"><button id="write" class="btn0" style="height:3.0rem">Write</button></div>
 								</div>
 							</div>
            				<div class="row pt-3 m-3 mb-4">
            					
            					<div class="col-1 h3" style="border-right : 0.125rem solid #DFE3E8"> No.</div>
			            		<div class="col-1 h3" style="border-right : 0.125rem solid #DFE3E8">Type </div>
			            		<div class="col-4 h3 " style="border-right : 0.125rem solid #DFE3E8">Title </div>
			            		<div class="col-1 d-none d-xl-block h3 " style="border-right : 0.125rem solid #DFE3E8">File </div>
			            		<div class="col-2 h3 " style="border-right : 0.125rem solid #DFE3E8">Writer </div>
			            		<div class="col-2 d-none d-xl-block h3 " style="border-right : 0.125rem solid #DFE3E8">Date </div>
			            		<div class="col-1 h3 ">View </div>
			            		<div class="col-12 px-3">
			            			<div class="card2"></div>
			            		</div>

                            	<div class="col-12 pt-2 px-3">
                            	<hr>
                            		<div class="" id="lists">
										<c:forEach var='ii' items="${list }">
											<div class="row">
											<div class='col-1 body2' style='border-right : 0.125rem solid #DFE3E8'>${ii.seq}</div>
											<c:choose>
													<c:when test="${ii.type eq 'O' }"><div class="col-1 d-none d-lg-block body2" style='border-right : 0.125rem solid #DFE3E8'>일반</div></c:when>
													<c:when test="${ii.type eq 'H' }"><div class="col-1 d-none d-lg-block body2" style='border-right : 0.125rem solid #DFE3E8'>유머</div></c:when>
													<c:when test="${ii.type eq 'N' }"><div class="col-1 d-none d-lg-block body2" style='border-right : 0.125rem solid #DFE3E8'>뉴스</div></c:when>
												</c:choose>
											<%-- <div class='col-1 d-none d-lg-block body2' style='border-right : 0.125rem solid #DFE3E8'>${ii.type}</div> --%>
											<div class='col-4 body2' style='border-right : 0.125rem solid #DFE3E8'><a href="/board/viewContents?seq=${ii.seq}">${ii.title}</a></div>
											<div class='col-1 d-none d-xl-block body2' style='border-right : 0.125rem solid #DFE3E8'>${ii.file_count}</div>
											<div class='col-2 body2' style='border-right : 0.125rem solid #DFE3E8'>${ii.writer }</div>
						            		<div class='col-2 d-none d-xl-block body2' style='border-right : 0.125rem solid #DFE3E8'>${ii.write_date }</div>
						            		<div class='col-1 body2'>${ii.view_count }</div>
												
												
											</div>
											<hr>
										</c:forEach>
										
										<%-- <c:forEach var='ii' items="${list }">
											<div class="row">
												<div class="col-8 col-lg-4 px-4 body2"> <input type="checkbox" name="checkbox" value="${ii.pe_seq }"> <a href="/admin/adminExhibitionDetail?pe_seq=${ii.pe_seq }" class="colortext_gray900"><b>${ii.pe_name }</b></a> </div>
												<div class="col-4 d-none d-lg-block px-4 body2">${ii.pe_date }</div>
												<div class="col-2 d-none d-xl-block px-4 body2">${ii.pe_price }</div>
												<c:choose>
													<c:when test="${ii.pe_period eq 'N' }"><div class="col-4 col-lg-2 px-4 body2">현재전시</div></c:when>
													<c:when test="${ii.pe_period eq 'F' }"><div class="col-4 col-lg-2 px-4 body2">예정전시</div></c:when>
													<c:when test="${ii.pe_period eq 'P' }"><div class="col-4 col-lg-2 px-4 body2">지난전시</div></c:when>
												</c:choose>
											</div>
											<hr>
										</c:forEach> --%>
                            		</div>
                            	</div>	
			                    <div class="col-12 p-3 colortext_gray200 h3" style="text-align:center">
			                    	${navi}
			                    </div>
            				</div>
            			</div>
            		</div>
            	</div>
            </div>
        </div>
    </section>
      
</div>

<script>
$("#write").on("click", ()=>{
	location.href = "/board/toWrite";
})

function SearchBtn(){
	
}


/* 
$("#type").on("change", ()=>{
	let typeVal = $("#type").val();
	console.log(typeVal);
	
	if(typeVal == 'T'){
		
		$.ajax({
			url:"/board/list",
			data : {"value" : typeVal, "cpage": "1"},
			dataType:"JSON",
			success : function (resp) {
				console.log(resp);
				
				$(".lists").empty();
				for(let i = 0; i < resp.length; i++){
					$(".lists").append(
							"<div class='col-8 col-lg-1 body2' style='border-right : 0.125rem solid #DFE3E8'>"+resp[i].seq +"</div>"+
							"<div class='col-1 d-none d-lg-block body2' style='border-right : 0.125rem solid #DFE3E8'>"+resp[i].type+"</div>"+
							"<div class='col-4 d-none d-xl-block body2' style='border-right : 0.125rem solid #DFE3E8'>"+resp[i].title+"</div>"+
							"<div class='col-1 d-none d-xl-block body2' style='border-right : 0.125rem solid #DFE3E8'>"+resp[i].file_count+"</div>"+
							"<div class='col-2 d-none d-xl-block body2' style='border-right : 0.125rem solid #DFE3E8'>"+resp[i].writer+"</div>"+
		            		"<div class='col-2 d-none d-xl-block body2' style='border-right : 0.125rem solid #DFE3E8'>"+resp[i].write_date+"</div>"+
		            		"<div class='col-4 col-lg-1 body2'>"+resp[i].view_count+"</div><hr>");	
					
			}
		});
	}else if (typeVal == '')
	
})*/


</script>
</body>
</html>