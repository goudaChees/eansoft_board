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
	<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
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
						 <div style="margin:auto; text-align:left;">
							<div class="col-12 h3_1 px-5" style="text-align:left"><img type="button"  id='back' class="leftbutton" src="/images/leftbutton.png"> </div>
						</div>
                		<div class="col-12 body2 colortext_gray600 px-5" >  : Board Project  </div>
                	</div>
                </div>
            </div>
        </div>
         
       	<div style="margin:auto; text-align:center;">
			<select class="select0" id="selectBox">
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
		<div id="btns" style="margin:auto; text-align:center;">
			<button class="btn1_1" id="clickBtn">그래프보기</button>
		</div>
		<div class="" style="width:500px; height:400px;">
			<canvas class="my-4 w-100 m-auto" id="myChart" style="margin:auto; align:center;"></canvas>
		</div>
	</div>

<script>

$(document).ready(function(){
	$.ajax({
		//url : "http://192.168.0.83:8090/statAno/statBySelectValueAno?value=01",
		url : "http://localhost:8090/statAno/statBySelectValueAno?value=01",
		//data : "choice=map",
		dataType : "json",
		success:function (resp){
			$("#statTable").empty();
			$("#statTable").append("<tr><th colspan='3' id=title style='text-align:center;'><h2><b>Statistics</b></h2></th></tr>"
			+"<tr><td colspan='2' width='100' align='center'><b>Member</b></td>"
			+"<td width='80' align='center'><b>Count</b></td></tr>")
			
			for(let i = 0; i < resp.list.length; i++){
				
				$("#statTable").append("<tr><td colspan='2' width='100' align='center'>"+resp.list[i].writer+
						"</td><td width='80' align='center'>"+resp.list[i].total+"</td></tr>");
				
			}
		}
	})
})

$("#selectBox").on("change", function(){
	let value= $("#selectBox").val();
	console.log(value);
	$.ajax({
		//url : "http://192.168.0.83:8090/statAno/statBySelectValueAno",
		url : "http://localhost:8090/statAno/statBySelectValueAno",
		data : {"value" : value},
		//data : "choice=map",
		dataType : "json",
		success:function(resp){
			console.log(resp);
			//const json = JSON.stringify(resp);
			console.log(resp.list.length);
			console.log(resp.list[0]);
			
			
			$("#statTable").empty();
			
			$("#statTable").append("<tr><th colspan='3' id=title style='text-align:center;'><h2><b>Statistics</b></h2></th></tr>"
			+"<tr><td colspan='2' width='100' align='center'><b>Member</b></td>"
			+"<td width='80' align='center'><b>Count</b></td></tr>")
			
			 for(let i = 0; i < resp.list.length; i++){
				
				$("#statTable").append("<tr><td colspan='2' width='100' align='center'>"+resp.list[i].writer+
						"</td><td width='80' align='center'>"+resp.list[i].total+"</td></tr>");
				
			} 
			
			
			
			
			
			
			
		}
		
	})
	
})


$("#clickBtn").on("click", ()=>{
	$("#clickBtn").css("display","none");
	
	let cancel = $("<button>");
	cancel.text("닫기");
	cancel.attr("id", "closeBtn");
	cancel.attr("class", "btn1_1 color_blue1 colortext_gray900");
	$("#closeBtn").attr("disabled");	
	$("#btns").append(cancel);
	cancel.on("click",()=>{
		location.reload();
	})
	
	
	$.ajax({
		//url : "http://192.168.0.83:8090/statAno/toStatAno",
		url : "http://localhost:8090/statAno/toStatAno",
		dataType : "json",
		success : function (resp){
			
			$("#mychart").empty();
 			let dayList = ["01","02","03", "04", "05","06","07","08","09","10","11","12"];
			let list1 = [];
			let list2 = [];
			let list3 = [];
			let list4 = [];
			let list5 = [];
			list1.push(resp.list[0].jan);
 			list2.push(resp.list[1].jan);
 			list3.push(resp.list[2].jan);
 			list4.push(resp.list[3].jan);
 			list5.push(resp.list[4].jan);
 			list1.push(resp.list[0].feb);
 			list2.push(resp.list[1].feb);
 			list3.push(resp.list[2].feb);
 			list4.push(resp.list[3].feb);
 			list5.push(resp.list[4].feb);
 			list1.push(resp.list[0].mar);
 			list2.push(resp.list[1].mar);
 			list3.push(resp.list[2].mar);
 			list4.push(resp.list[3].mar);
 			list5.push(resp.list[4].mar);
 			list1.push(resp.list[0].apr);
 			list2.push(resp.list[1].apr);
 			list3.push(resp.list[2].apr);
 			list4.push(resp.list[3].apr);
 			list5.push(resp.list[4].apr);
 			list1.push(resp.list[0].may);
 			list2.push(resp.list[1].may);
 			list3.push(resp.list[2].may);
 			list4.push(resp.list[3].may);
 			list5.push(resp.list[4].may);
 			list1.push(resp.list[0].jun);
 			list2.push(resp.list[1].jun);
 			list3.push(resp.list[2].jun);
 			list4.push(resp.list[3].jun);
 			list5.push(resp.list[4].jun);
 			list1.push(resp.list[0].jul);
 			list2.push(resp.list[1].jul);
 			list3.push(resp.list[2].jul);
 			list4.push(resp.list[3].jul);
 			list5.push(resp.list[4].jul);
 			list1.push(resp.list[0].aug);
 			list2.push(resp.list[1].aug);
 			list3.push(resp.list[2].aug);
 			list4.push(resp.list[3].aug);
 			list5.push(resp.list[4].aug);
 			list1.push(resp.list[0].sep);
 			list2.push(resp.list[1].sep);
 			list3.push(resp.list[2].sep);
 			list4.push(resp.list[3].sep);
 			list5.push(resp.list[4].sep);
 			list1.push(resp.list[0].oct);
 			list2.push(resp.list[1].oct);
 			list3.push(resp.list[2].oct);
 			list4.push(resp.list[3].oct);
 			list5.push(resp.list[4].oct);
 			list1.push(resp.list[0].nov);
 			list2.push(resp.list[1].nov);
 			list3.push(resp.list[2].nov);
 			list4.push(resp.list[3].nov);
 			list5.push(resp.list[4].nov);
 			list1.push(resp.list[0].dec);
 			list2.push(resp.list[1].dec);
 			list3.push(resp.list[2].dec);
 			list4.push(resp.list[3].dec);
 			list5.push(resp.list[4].dec);

 			
 			
 			new Chart(document.getElementById("myChart"), {
 				type: 'line',
 				data: {
 					labels: dayList, 
 					datasets: [{
 						data: list1,
 						label: "fourth",
 						borderColor : "red",
 						fill : false,
 						borderWidth : 3
 					  },
 					  {
 						data: list2,
 						label: "second",
 						borderColor : "orange",
 						fill : false,
 						borderWidth : 3
 						  
 					  },
 					  {
 						data: list3,
 						label: "first",
 						borderColor : "yellow",
 						fill : false,
 						borderWidth : 3  
 						  
 					  },
 					  {
 						data: list4,
 						label: "legend",
 						borderColor : "green",
 						fill : false,
 						borderWidth : 3
 					  },
 					  {
 						data: list5,
 						label: "third",
 						borderColor : "darkblue",
 						fill : false,
 						borderWidth : 3  
 						  
 					  }
 					]
 				},
 				option: {
 					title: {
 						display: true,
 						text: 'Total SalesCount per Week'
 					}
 				}
 			});	
 			
 			
 		}
			
		
		
	});
})
		
		$("#back").on("click", ()=>{
			window.history.back();
		})
	
	/* 		let sumList = [];
		let dayList = [];
		for (let i = 7; i > 0; i--){
			sumList.push(i);
			dayList.push(i);
		}
		console.log(sumList);
		console.log(dayList);
		
		new Chart(document.getElementById("myChart"), {
			type: 'line',
			data: {
				labels: dayList,
				datasets: [{
					data: cntList,
					label: "총 판매 갯수",
					borderColor : "#B72136",
					fill : false,
					borderWidth : 5
				  },
				  {
					data: cntListG,
					label: "굿즈 판매 갯수",
					borderColor : "#229A16",
					fill : false,
					borderWidth : 3
					  
				  },
				  {
					data: cntListE,
					label: "전시 판매 갯수",
					borderColor : "#0C53B7",
					fill : false,
					borderWidth : 3  
					  
				  },
				  {
					data: cntListP,
					label: "클래스 판매 갯수",
					borderColor : "#C4CDD5",
					fill : false,
					borderWidth : 3
				  }
				]
			},
			option: {
				title: {
					display: true,
					text: 'Total SalesCount per Week'
				}
			}
		});	
	*/	
		
	
		
	



	</script>


</body>
</html>