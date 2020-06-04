<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<link href="<c:url value='/assets/css/product/style.css'/>" rel="stylesheet"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
.pagination {
   justify-content: center;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>

  <main id="main">

    <!-- ======= Our Services Section ======= -->

    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>Our Services</h2>
          <ol>
            <li><a href="../../">Home</a></li>
            <li>${sessionScope.userId}님환영합니다</li>
          </ol>
        </div>
      </div>
    </section><!-- End Our Services Section -->

    <!-- ======= 보험 사기자 탐색 서비스 Section ======= -->
    <section class="services">
	  <c:if test="${not empty sessionScope.userId}"> 
	    <div class="back container">
	      <h1>보험 사기자 탐색 시스템</h1> 
	      <img id="svm" src="assets/img/svm.jpg" name="svm" alt="">	
		  <div align="center" class="col-md-14">
			<table class="table">
			  <thead class="table-primary">
			    <tr>
			      <td scope="col" align="center">번호</td>
			      <td scope="col" align="center">고객 번호</td>
			      <td scope="col" align="center">청구 횟수</td>
			      <td scope="col" align="center">청구 정보 입력</td>
			      <td scope="col" align="center">사기꾼 탐색하기</td>
			    </tr>
			  </thead>
			  <tbody id="custBody">
			    <c:forEach  var="cust" items="${custList}" varStatus="status" >
			      <tr>
			        <td align="center">${cust.rownum}</td>
			        <td align="center"><a href="<c:url value='/product/custManageServices/${sessionScope.userId}/${sessionScope.custManagerId}/${cust.custId}/1'/>">${cust.custId}</a></td>
			        				  	
			        <td align="center">${claimList[status.index]}</td>
			        <td align="center">
			          <button class="claimBtn btn btn-outline-primary" value="${cust.custId}">입력</button>
			        </td>
			        <td align="center"><button class="searchBtn btn btn-outline-primary" value="${cust.custId}" id="">탐색</button></td>
			      </tr>
			    </c:forEach>
			  </tbody>
			</table>
				<div >
					<nav aria-label="Page navigation example" >
					    <c:set var="countList" value="10"></c:set>
					    <c:set var="countPage" value="10"></c:set>
					    <c:set var="currentPage" value="${currentPage}"></c:set>
					    <c:set var="stratPage" value="${((currentPage -1)/10)*10+1}"></c:set>
					    <c:set var="endPage" value="${stratPage + countPage -1}"></c:set>
					 	<c:set var="totalPage" value="${custCount/countList}"></c:set>
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
					      <a class="page-link" href="<c:url value='/product/services/${sessionScope.custManagerId}/1'/>" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					   </c:if>
					    </li>
					 	<c:if test="${custCount%countList > 0}">
					 		<c:set var="totalPage" value="${totalPage+1}"></c:set>
					 	</c:if>
					    <c:forEach var="i" begin="1" end="${totalPage}">
					    	<li class="page-item"><a class="page-link" href="<c:url value='/product/services/${sessionScope.custManagerId}/${i}'/>">${i}</a></li>
					    </c:forEach>
					    <li class="page-item">
					      <a class="page-link"  href="<c:url value='/product/services/${sessionScope.custManagerId}/${totalPage-(totalPage%1)}'/>" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
					<div align="right">
		      			<a href="<c:url value='/product/custServices'/>">
					        <button class="btn btn-secondary">고객 정보 입력 </button>
		     			</a>
					</div>
		  		</div>
			</div>
		<div class="row">
	      <div class="col-md-5">
	        <figure class="highcharts-figure">
	          <div id="container"></div>
	          <p class="highcharts-description"></p>
	        </figure>
	      </div>
	      <div class="col-md-6">
	        <p class="highcharts-description" style="height:65px" id="textArea"></p>
	        <div class="row">
	          <div class="col-xs-1 col-sm-4">
	       	    <figure class="highcharts-figure">
	              <div data-toggle="tooltip" id="container2" style="height:320px"></div>	
	            </figure>
	          </div>
	          <div class="col-xs-1 col-sm-4">
	            <figure class="highcharts-figure">
	              <div id="container3" style="height:320px"></div>
	              <p class="highcharts-description"></p>
	            </figure>      
	          </div>
	          <div class="col-xs-1 col-sm-4">
				<figure class="highcharts-figure">
	              <div id="container4" style="height:320px"></div>
	              <p class="highcharts-description"></p>
	            </figure>
	          </div>
	        </div>
	      </div>
	    </div>
	    
		<div class="container show-grid">
		  <div class="wrap-loading display-none">
	    	<div><img src="<c:url value='/assets/img/product/100.gif'/>"/></div>
		  </div> 		
		</div>	   
			
	  </c:if>
	  <!-- 폼 레이어  -->
	  <div id="firstpopupLayer" style="display:none">
	  	<img id="svm" src="assets/img/svm.jpg" name="svm" alt="">	
		Support Vector Machine<br>
		두 집단 중 어느 하나에 속한 데이터의 집합이 주어졌을 때, SVM는 새로운 데이터가 어느 집단에 속할지 판단하는 알고리즘
	  </div>
  	  <div id="secondpopupLayer" style="display:none">
		XGBOOST<br>
		모델 예측의 오답에 대해 높은 가중치를 부여하고, 정답에 대해 낮은 가중치를 부여하는 알고리즘
	  </div>
  	  <div id="thirdpopupLayer" style="display:none">
		Random Forest<br>
		여러 결정 트리들이 내린 예측 값들 중 가장 많이 나온 값을 최종 예측값으로 정하는 알고리즘 
	  </div>
	  <!-- //폼 레이어  -->
	</section>
	<!-- End 보험 사기자 탐색 서비스 Section -->
  </main><!-- End #main -->
  
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<!-- <script src=<c:url value="/assets/js/product/product-json.js"/>></script> -->
<script type="text/javascript">
    <!-- 위 코드 고정 시키기   -->
document.getElementById('header').setAttribute('class', 'fixed-top');
     
$(".claimBtn").on("click",function(){
 		var claimBtn = $(this);
 		var tr = claimBtn.parent().parent();
 		var td = tr.children();
 		var custId = td.eq(1).text();
 		var custManagerId = ${sessionScope.custManagerId}
 		    		
 		location.href = "<c:url value='/product/claimServices/'/>" + custManagerId + "/" + custId;
});   
  /*  $("#getCustList").on("click", function(){
      var custManagerId = ${sessionScope.custManagerId}
      $.ajax({
         url:"<c:url value='/product/list/'/>"+custManagerId,
         type:"GET",
         data:{},
         success:function(data){
            console.log(data);
            $("#custBody").empty()
            
            
            for(i =0; i <data.length; i++){
                  var applyHTML =$("<tr scope='row'>"+
                        "<td>"+ data[i].custId+"</td>"+
                        "<td>"+"<button class='btn btn-info'>등록</button>" +"</td>"+
                        "<td>"+"<button class='btn btn-info'>탐색하기</button>" +"</td>"+
                        "</tr>")
            $("#custBody").append(applyHTML);            
            }   
         }
      })
   }) */
   
   $(".searchBtn").on("click", function(){
      var checkBtn = $(this);
      var tr = checkBtn.parent().parent();
      var td = tr.children();
      var custId = td.eq(1).text();
      console.log(custId)
            
      $.ajax({
         url:"<c:url value='/restTest/'/>"+custId,
         type:"GET",
         dataType:'json',
         data:{},
         timeout:150000,
         beforeSend: function() {
            $('.wrap-loading').removeClass('display-none');
         },complete:function(){
            $('.wrap-loading').addClass('display-none');  
         },
         success:function(result){
            console.log(result);
            
            data = JSON.parse(result[0])
            data2 = JSON.parse(result[1])
            data3 = JSON.parse(result[2])
            data4 = JSON.parse(result[3])
        
            Highcharts.chart('container', {
              chart: {
                  plotBackgroundColor: null,
                  plotBorderWidth: null,
                  plotShadow: false,
                  type: 'pie'
              },
              title: {
                  text: data[0]["CUST_ID"] + '의 보험 사기자일 확률',
                  style: {
                      color: '#007bff',
                      fontWeight: 900
                  }
              },
              tooltip: {
                  pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
              },
              accessibility: {
                  point: {
                      valueSuffix: '%'
                  }	
              },
              plotOptions: {
                  pie: {	
                      allowPointSelect: true,
                      cursor: 'pointer',
                      colors: pieColors,
                      dataLabels: {
                          enabled: true,
                          format: '<b>{point.name}</b><br>{point.percentage:.1f} %',
                          distance: -50,
                          filter: {
                              property: 'percentage',
                              operator: '>',
                              value: 4
                          },
                          style:{
                              fontFamily: 'monospace',
                            fontSize: '1.2em',
                            fontWeight: 0
                          }
                          
                      }
                  }
              },
              series: [{
                  name: '보험사기자',
                  data: [
                      { name: '일반인', y: data[0]["NO"] },
                      { name: '사기꾼', y: data[0]["YES"] }
                   
                  ],
                  animation: {
                      duration: 3000
                  }
                  
              
              }]
          });
            Highcharts.chart('container2', {
              chart: {
                  plotBackgroundColor: null,
                  plotBorderWidth: null,
                  plotShadow: false,
                  type: 'pie'
              },
              title: {
                  text: "SVM",
                  useHTML:true,
                  style: {
                      color: '#007bff',
                      fontWeight: 100,
                      fontSize: '1.2em'
                  }
              },
              tooltip: {
                  pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
              },
              accessibility: {
                  point: {
                      valueSuffix: '%'
                  }
              },
              plotOptions: {
                  pie: {
                      allowPointSelect: true,
                      cursor: 'pointer',
                      colors: pieColors,
                      dataLabels: {
                          enabled: false,
                          format: '<b>{point.name}</b><br>{point.percentage:.1f} %',
                          distance: -50,
                          filter: {
                              property: 'percentage',
                              operator: '>',
                              value: 4
                          }
                      }
                  }
              },
              series: [{
                  name: '보험사기자',
                  data: [
                      { name: '일반인', y: data2[0]["NO"] },
                      { name: '사기꾼', y: data2[0]["YES"] },
                  ]
              }]
          });
                       
            $('#container2 .highcharts-title').hover(function(e){
        		$('#firstpopupLayer').css("display", "block")
        		var sWidth = window.innerWidth;
        		var sHeight = window.innerHeight;

        		// 레이어가 나타날 위치를 셋팅한다.
        		var divLeft = e.pageX;
        		var divTop = e.pageY;
				
        		$('#firstpopupLayer').css({
        			"top": divTop,
        			"left": divLeft,
        			"position": "absolute"
        		}).show();
            }, function(){
            	$('#firstpopupLayer').hide()
            });
            
            Highcharts.chart('container3', {
              chart: {
                  plotBackgroundColor: null,
                  plotBorderWidth: null,
                  plotShadow: false,
                  type: 'pie'
              },
              title: {
                  text: "XGBOOST",
                  useHTML:true,
                  style: {
                      color: '#007bff',
                      fontWeight: 100,
                      fontSize: '1.2em'
                  }
              },
              tooltip: {
                  pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
              },
              accessibility: {
                  point: {
                      valueSuffix: '%'
                  }
              },
              plotOptions: {
                  pie: {
                      allowPointSelect: true,
                      cursor: 'pointer',
                      colors: pieColors,
                      dataLabels: {
                          enabled: false,
                          format: '<b>{point.name}</b><br>{point.percentage:.1f} %',
                          distance: -50,
                          filter: {
                              property: 'percentage',
                              operator: '>',
                              value: 4
                          }
                      }
                  }
              },
              series: [{
                  name: '보험사기자',
                  data: [
                      { name: '일반인', y: data3[0]["NO"] },
                      { name: '사기꾼', y: data3[0]["YES"] },
                  ]
              }]
          });
            $('#container3 .highcharts-title').hover(function(e)
            	{
            		$('#secondpopupLayer').css("display", "block")
            		var sWidth = window.innerWidth;
            		var sHeight = window.innerHeight;

            		// 레이어가 나타날 위치를 셋팅한다.
            		var divLeft = e.pageX;
            		var divTop = e.pageY;
    				
            		$('#secondpopupLayer').css({
            			"top": divTop,
            			"left": divLeft,
            			"position": "absolute"
            		}).show();
                }, function(){
                	$('#secondpopupLayer').hide()
                });
           // -----
            Highcharts.chart('container4', {
              chart: {
                  plotBackgroundColor: null,
                  plotBorderWidth: null,
                  plotShadow: false,
                  type: 'pie'
              },
              title: {
                  text: "Random Forest",
                  useHTML:true,
                  style: {
                      color: '#007bff',
                      fontWeight: 100,
                      fontSize: '1.2em'
                  }
              },
              tooltip: {
                  pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
              },
              accessibility: {
                  point: {
                      valueSuffix: '%'
                  }
              },
              plotOptions: {
                  pie: {
                      allowPointSelect: true,
                      cursor: 'pointer',
                      colors: pieColors,
                      dataLabels: {
                          enabled: false,
                          format: '<b>{point.name}</b><br>{point.percentage:.1f} %',
                          distance: -50,
                          filter: {
                              property: 'percentage',
                              operator: '>',
                              value: 4
                          }
                      }
                  }
              },
              series: [{
                  name: '보험사기자',
                  data: [
                      { name: '일반인', y: data4[0]["NO"] },
                      { name: '사기꾼', y: data4[0]["YES"] },
                  ]
              }]
          });
            $('#container4 .highcharts-title').hover(function(e)
            	{
            		$('#thirdpopupLayer').css("display", "block")
            		var sWidth = window.innerWidth;
            		var sHeight = window.innerHeight;

            		// 레이어가 나타날 위치를 셋팅한다.
            		var divLeft = e.pageX;
            		var divTop = e.pageY;
    				
            		$('#thirdpopupLayer').css({
            			"top": divTop,
            			"left": divLeft,
            			"position": "absolute"
            		}).show();
                }, function(){
                	$('#thirdpopupLayer').hide()
                });
         $("#textArea").empty() 
      if(data[0]["SIU_CUST_YN"] ==0){
         $("#textArea").append("<h2> 일반인일 확률이 더 높습니다. </h2>")
      
         $("#textArea").focus();
         }else{
            $("#textArea").append("<h2> 사기꾼일 확률이 더 높습니다. </h2>")
         } 
             
            
      },
      error:function(request,status,error){
           /* alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); */
           alert("다시 시도해 주세요");
        }
      })
     })
     
     // Make monochrome colors
      var pieColors = (function () {
          var colors = [],
              base = Highcharts.getOptions().colors[0],
              i;
      
          for (i = 0; i < 10; i += 1) {
              // Start out with a darkened base color (negative brighten), and end
              // up with a much brighter color
              colors.push(Highcharts.color(base).brighten((i) / 5).get());
          }
          return colors;
      }());
   </script>
</body>

</html>