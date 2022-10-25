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
<style>

</style>
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
 							<form action='/board/update' method='post'>
            				<div class="row pt-3 m-3 mb-4">
            					<c:forEach var='i' items="${bdto }">
            					
            					<div class="col-2 h3_3 m-auto">Title</div>
			            		<div class="col-10 h3_3">
			            		<input type='text' name='title' value='${i.title}' id='title' class='edit' id="titleInput" style="border:none; padding:0; margin:auto;" readonly> 
			            		</div>
					            	<div class="row">	
					            		<div class="col-5"></div>
					            		<input type='hidden' id="seq" name='seq' value='${i.seq }'>
					            		<input type='hidden' name='type' value='${i.type }'>
					            		<div class="col-2 body1">작성자 : ${i.writer}</div>
					            		<input type='hidden' name='writer' value='${i.writer}'>
					            		<div class="col-3 body1">${i.write_date }</div>
					            		<input type='hidden'name='write_date' value='${i.write_date }'>
					            		<div class="col-2 body1">조회수 : ${i.view_count }</div>
					            		<input type='hidden' name='view_count' value='${i.view_count }'>
					            		<div class="col-12 px-3">
					            			<div class="card2"></div>
					            		</div>
									</div>
                            	<div class="col-12 pt-2 px-3"></div>
                            	
                            		<div class="row m-auto" style="border-top: solid 0.2rem black; text-align:center;"></div>
                            		
										
									<div class="row mt-4" id="contentsBox">
										<div class='col-2 h3_3 mt-2' style="padding:0;">Contents</div>
										<div class='col-10 body1'>
										<input type='text' name="contents" id="contents" class='edit' value='${i.contents}' id="contentsInput" style="border:none; padding:0; margin:auto;" readonly>
										</div>			
									
									</div>
									<div class="row m-auto" style="border-bottom: solid 0.2rem black; text-align:center;"></div>
								
									<c:if test='${! empty loginID }'>
										<c:if test='${i.writer == idCheck }'>
										<div class="row" >
											<div class="col-9"></div>
											<div class="col-3 btns">
												<button class="btn0_1 color_yellow2" type="button" id='modify'>수정</button>
												<button class="btn0_1 color_red2" type="button" id='delete' >삭제</button>
											</div>
										</div>
										</c:if>		
									</c:if>
								</c:forEach>
							</div>
							</form>
							
                       		<div class="row m-3 mb-4">
                       			<div class="col-3 h3_3">File</div>
                       			<div class="col-9"></div>
                       			<div class="col-2"></div>
                       			<c:forEach var="f" items="${fdto}">
                       			
                       			<span class="col-2 body2"><a href="/file/download?sys_Name=${f.sys_Name}&ori_Name=${f.ori_Name}">${f.ori_Name}</a></span>
                       			</c:forEach>
                       			<div class="row m-auto mt-3" style="border-bottom: solid 0.1rem gray; text-align:center;"></div>
                       		</div>
						                            	
                            <form action="/reply/insert" method="post"> 	
			                <div class="row m-3 mb-4 replybox" >		
	                   			<div class='col-12 h3_3'>Comments</div>
	                   			<hr>
	                   			<input type="hidden" name="parent_seq" value='${bdto[0].seq }'>
	                   			<div class="col-2 body1 mt-2" style="text-align:center;">${loginID }</div>
	                   			<input type="hidden" id="replyWriter" name="writer" value="${loginID }">
	                   			<div class="col-8">
	                   				<input type="text" id="replyContents" name='contents' style="width:100%;">
	                   			</div>
	                   			<div class="col-2">
	                   				<input type="submit" class="btn1_0" id="insertReply" value="insert" disabled>
	                   			</div>
           						
           						
	                   			<div class="row m-auto mt-3" style="border-bottom: dashed 0.2rem gray; text-align:center;"></div>
	                   			<div class="row m-auto mt-3" style="border-bottom: dashed 0.2rem gray; text-align:center;"></div>
	                   		</div>
	                   		</form>
	                   		
	                   		<c:forEach var='ii' items="${rdto }">
	                   		<form action='/reply/update' method='post'>
	                   		<div class="row m-3 mb-4 replys">
	                   			<input class="seq" name="seq" type="hidden" value="${ii.seq}">
	                   			<div class="col-2 body1 writer" style="text-align:center;">
	                   				<input type="text" name="writer" value=" ${ii.writer}" style="border:none; width:100%;" readonly></div>
	                   			<div class="col-5 body1 contents">
	                   				<input type="text" name="contents" class="replyedit" value="${ii.contents }" style="border:none; width:100%;" readonly></div>
	                   			<div class="col-2 body2 write_date">${ii.write_date }</div>
	                   				<input type="hidden" name="write_date" value="${ii.write_date}">
	                   				<input type="hidden" name="parent_seq" value="${bdto[0].seq}">
	                   			<div class="col-3 replyBtns">
	                   			<c:if test="${loginID == bdto[0].writer}">
	                   				<button class="btn0_1 color_gray200 reReply" type="button" id='reReply'>답글</button>
	                   			</c:if>
	                   			<c:if test="${loginID == ii.writer }">
	                   				<button class="btn0_1 color_yellow2 replyModify" type="button" id='replyModify'>수정</button>
									<button class="btn0_1 color_red2 replyDelete" type="button" id='replyDelete' >삭제</button>
	                   			</c:if>
	                   			</div>
	                   			<c:forEach var="r" items="${rddto}">
	                   			<c:if test="${ii.seq == r.parent_reply_seq}">
	                   			<div class="row">
	                   				<div class="row m-auto mb-2"></div>
									<div class="col-1"><i class="bi bi-arrow-return-right"></i></div>
									<div class="col-1 body2 mt-3"><b>${r.writer}</b></div>
									<div class="col-6 body2"><input type="text" value="${r.contents}" style="border:none;" class="mt-1"></div>
									<div class="col-2 caption">${r.write_date}</div>
									<div class="col-2 reReplyBtns">
									<c:if test="${loginID == r.writer}">
										<button class="btn0_2 color_yellow2 reReplyModBtn" type="button">수정</button>
										<button class="btn0_2 color_red2 reReplyDelBtn" type="button">삭제</button>
									</c:if>	
									</div>
									<div class="col-12"></div>
									<div class="row m-auto mt-2" style="border-bottom: dashed 0.1rem lightgray; text-align:center;"></div>                 				
	                   			</div>
	                   			</c:if>
	                   			</c:forEach>
	                   		
	                   	
	                   	
                   			
                   			<div class="row reReplysBox">
                   				<input type="hidden" name="board_seq" value='${bdto[0].seq }'>
                   				<input type="hidden" name="writer" value='${loginID }'>
                   				<input type="hidden" name="parent_reply_seq" value="${r.parent_reply_seq }">
                   			</div>
                   			
                   		</div>	
	                   		<hr>
	                   		</form>
	                   	</c:forEach>
	                   		
	          
	                   		
                        </div>
	                </div>      	
          		</div>
          	</div>
        </div>
        
    </section>
    	
    <section>
   		<div class="container-fluid">
            <div class="row">
            	<div class="col">
            		<div class="row">
            		
            		</div>
            		
            	</div>
            </div>
           </div>
   	</section>
      
</div>

<script>
	$("#modify").on("click", ()=>{
		$(".edit").removeAttr("readonly");
		$(".edit").attr("border","solid 2px");
		$("#contents").focus();
		$("#modify").css("display", "none");
		$("#delete").css("display", "none");
		let ok = $("<button>");
		ok.text("수정완료");
		ok.attr("class","btn0_1 color_yellow2");
		ok.attr("id", "modifyOk");
		$("#modifyOk").attr("disabled");
		ok.attr("type", "submit");
		
		let cancel = $("<button>");
		cancel.text("취소");
		cancel.attr("type", "button");
		cancel.attr("class","btn0_1 color_gray400");
		cancel.on("click", ()=>{
			location.reload();
		})
		
		$(".btns").append(ok);
		$(".btns").append(cancel);
	})
	
	$("#delete").on("click", ()=>{
		let del = confirm("정말 삭제하시겠습니까?");
		let seq = $("#seq").val();
		if(del){
			location.href="/board/delete?seq="+seq
			/* $.ajax({
				url : "/board/delete?seq="+seq
			})	 */
		}else {
			
		}
	})
	
	$("#replyContents").on("keyup", ()=>{
		let replywriter = $("#replyWriter").val();
		
		if (replywriter != ""){
			$("#insertReply").removeAttr("disabled");
		}
	})
	
	$(document).on("click", ".replyModify", function(){
		$(this).parent().siblings(".contents").children().removeAttr("readonly");
		$(this).parent().siblings(".contents").children().attr("border","solid 1px gray");
		$(this).parent().siblings(".contents").children().focus();
		$(this).css("display", "none");
		$(this).siblings(".replyDelete").css("display", "none");	
		let ok = $("<button>");
		ok.text("수정완료");
		ok.attr("class","btn0_1 color_yellow2");
		ok.attr("id", "replyModifyOk");
		$("#replyModifyOk").attr("disabled");
		ok.attr("type", "submit");
		
		let cancel = $("<button>");
		cancel.text("취소");
		cancel.attr("type", "button");
		cancel.attr("class","btn0_1 color_gray400");
		cancel.on("click", ()=>{
			location.reload();
		})
		
		$(this).parent(".replyBtns").append(ok);
		$(this).parent(".replyBtns").append(cancel);

/* 		let test = $(this).parent().siblings().val();
		let test2 = $(this).parent().siblings('.writer').children().val();
		let test3 = $(this).parent().siblings('.contents').children().val();
		let seq = $(this).parent().siblings().val(); // 8 이게 해당값.
		let seq2 = $(this).parent().siblings('input').val();
		let test4 = $(this).parent().siblings('.writer').text();
		let test5 = $(this).parent().siblings('.contents').text();
		
		console.log(test3); */
	})
	
	$(document).on("click", ".replyDelete", function(){
		/* let seq = $(this).parent().siblings().val(); // 8 이게 해당값.
		*/
		let del = confirm("정말 삭제하시겠습니까?");
		let seq =  $(this).parent().siblings('input').val();
		let parent_seq = $("#seq").val();
		console.log(seq); 
		console.log(parent_seq);
		if(del){
			location.href="/reply/delete?seq="+seq+"&parent_seq="+parent_seq
		}else {
			
		}
	})
		
		
	$(document).on("click", ".reReply", function(){
		$(this).css("display", "none");
		$(this).siblings(".replyDelete").css("display", "none");
		$(this).siblings(".replyModify").css("display", "none");
		let cancel = $("<button>");
		cancel.text("취소");
		cancel.attr("type", "button");
		cancel.attr("class","btn0_1 color_gray400");
		cancel.on("click", ()=>{
			location.reload();
		})
		$(this).parent(".replyBtns").append(cancel);
		
		let test = $(this).parent().siblings().val();
		console.log(test);
		
		let click = $("<button>");
		click.text("insert");
		click.attr("type", "button");
		click.attr("class", "btn0_2 mt-3 reReplyInsert")
		//$(this).parent().parent().append("<div class='col-3 body2' style='text-align:right;'>답글</div><div class='col-6' ><input type='text'style='width:100%;'></div><div class='col-3'><button>insert</button></div>");
		
		$(this).parent().siblings('.reReplysBox').append("<div class='col-1'><i class='bi bi-arrow-return-right'></i></div>");
		$(this).parent().siblings('.reReplysBox').append('<div class="col-2 body2 mt-3"><b>${loginID}</b></div>');
		$(this).parent().siblings('.reReplysBox').append('<div class="col-6 body2 mt-1"><input type="text" name="contents" style="width:100%;" class="reReplycontents"></div>');
		$(this).parent().siblings('.reReplysBox').append('<div class="col-3 reReplySubmitBtn">');
		$(this).parent().siblings('.reReplysBox').children('.reReplySubmitBtn').append(click);
		$(this).parent().siblings('.reReplysBox').append('<div class="col-12"></div>');
		
		
		let test2 = $(this).parent().siblings().children(".reReplycontents").val();
		console.log(test2);
		
	
		click.on("click", function(){
			$.ajax({
				url : "/reply/reReplyInsert",
				data : {
					
					contents : $(".reReplycontents").val(),
					parent_reply_seq : test,
					board_seq : ${bdto[0].seq }
				}
			}).done(function(resp){
					location.reload();
				})
			
			
		})
 			
		
		
		
	})
	

	
	
	
</script>
      
</body>
</html>