<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<link href="<c:url value='/assets/css/product/style.css'/>" rel="stylesheet"/>
<style>
.pagination {
   justify-content: center;

}
#container2 .highcharts-title-tooltip text{

}
</style>
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
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

    <!-- ======= 보험 사기자 판별 서비스 Section ======= -->
    <section class="services">
	  <c:if test="${not empty sessionScope.userId}"> 
	    <div class="back container">
	      <h1>보험 사기자 판별 시스템</h1> 
		  <div align="center" class="col-md-14">
			<table class="table">
			  <thead class="table-primary">
			    <tr>
			      <td scope="col" align="center">번호</td>
			      <td scope="col" align="center">고객 번호</td>
			      <td scope="col" align="center">청구 횟수</td>
			      <td scope="col" align="center">청구 정보 입력</td>
			      <td scope="col" align="center">사기꾼 판별하기</td>
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
			        <td align="center"><button class="searchBtn btn btn-outline-primary" value="${cust.custId}" id="">판별</button></td>
			      </tr>
			    </c:forEach>
			  </tbody>
			</table>
				<div >
					<nav aria-label="Page navigation example"  id="focusLocation">
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
		<div class="row" >
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
	  	<div id="chartText" style="text-align: center; color:#007bff;"></div>
	 	<div id="chartdiv" style="width: 100%;height: 200px;"></div>
	 	<div id="chartText2" style="text-align: center; color:#007bff;"></div>
	 	<div id="chartdiv2" style="width: 100%;height: 450px;"></div>   
		<div class="container show-grid">
		  <div class="wrap-loading display-none">
	    	<div><img src="<c:url value='/assets/img/product/100.gif'/>" /></div>
		  </div> 		
		</div>	   
			
	  </c:if>
	</section>
	<!-- End 보험 사기자 판별 서비스 Section -->

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
            $('html, body').animate({
                scrollTop: $("#focusLocation").offset().top
            }, 2000);
            
           /*  document.getElementById("focusLocation").scrollIntoView(); */
         },
         success:function(result){
            console.log(result);
            
            data = JSON.parse(result[0])
            data2 = JSON.parse(result[1])
            data3 = JSON.parse(result[2])
            data4 = JSON.parse(result[3])
        	data5 = JSON.parse(result[4])
        	console.log(data5)
        	/* VotingClass */
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
            /* SVM */
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
                  },  tooltip: {
                	    pointFormat: '<span>Custom text including HTML tags... Whatever.</span>'
                  }
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
            $("#container2 .highcharts-title").hover(function(){
      
            	$(this).attr('class','d-inline-block');
            	$(this).attr('title', '안녕하세요 이것은 svm 이라는 것이에요 ㅎㅎ');
            	$(this).attr('data-toggle',"tooltip")
            })
            
            
            /*  XGBOOST */
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
           /* RANDOM FOREST */
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
           /* 인공신경망 */
            am4core.ready(function() {
				
            	// Themes begin
            	am4core.useTheme(am4themes_animated);
            	am4core.disposeAllCharts();
            	// Themes end
            	$("#chartText").empty();
            	var artificialNeuralNetworkText = $("<h2 style='color:#007bff;'>인공신경망 </h2>");
				$("#chartText").append(artificialNeuralNetworkText);
            	var iconPath = "M53.5,476c0,14,6.833,21,20.5,21s20.5-7,20.5-21V287h21v189c0,14,6.834,21,20.5,21 c13.667,0,20.5-7,20.5-21V154h10v116c0,7.334,2.5,12.667,7.5,16s10.167,3.333,15.5,0s8-8.667,8-16V145c0-13.334-4.5-23.667-13.5-31 s-21.5-11-37.5-11h-82c-15.333,0-27.833,3.333-37.5,10s-14.5,17-14.5,31v133c0,6,2.667,10.333,8,13s10.5,2.667,15.5,0s7.5-7,7.5-13 V154h10V476 M61.5,42.5c0,11.667,4.167,21.667,12.5,30S92.333,85,104,85s21.667-4.167,30-12.5S146.5,54,146.5,42 c0-11.335-4.167-21.168-12.5-29.5C125.667,4.167,115.667,0,104,0S82.333,4.167,74,12.5S61.5,30.833,61.5,42.5z"



            	var chart = am4core.create("chartdiv", am4charts.SlicedChart);
            	chart.hiddenState.properties.opacity = 0; // this makes initial fade in effect

            	chart.data = [{
            	    "name": "일반인",
            	    "value": data5[0]["NO"]},
            	    {
                	 "name": "사기꾼",
                	 "value": data5[0]["YES"]}
            	];

            	var series = chart.series.push(new am4charts.PictorialStackedSeries());
            	series.dataFields.value = "value";
            	series.dataFields.category = "name";
            	series.alignLabels = true;

            	series.maskSprite.path = iconPath;
            	series.ticks.template.locationX = 1;
            	series.ticks.template.locationY = 0.5;
                series.colors.list = [
                    am4core.color("#007bff"),
                    am4core.color("red"),
                  ];
            	series.labelsContainer.width = 200;

            	chart.legend = new am4charts.Legend();
            	chart.legend.position = "left";
            	chart.legend.valign = "bottom";

            	}); // end am4core.ready()
            // 중요도 변수 분포 11개
            	am4core.ready(function() {
            		$("#chartText2").empty();
            		var variableImportantText = $("<h2 style='color:red;'>변수 중요도 </h2>");
					$("#chartText2").append(variableImportantText)
            		// Themes begin
            		am4core.useTheme(am4themes_animated);
            		// Themes end

            		// Create chart instance
            		var chart = am4core.create("chartdiv2", am4charts.XYChart);
            		chart.scrollbarX = new am4core.Scrollbar();

            		// Add data
            		chart.data = [{
				  		  "variable": "의사X병원",
				  		  "ratio": 0.316474
				  		}, {
				  		  "variable": "의사 ",
				  		  "ratio": 0.247068
				  		}, {
				  		  "variable": "병원 ",
				  		  "ratio": 0.158038
				  		}, {
				  		  "variable": "입원일수",
				  		  "ratio": 0.0692848
				  		}, {
				  		  "variable": "청구횟수",
				  		  "ratio": 0.0277594
				  		}, {
				  		  "variable": "질병X입원",
				  		  "ratio": 0.0207614
				  		}, {
				  		  "variable": "재해",
				  		  "ratio": 0.015713
				  		}, {
				  		  "variable": "질병",
				  		  "ratio": 0.0126492
				  		}, {
				  		  "variable": "총보험료",
				  		  "ratio": 0.010715
				  		}, {
				  		  "variable": "최대보험료",
				  		  "ratio": 0.0096616
				  		}];

            		prepareParetoData();

            		function prepareParetoData(){
            		    var total = 0;

            		    for(var i = 0; i < chart.data.length; i++){
            		        var value = chart.data[i].ratio;
            		        total += value;
            		    }

            		    var sum = 0;
            		    for(var i = 0; i < chart.data.length; i++){
            		        var value = chart.data[i].ratio;
            		        sum += value;   
            		        chart.data[i].pareto = sum / total * 100;
            		    }    
            		}

            		// Create axes
            		var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
            		categoryAxis.dataFields.category = "variable";
            		categoryAxis.renderer.grid.template.location = 0;
            		categoryAxis.renderer.minGridDistance = 60;
            		categoryAxis.tooltip.disabled = true;

            		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
            		valueAxis.renderer.minWidth = 50;
            		valueAxis.min = 0;
            		valueAxis.cursorTooltipEnabled = false;

            		// Create series
            		var series = chart.series.push(new am4charts.ColumnSeries());
            		series.sequencedInterpolation = true;
            		series.dataFields.valueY = "ratio";
            		series.dataFields.categoryX = "variable";
            		series.tooltipText = "[{categoryX}: bold]{valueY}[/]";
            		series.columns.template.strokeWidth = 0;

            		series.tooltip.pointerOrientation = "vertical";

            		series.columns.template.column.cornerRadiusTopLeft = 10;
            		series.columns.template.column.cornerRadiusTopRight = 10;
            		series.columns.template.column.fillOpacity = 0.8;

            		// on hover, make corner radiuses bigger
            		var hoverState = series.columns.template.column.states.create("hover");
            		hoverState.properties.cornerRadiusTopLeft = 0;
            		hoverState.properties.cornerRadiusTopRight = 0;
            		hoverState.properties.fillOpacity = 1;

            		series.columns.template.adapter.add("fill", function(fill, target) {
            		  return chart.colors.getIndex(target.dataItem.index);
            		})


            		var paretoValueAxis = chart.yAxes.push(new am4charts.ValueAxis());
            		paretoValueAxis.renderer.opposite = true;
            		paretoValueAxis.min = 0;
            		paretoValueAxis.max = 100;
            		paretoValueAxis.strictMinMax = true;
            		paretoValueAxis.renderer.grid.template.disabled = true;
            		paretoValueAxis.numberFormatter = new am4core.NumberFormatter();
            		paretoValueAxis.numberFormatter.numberFormat = "#'%'"
            		paretoValueAxis.cursorTooltipEnabled = false;

            		var paretoSeries = chart.series.push(new am4charts.LineSeries())
            		paretoSeries.dataFields.valueY = "pareto";
            		paretoSeries.dataFields.categoryX = "variable";
            		paretoSeries.yAxis = paretoValueAxis;
            		paretoSeries.tooltipText = "pareto: {valueY.formatNumber('#.0')}%[/]";
            		paretoSeries.bullets.push(new am4charts.CircleBullet());
            		paretoSeries.strokeWidth = 2;
            		paretoSeries.stroke = new am4core.InterfaceColorSet().getFor("alternativeBackground");
            		paretoSeries.strokeOpacity = 0.5;

            		// Cursor
            		chart.cursor = new am4charts.XYCursor();
            		chart.cursor.behavior = "panX";

            		}); // end am4core.ready()    	
			            	
            	
            	
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