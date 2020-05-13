<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setBundle basename="i18n/board" />
<html lang="en">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<main id="main">

    <!-- ======= About Us Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
      	<c:if test="${empty sessionScope.userId }">
      	  <h2>로그인</h2>
          <ol>
            <li><a href="<c:url value='/'/>">Home</a></li>
            <li>로그인</li>
          </ol>
        </c:if>
   		<c:if test="${ not empty sessionScope.userId }">
          <h2>My Page</h2>
          <ol>
            <li><a href="<c:url value='/member/login'/>">${sessionScope.userId}</a>님 환영 합니다</li>
          </ol>   		
   		</c:if>

        </div>

      </div>
    </section><!-- End About Us Section -->

    <!-- ======= About Section ======= -->
    
    <section class="team" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500">
<div class="container">
	<div class="pg-opt">
        <div class="row">
            <div class="col-md-6 pc">
                <h2></h2>
            </div>
            <div class="col-md-6">
                <ol class="">
     
                </ol>
            </div>
        </div>
    </div>
<div class="content">
<c:if test="${empty sessionScope.userId}">
<div align="center">
	<form action="<c:url value='/admin/login'/>" method="post" class="form-horizontal">
	<div class="form-group">
      <label class="control-label col-sm-2" for="id"><h1>코송이</h1></label>
      <div class="col-sm-8">
        <input type="text" name="userId" id="id" class="form-control" placeholder="id" aria-describedby="basic-addon1">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pw"></label>
      <div class="col-sm-8">
        <input type="password" name="password" id="pw" class="form-control" placeholder="password" aria-describedby="basic-addon1">
      </div>
    </div>
    <h4 style="color:red">${message}</h4>
    <div class="form-group">
    	<div class="col-sm-offset-2 col-sm-8">
		<input type="submit" class="btn btn-info btn-lg btn-block" value="로그인" id="login">
		<a href="<c:url value='/member/insert'/>" class="btn btn-primary btn-lg btn-block">회원 가입</a>
		</div>
		
	</div>
	</form>
</div>
</c:if>
<!-- 사인아웃 -->
<c:if test="${not empty sessionScope.userId}">
<div class="card mb-3" style="max-width: 860;">
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="<c:url value="/assets/img/comments-2.jpg"/>" class="card-img" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
         <ul class="list-group list-group-flush">
    		<li class="list-group-item"><strong>${userId}</strong></li>
    		<li class="list-group-item">이름 :${name}</li>
    		<li class="list-group-item">email :${email}</li>
    		<li class="list-group-item">생일 :<fmt:formatDate value="${birth}" pattern="yyyy-MM-dd"/></li>
  		</ul>
 		 <div class="card-body" align="right">
			<a class ="btn btn-info center" href="<c:url value='/member/update'/>">수정하기</a>
			<a class ="btn btn-info center" href="<c:url value='/member/logout'/>">로그 아웃</a>
			<a class ="btn btn-danger center"  href="<c:url value='/member/delete'/>">삭제하기</a>
  		</div>
      </div>
    </div>
  </div>
</div>
<!--홈페이지 사인아웃 -->

  </div>
</div>


</c:if>

  
    </section><!-- End About Section -->

    <!-- ======= Facts Section ======= -->
    <section class="facts section-bg" data-aos="fade-up">

    </section><!-- End Facts Section -->

    <!-- ======= Our Skills Section ======= -->
    <section class="skills" data-aos="fade-up">
    </section><!-- End Our Skills Section -->

    <!-- ======= Tetstimonials Section ======= -->
 

  </main><!-- End #main -->

	
<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
  <script type="text/javascript">
  	document.getElementById('header').setAttribute('class', 'fixed-top');	

  </script>
</body>
</html>
