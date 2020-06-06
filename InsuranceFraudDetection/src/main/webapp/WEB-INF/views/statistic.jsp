<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/plugins/wordCloud.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<link href="<c:url value='/assets/css/statistic/style.css'/>" rel="stylesheet"/>
<body>
   <main id="main">

    <!-- ======= Blog Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>statistic</h2>

          <ol>
            <li><a href="./">Home</a></li>
            <li>statistic</li>
          </ol>
        </div>

      </div>
    </section><!-- End Blog Section -->

    <!-- ======= Blog Section ======= -->
    <section class="blog" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500">
      <div class="container">
        <div class="row">
          <div class="col-lg-9 entries">
			<!-- 첫번쨰 차트 -->
            <article class="entry" id="chart1">
				<h2 id="chartText" ></h2>
				<div id="chartdiv"></div>
				<h4 id="chartContent"></h4>
            </article><!-- End blog entry -->
			<!-- 두번쨰 차트 -->
            <article class="entry" id="chart2">
				<h2 id="chartText_sub"></h2>
				<div id="chartdiv_sub"></div>
				<h4 id="chartContent_sub"></h4>
			</article><!-- End blog entry -->
			<!-- 세번쨰 차트  -->
			<article class="entry" id="chart3" style="display:none">
				<div id="selectArea" style="display:none">
					<select id="test" class="custom-select" style="width:15%">
  						<option value="1">사기자</option>
  						<option value="2">일반인</option>
  					</select>
				</div>
				<h2 id="chartText_sub2"></h2>
				<div id="chartdiv_sub2"></div>
				<h4 id="chartContent_sub2"></h4>
			</article><!-- End blog entry -->
			<!-- 네번쨰 차트  -->
			<article class="entry" id="chart4" style="display:none">
				<div id="selectArea2" style="display:none">
					<select id="test2" class="custom-select" style="width:15%">
  						<option value="1">사기자</option>
  						<option value="2">일반인</option>
  					</select>
  				</div>
				<h2 id="chartText_sub3"></h2>
				<div id="chartdiv_sub3">
				</div>
			<h4 id="chartContent_sub3"></h4>
			</article><!-- End blog entry -->
          </div><!-- End blog entries list -->
		<!-- Start Category -->
          <div class="col-lg-3">
          	<div class="sidebar">
            	<h4 class="sidebar-title">Categories</h4>	
            	<div class="sidebar-item categories">
		            <ul>
		              <li><a href="<c:url value='/statistic'/>">실제 현황</a></li>
		              <li><a id="cloudTag">변수 중요도 탐색</a></li>
		              <li><a id="dangerHos">유의병원<span>(2)</span></a></li>
		              <li><a id="dangerDocAndHos">유의의사 <span>(3)</span></a></li>
		              <li><a id="claimBtn">사기 유형 <span>(4)</span></a></li>
		              <li><a id="agebtn">연령&성별<span>(2)</span></a></li>
		              <li><a id="areabtn">지역&직업<span>(6)</span></a></li>
		              <li><a id="incomeBtn">보험료&개인소득<span>(3)</span></a></li>
		              <li><a id="arryTypeBtn">가구소득&거주지 타입<span>(4)</span></a></li>
		              <li><a id="inforData">결혼유무&자녀비율<span>(2)</span></a></li>
		         
		            </ul>
		        </div>
            </div><!-- End sidebar -->
          </div><!-- End blog sidebar -->
        </div><!-- End .row -->
      </div><!-- End .container -->
    </section><!-- End Blog Section -->

  </main><!-- End #main -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
<!-- 커스텀 그래프  --> 
<!-- 그래프 js -->


<script src=<c:url value="/assets/js/statistic/statistic-graph.js"/>></script>
  <!-- 위 코드 고정 시키기   -->
  <script type="text/javascript">
  	document.getElementById('header').setAttribute('class', 'fixed-top')
  </script>

</body>

</html>