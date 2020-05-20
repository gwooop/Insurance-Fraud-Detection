<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<style type="text/css" >

.wrap-loading{ /*화면 전체를 어둡게 합니다.*/

    position: fixed;

    left:0;

    right:0;

    top:0;

    bottom:0;

    background: rgba(0,0,0,0.2); /*not in ie */

    filter:  progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',endColorstr='#20000000');  

}

.wrap-loading div{ /*로딩 이미지*/

    position: fixed;

    top:50%;

    left:50%;

    margin-left: -21px;

    margin-top: -21px;

}

.display-none{ /*감추기*/

    display:none;

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
			        <td align="center">${status.index+1}</td>
			        <td align="center"><a href="../custManageServices/${sessionScope.custManagerId}/${cust.custId}">${cust.custId}</a></td>	
			        <td align="center">${claimList[status.index]}</td>
			        <td align="center">
			          <button class="claimBtn btn btn-outline-primary" value="${cust.custId}">버튼</button>
			        </td>
			        <td align="center"><button class="searchBtn btn btn-outline-primary" value="${cust.custId}" id="">탐색</button></td>
			      </tr>
			    </c:forEach>
			  </tbody>
			</table>
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
	              <div id="container2" style="height:320px"></div>
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
	    	<div><img src="<c:url value='/assets/img/product/100.gif'/>" /></div>
		  </div> 		
		</div>	   
			
	  </c:if>
	</section>
	<!-- End 보험 사기자 탐색 서비스 Section -->

  </main><!-- End #main -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
    <!-- 위 코드 고정 시키기   -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
  	<script type="text/javascript">
     document.getElementById('header').setAttribute('class', 'fixed-top');
     
     $(".claimBtn").on("click",function(){
    		var claimBtn = $(this);
    		var tr = claimBtn.parent().parent();
    		var td = tr.children();
    		var custId = td.eq(1).text();
    		var custManagerId = ${sessionScope.custManagerId}
    		    		
    		location.href = "<c:url value='../claimServices/'/>" + custManagerId + "/" + custId;
    	})
     
    $("#test").on("click",function(){
        var cust= $("#restTest").value;
          console.log(cust) 
      $.ajax({
         url:"<c:url value='/restTest/22427'/>",
         type:"GET",
         data:{},
         success:function(data){
            console.log(data);
         }
      })  
   })
   
   $("#getCustList").on("click", function(){
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
   })
   
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
         timeout:100000,
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
                  text: "인공신경망",
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
            Highcharts.chart('container3', {
              chart: {
                  plotBackgroundColor: null,
                  plotBorderWidth: null,
                  plotShadow: false,
                  type: 'pie'
              },
              title: {
                  text: "XGBOOST",
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
         $("#textArea").empty() 
      if(data[0]["SIU_CUST_YN"] ==0){
         $("#textArea").append("<h2> 일반인일 확률이 더 높습니다. </h2>")
      
         $("#textArea").focus();
         }else{
            $("#textArea").append("<h2> 사기꾼일 확률이 더 높습니다. </h2>")
         } 
             
            
      },
      error:function(request,status,error){
           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
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