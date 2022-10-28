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
            	<div class="col-xl-10 col-lg-9 col-md-8" id="boardMain">  <!-- 추후CSS작업 시 바뀔이름 -->
            		<div class="row" style="margin-top: 7rem">
						<div class="col-12 h3_1 px-5" style="text-align:left"> Board </div>
                		<div class="col-12 body2 colortext_gray600 px-5" >  : Board Project  </div>
                	</div>
                </div>
            </div>
        </div>
                	
       <div style="margin:auto; text-align:center;">
<select id="selectBox">
	<option value="01">1월</option>
	<option value="02">2월</option>
	<option value="03">3월</option>
	<option value="04">4월</option>
	<option value="05">5월</option>
	<option value="06">6월</option>
	<option value="07">7월</option>
	<option value="08">8월</option>
	<option value="09">9월</option>
	<option value="10">10월</option>
	<option value="11">11월</option>
	<option value="12">12월</option>
</select>
</div>
<br><br>
<table border="2" align="center" id="statTable">
	<tr>
		<th colspan="3" id=title><h2><b>Statistics</b></h2></th>
	</tr>
	<tr>
			<td width="30"></td>
			<td width="100" align="center"><b><h3>Member</h3></b></td>
			<td width="80" align="center"><b><h3>Count</h3></b></td>
	</tr>
	<c:forEach var="i" items="${list}" >
	<tr>
		<td width="30"></td>
		<td width="100" align="center">${i.writer}</td>
		<td width="80" align="center">${i.total}</td>
	</tr>
	</c:forEach>

</table>
<br><br>
<div style="margin:auto; text-align:center;">
	<input type="button" id='back' value="뒤로가기" >
</div>         	
	

</div>

<script>
$(document).ready(function(){
	$.ajax({
		url : "http://192.168.0.83:8090/statAno/statBySelectValueAno?value=01",
		//data : "choice=map",
		dataType : "json",
		success:function (resp){
			$("#statTable").empty();
			$("#statTable").append("<tr><th colspan='3' id=title><h2><b>Statistics</b></h2></th></tr>"
			+"<tr><td width='30'></td><td width='100' align='center'><b><h3>Member</h3></b></td>"
			+"<td width='80' align='center'><b><h3>Count</h3></b></td></tr>")
			
			for(let i = 0; i < resp.list.length; i++){
				
				$("#statTable").append("<tr><td width='30'></td><td width='100' align='center'>"+resp.list[i].writer+
						"</td><td width='80' align='center'>"+resp.list[i].total+"</td></tr>");
				
			}
		}
	})
})

$("#selectBox").on("change", function(){
	let value= $("#selectBox").val();
	console.log(value);
	$.ajax({
		url : "http://192.168.0.83:8090/statAno/statBySelectValueAno",
		data : {"value" : value},
		//data : "choice=map",
		dataType : "json",
		success:function(resp){
			console.log(resp);
			//const json = JSON.stringify(resp);
			console.log(resp.list.length);
			console.log(resp.list[0]);
			
			
			$("#statTable").empty();
			
			$("#statTable").append("<tr><th colspan='3' id=title><h2><b>Statistics</b></h2></th></tr>"
			+"<tr><td width='30'></td><td width='100' align='center'><b><h3>Member</h3></b></td>"
			+"<td width='80' align='center'><b><h3>Count</h3></b></td></tr>")
			
			 for(let i = 0; i < resp.list.length; i++){
				
				$("#statTable").append("<tr><td width='30'></td><td width='100' align='center'>"+resp.list[i].writer+
						"</td><td width='80' align='center'>"+resp.list[i].total+"</td></tr>");
				
			} 
		}
		
	})
	
})


</script>


</body>
</html>