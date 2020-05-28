<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<style>
#chartdiv {
  width: 100%;
  height: 600px;
}
#chartdiv_sub{
  width: 100%;
  height: 600px;
}
#chartdiv_sub2{
  width: 100%;
  height: 600px;
}
#chartdiv_sub3{
  width: 100%;
  height: 600px;
}
h2{
  color:#1e4356;
  text-align:center;
}
h4{
  color:#1e4356;
  
}


</style>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<body>
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

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

            <article class="entry" id="chart1">
         <h2 id="chartText" ></h2>
         <div id="chartdiv"></div>
         <h4 id="chartContent"></h4>
            </article><!-- End blog entry -->

            <article class="entry" id="chart2">
         
         <h2 id="chartText_sub"></h2>
         <div id="chartdiv_sub"></div>
         <h4 id="chartContent_sub"></h4>
         </article><!-- End blog entry -->
         
         <article class="entry" id="chart3" style="display:none">
         <div id="selectArea" style="display:none">
         <select id="test" class="custom-select" style="width:15%">
           <option value="1">1</option>
           <option value="2">2</option>
           </select>
         </div>
         
         <h2 id="chartText_sub2"></h2>
         <div id="chartdiv_sub2"></div>
         <h4 id="chartContent_sub2"></h4>
         </article><!-- End blog entry -->
         
         <article class="entry" id="chart4" style="display:none">
         <div id="selectArea2" style="display:none">
         <select id="test2" class="custom-select" style="width:15%">
           <option value="1">1</option>
           <option value="2">2</option>
           </select>
           </div>
         <h2 id="chartText_sub3"></h2>
         <div id="chartdiv_sub3">
         
         
         
         
         </div>
         <h4 id="chartContent_sub3"></h4>
         </article><!-- End blog entry -->

          </div><!-- End blog entries list -->

          <div class="col-lg-3">
             
            <div class="sidebar">
            
               <h4 class="sidebar-title">Categories</h4>   
            
              <div class="sidebar-item categories">
                <ul>
                  <li><a href="<c:url value='/blog'/>">실제 현황</a></li>
                  <li><a id="cloudTag">클라우드 태그</a></li>
                  <li><a id="dangerDocAndHos">주의병원&의사 <span>(5)</span></a></li>
                  <li><a id=claimBtn>사기 유형 <span>(4)</span></a></li>
                  <li><a id="agebtn">나이</a>(6)</li>
                  <li><a id="inforData">정보데이터1<span>(4)</span></a></li>
                  <li><a id="inforData2">정보데이터(금액)<span>(4)</span></a></li>
                  <li><a id="inforData3">정보데이터3<span>(4)</span></a></li>
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
  
  <!-- 위로 올라가는 화살표  -->
<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
<script src=<c:url value="/assets/js/product/statistic-graph.js"/>></script>
<script src="https://www.amcharts.com/lib/4/plugins/wordCloud.js"></script>
  <!-- 위 코드 고정 시키기   -->
  <script type="text/javascript">
     document.getElementById('header').setAttribute('class', 'fixed-top')
/*      $("#agebtn").on("click", function(){
        var jsonLocation = "<c:url value='/assets/json/crook_claim_count.json'/>";

        $.getJSON(jsonLocation, function(data){
      
           console.log(data)
        });
     }) */
     

     




  </script>

</body>

</html>