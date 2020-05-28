<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>

  <main id="main">

    <!-- ======= About Us Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>관리자 페이지</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>About Us</li>
          </ol>
        </div>

      </div>
    </section><!-- End About Us Section -->
<%
    String name = (String)session.getAttribute("name");
%>
    <!-- ======= About Section ======= -->
    <section class="about" data-aos="fade-up">
<div class="container">
	<div class="pg-opt">
        <div class="row">
            <div class="col-md-6 pc">
                <h2><a href="<c:url value='#'/>"><%=name %></a></h2>
            </div>
            <div class="col-md-6">
                <ol class="breadcrumb">
                    <li>Member</li>
                    <li class="active"><a href="<c:url value='#'/>">List</a></li>
                </ol>
            </div>
        </div>
 	</div>
<table class="table">

  <thead class="thead-dark">
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
  <tbody>
	<c:forEach var="member" items="${memberList}">
		<tr>
			<td>${member.userNum}</td>
			<td>${member.userId}</td>
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
			<td><button class="btn btn-dark">삭제</button></td>
			</c:if>
			<c:if test="${member.delCount==1}">
			<td><button class="btn btn-info">복구</button></td>
			</c:if>
		</tr>
	</c:forEach>
  </tbody>
</table>

    </section><!-- End About Section -->

    <!-- ======= Facts Section ======= -->
    <section class="facts section-bg" data-aos="fade-up">
      <div class="container">

        <div class="row counters">

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up"></span>
            <p>Clients</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">521</span>
            <p>Projects</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">1,463</span>
            <p>Hours Of Support</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">15</span>
            <p>Hard Workers</p>
          </div>

        </div>

      </div>
    </section><!-- End Facts Section -->

    <!-- ======= Our Skills Section ======= -->
    <section class="skills" data-aos="fade-up">
     
    </section><!-- End Our Skills Section -->

    <!-- ======= Tetstimonials Section ======= -->
    <section class="testimonials" data-aos="fade-up">

    </section><!-- End Ttstimonials Section -->

  </main><!-- End #main -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
  
  <!-- 위로 올라가는 화살표  -->
  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
  
  <!-- 위 코드 고정 시키기   -->
  <script type="text/javascript">
  	document.getElementById('header').setAttribute('class', 'fixed-top')
 
  </script>
</body>

</html>