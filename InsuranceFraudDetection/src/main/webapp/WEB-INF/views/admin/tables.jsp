<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <jsp:include page="/WEB-INF/views/include/admin/adminStaticFiles.jsp"/>

<body class="" >
 <jsp:include page="/WEB-INF/views/include/admin/adminHeader.jsp"/>
 
 
      <!-- End Navbar -->
      
      <div class="content">
      	<div class="card text-center">
  <div class="card-header">
    <ul class="nav nav-tabs card-header-tabs">
      <li class="nav-item">
        <a class="nav-link active" id = "all"href="<c:url value='/admin/table/1'/>">ALL(${totalCount})</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id ="NotDelBtn">Not Delete</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="DelBtn">Delete</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">order by</a>
      </li>
      <div id="result"></div> 
    </ul>
  </div>
  <div class="card-body">
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table" id="table_list_body">
                    <thead class=" text-primary">
					    <tr>
					   	  <th scope="col">userNum</th>
					      <th scope="col">userId</th>
					      <th scope="col">name</th>
					      <th scope="col">email</th>
					      <th scope="col">phone</th>
					      <th scope="col">birth</th>
					      <th scope="col">가입일</th>
					      <th scope="col">삭제일</th>
					      <th scope="col">삭제유무</th>
					      <th scope="col">삭제/복구</th>
					    </tr>              			
                    </thead>
                    <tbody id="list_table">
						<c:forEach var="member" items="${memberList}">
								<tr>
									<td>${member.userNum}</td>
									<td id="userId"><a href="<c:url value='/admin/user/${member.userId}'/>">${member.userId}</a></td>
									<td>${member.name}</td>
									<td>${member.email}</td>
									<td>${member.phone}</td>
									<td><fmt:formatDate value="${member.birth}" pattern="yyyy-MM-dd"/></td>
									<td><fmt:formatDate value="${member.insertDay}" pattern="yyyy-MM-dd"/></td>
									<td><fmt:formatDate value="${member.delDay}" pattern="yyyy-MM-dd"/></td>
									<c:if test="${member.delCount==0}">
									<td>유지</td>
									</c:if>
									<c:if test="${member.delCount==1}">
									<td>삭제</td>
									</c:if>
									<c:if test="${member.delCount==0}">
									<td><button class="btn btn-danger" id="adminDelete" value="${member.userId}">삭제</button></td>
									</c:if>
									<c:if test="${member.delCount==1}">
									<td><button class="btn btn-primary" id="adminRestore" value="${member.userId}">복구</button></td>
									</c:if>
								</tr>
					 	</c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
  		</div>
</div>
<div align="center">
<nav aria-label="Page navigation example" >
    <c:set var="countList" value="10"></c:set>
    <c:set var="countPage" value="10"></c:set>
    <c:set var="currentPage" value="${currentPage}"></c:set>
    <c:set var="stratPage" value="${((currentPage -1)/10)*10+1}"></c:set>
    <c:set var="endPage" value="${stratPage + countPage -1}"></c:set>
 	<c:set var="totalPage" value="${totalCount/countList}"></c:set>
 	<%-- <fmt:formatNumber value="${totalPage+(1-(totalPage%1))%1}" type="number"/>  --%>
 	<c:if test="${endPage > totalPage}">
 		<c:set var="endPage" value="${totalPage}"></c:set>
					
 	</c:if>
  <ul class="pagination">
    <li class="page-item">
   <c:if test="${currentPage == 1}">
    <a class="page-link disabled"aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
   </c:if>
  <c:if test="${currentPage != 1}">
      <a class="page-link" href="<c:url value='/admin/table/1'/>" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
   </c:if>

    </li>

 	<c:if test="${totalCount%countList > 0}">
 		<c:set var="totalPage" value="${totalPage+1}"></c:set>
 	</c:if>
    <c:forEach var="i" begin="1" end="${totalPage}">
    	<li class="page-item"><a class="page-link" href="<c:url value='/admin/table/${i}'/>">${i}</a></li>
    </c:forEach>
    
    <li class="page-item">
      <a class="page-link"  href="<c:url value='/admin/table/${totalPage-(totalPage%1)}'/>" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</div>

 <jsp:include page="/WEB-INF/views/include/admin/adminFooter.jsp"/>
   
  </div>
 <jsp:include page="/WEB-INF/views/include/admin/adminStaticJsp.jsp"/>
 <script>
 $("#DelBtn").hover(function(){
	    $('html').css("cursor","pointer");
	},function(){
		$('html').css("cursor","auto");
	})
$("#DelBtn").on('click', function(){
$.ajax({
	url:"<c:url value='/del/1'/>",
	type:"GET",
	data: {},
	success:function(data){
		console.log(data)
		$("#list_table").remove();
		var today = new Date();
		var newTbody = $("<tbody id='list_table'></tbody>")
		$("#DelBtn").empty()
		$("#DelBtn").append(" <span>Delete("+data.length+")</span>")
		$("#DelBtn").attr("class", "nav-link active")
		$("#NotDelBtn").attr("class", "nav-link")
		$("#all").attr("class", "nav-link")
		$("#table_list_body").append(newTbody)
		for(i =0;  i <data.length; i++){
				
			var memberRow = $("<tr>"+
				"<td>"+ data[i].userNum+"</td>"+
				"<td>"+"<a href="+"<c:url value='/admin/user/" +data[i].userId +"'/>"+ ">" + data[i].userId +"</a>"+"</td>"+
				"<td>"+ data[i].name + "</td>"+
				"<td>"+ data[i].email + "</td>"+
				"<td>"+ data[i].phone + "</td>"+
				"<td>"+formatDate(data[i].birth)+"</td>"+
				"<td>"+ formatDate(data[i].insertDay) + "</td>"+
				"<td>"+ formatDate(data[i].delDay) + "</td>"+
				"<td>"+ data[i].delCount + "</td>"+
				"<td>"+ "<button class="+"'btn btn-primary'>복구</button>" +"</td>");	
			
			$("#table_list_body").append(memberRow)
		}
	},
	error: function(){
		alert("몰라 안되")
	}
})
})


 $("#NotDelBtn").hover(function(){
	    $('html').css("cursor","pointer");
	},function(){
		$('html').css("cursor","auto");
	})
$("#NotDelBtn").on('click', function(){
$.ajax({
	url:"<c:url value='/del/0'/>",
	type:"GET",
	data: {},
	success:function(data){
		$("#list_table").remove();
		$("#NotDelBtn").empty()
		$("#DelBtn").attr("class", "nav-link")
		$("#all").attr("class", "nav-link")
		$("#NotDelBtn").attr("class", "nav-link active")
		$("#NotDelBtn").append("<span>Not Delete("+data.length+")</span>")
		var newTbody = $("<tbody id='list_table'></tbody>")
		
		$("#table_list_body").append(newTbody)
		for(i =0;  i <data.length; i++){
			var memberRow = $("<tr>"+
				"<td>"+ data[i].userNum+"</td>"+
				"<td>"+"<a href="+"<c:url value='/admin/user/" +data[i].userId +"'/>"+ ">" + data[i].userId +"</a>"+"</td>"+
				"<td>"+ data[i].name + "</td>"+
				"<td>"+ data[i].email + "</td>"+
				"<td>"+ data[i].phone + "</td>"+
				"<td>"+formatDate(data[i].birth)+"</td>"+
				"<td>"+formatDate(data[i].insertDay) + "</td>"+
				"<td>"+data[i].delDay + "</td>"+
				"<td>"+ data[i].delCount + "</td>"+
				"<td>"+ "<button class="+"'btn btn-danger'>삭제</button>" +"</td>");	
			
			$("#table_list_body").append(memberRow)
		}
		

	},
	error: function(){
		alert("몰라 안되")
	}
})
})

/* 날짜 포멧팅 함수  */
function formatDate(date) { 
	var d = new Date(date), 
	month = '' + (d.getMonth() + 1), 
	day = '' + d.getDate(), 
	year = d.getFullYear(); 
	if (month.length < 2) month = '0' + month; 
	if (day.length < 2) day = '0' + day; 
	return [year, month, day].join('-'); 
}

 // 회원 정보 삭제 하기

$("#adminDelete").on('click', function(){
	var userId = $("#adminDelete").attr('value');
	console.log(userId);
$.ajax({
	url:"<c:url value='/delete/'/>"+userId,
	type:"GET" ,
	data:{} ,
	success:function(data){
	console.log(data);
	
	}
})
})
// 회원 정보 복구하기 
$("#adminRestore").on('click', function(){
	var userId = $("#adminDelete").attr('value');
	console.log(userId);
$.ajax({
	url:"<c:url value='/restore/'/>"+userId,
	type:"GET" ,
	data:{} ,
	success:function(data){
	console.log(data);
	}
})
})


 

</script>

</body>

</html>