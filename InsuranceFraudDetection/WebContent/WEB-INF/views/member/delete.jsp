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
          <h2>삭제하기</h2>
          <ol>
            <li><a href="<c:url value='/'/>">Home</a></li>
            <li>계정 삭제</li>
          </ol>
        </div>

      </div>
    </section><!-- End About Us Section -->
<div class="container">
	<div class="pg-opt">
        <div class="row">
            <div class="col-md-6 pc">
                <h2>${message}</h2>
            </div>
            <div class="col-md-6">
                <ol >
                   
                </ol>
            </div>
        </div>
    </div>
	<div class="content">
	<form action="<c:url value='/member/delete'/>" method="post" class="form-horizontal">
	<div class="form-group">
      <label class="control-label col-sm-2" for="password">password 입력</label>
      <div class="col-sm-4">
        <input type="password" name="password" id="password" class="form-control">
      </div>
    </div>
    	<div class="form-group">
      <label class="control-label col-sm-2" for="userId"></label>
      <div class="col-sm-4">
        <input type="hidden" name="userId" id="userId" class="form-control" value="${member.userId}">
      </div>
    </div>
    <div class="form-group">
    	<div class="col-sm-offset-2 col-sm-8">
		<input type="submit" class="btn btn-danger" value="삭제" id="before-submit">
		<a  class ="btn btn-info"href="<c:url value='/'/>">취소</a>
		
		</div>
	</div>
	</form>
	</div>
</div>
    <!-- ======= About Section ======= -->
    
    <section class="team" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500">

  
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
  	document.getElementById('header').setAttribute('class', 'fixed-top')
/*   	document.getElementById('before-submit').onclick = function(){
  		 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
  		      document.form.submit();
  		  }else{   //취소
  		      return;
  		  }
  	} */
  </script>
</body>
</html>
