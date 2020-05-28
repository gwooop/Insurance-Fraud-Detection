<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<style type="text/css" >
#test{
	background-image: url("../assets/img/product/523.jpg");
	width: 100%;
    height: 100%;
}
h1{
	text-align: center;

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
            <li>로그인 하세욧!</li>
          </ol>
        </div>
      </div>
    </section><!-- End Our Services Section -->

    <!-- ======= 보험 사기자 탐색 서비스 Section ======= -->
    <section class="services">
	 <div id="test">
	 	<h1>로그인을 하면 서비스를 이용할 수 있습니다!</h1>
	 
	 </div>
	</section>
	<!-- End 보험 사기자 탐색 서비스 Section -->

  </main><!-- End #main -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
    <!-- 위 코드 고정 시키기   -->
  	<script type="text/javascript">
     document.getElementById('header').setAttribute('class', 'fixed-top');
    </script>
</body>

</html>