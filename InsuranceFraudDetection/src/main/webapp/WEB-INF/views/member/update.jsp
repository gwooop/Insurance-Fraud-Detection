<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setBundle basename="i18n/member" />
<html lang="en">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<main id="main">

    <!-- ======= About Us Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>${message}</h2>
          <ol>
            <c:if test="${empty sessionScope.userId}">
            <li><a href="<c:url value='/'/>">Home</a></li>
            <li></li>
            </c:if>
            <c:if test="${ not empty sessionScope.userId}">
            <li><a href="<c:url value='/member/login'/>">${member.name}</a></li>
            </c:if>
          </ol>
        </div>

      </div>
    </section><!-- End About Us Section -->

    <!-- ======= About Section ======= -->
    
    <section class="team" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500">
<div class="container">
	<div class="pg-opt">
        <div class="row">
            <div class="col-md-6 pc">
                <h2>${message}</h2>
            </div>
            <div class="col-md-6">
            </div>
        </div>
    </div>
	<div class="content">
	<form action="<c:url value='/member/update'/>" method="post" id="joinForm" class="form-horizontal">
	<div class="form-group">
      <label class="control-label col-sm-2" for="userId">사용자 아이디</label>
      <div class="col-sm-4">
        <input type="text" name="userId" id="userId" value="${member['userId']}" ${empty member.userId ? "" : "readonly"} class="form-control" placeholder="<fmt:message key="MEMBER_ID"/>" required>
      </div>
    </div>
	<div class="form-group">
      <label class="control-label col-sm-2" for="password">비밀번호</label>
      <div class="col-sm-4">
        <input type="password" name="password" id="password" class="form-control" title="<fmt:message key='PASSWORD_TITLE'/>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="password_re">비밀번호 확인</label>
      <div class="col-sm-4">
        <input type="password" name="password_re" id="password_re" class="form-control" title="<fmt:message key='PASSWORD_RE_TITLE'/>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required>
      </div>
    </div>
	<div class="form-group">
      <label class="control-label col-sm-2" for="name">사용자 이름</label>
      <div class="col-sm-4">
        <input type="text" name="name" id="name" value="${member.name}" class="form-control" required>
      </div>
    </div>
	<div class="form-group">
      <label class="control-label col-sm-2" for="phone">전화번호</label>
      <div class="col-sm-4">
        <input type="text" name="phone" id="phone" value="${member.phone}" class="form-control" required>
      </div>
    </div>
	<div class="form-group">
      <label class="control-label col-sm-2" for="email">이메일</label>
      <div class="col-sm-4">
        <input type="text" name="email" id="email" value="${member.email}" class="form-control" required>
      </div>
    </div>
    <div class="form-group">
    	<div class="col-sm-offset-2 col-sm-8">
		<input type="submit" class="btn btn-info" value="저장">
		<input type="reset" class="btn btn-info" value="취소" id="cencle">
		</div>
	</div>
	</form>
	</div>
</div>
  
    </section><!-- End About Section -->
    <!-- 추후 기능들 만들고 난뒤 수정할 부분  -->

    <!-- ======= Facts Section ======= -->

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
  </script>
</body>
</html>
