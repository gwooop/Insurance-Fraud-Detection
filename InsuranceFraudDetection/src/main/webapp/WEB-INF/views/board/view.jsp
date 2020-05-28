<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/board" />
<html lang="en">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
  <main id="main">


<!-- ======= Board Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>Q & A</h2>

          <ol>
            <li><a href="./">Home</a></li>
            <li>Q & A</li>
          </ol>
        </div>

      </div>
    </section>
<!-- End Board Section -->

<!-- ======= Board Detail View Section ======= -->
<section class="blog" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500" style="margin-bottom:4%">
     <div class="container" style="margin-bottom:10px">
        <div class="pg-opt">
	        <div class="row">
	            <div class="col-md-6 pc">
	                <h2>Q&A 내용
		            <c:if test="${empty name}">
		            <br><small style="color:red; font-size:0.6em"><fmt:message key="LOGIN"/></small>
		            </c:if>
		            </h2>
	            </div>
	            <div class="col-md-6">
	                <ol class="breadcrumb">
	                    <li><fmt:message key="BOARD"/> 게시판 검색</li>
	                </ol>
	            </div>
	        </div>
	    </div>
    </div>
    
   <div class="container">
      <div class="row">
	     <div class="col-lg-12 entries">
           <article class="entry entry-single">
             <h2 class="entry-title">
                <a href='<c:url value="/board/${board.boardId}"/>'>${board.title}</a>
             </h2>
             
            <div class="entry-meta">
            
                <ul>
				  <!-- <b>6</b> 글번호-->
                  <li class="d-flex align-items-center">
                  	  <i class="icofont-user"></i><fmt:message key="WRITER"/></li>
                  <li class="d-flex align-items-center">
	                  <i class="icofont-wall-clock"></i>
	                  <fmt:message key="WRITE_DATE"/></li>
                  <li class="d-flex align-items-center">
                  	  <i class="icofont-comment"></i>12 Comments</li>
                  <li class="d-flex align-items-center">
                  	<i class="icofont-eye-alt"></i>${board.readCount}</li>
                  	<!-- 조회수 아이콘 추가하기 --> 
                </ul>
              </div>
			<div class="entry-content">
				<p class="mb20">${board.content}</p>
			</div>
           </article>
             <table style="align:center; text-align:center; float:center;">
             <tr>
				<td colspan=2 align="right">		
				<a href='<c:url value="/board/cat/${categoryId}"/>'><button type="button" class="btn btn-info"><fmt:message key="BOARD_LIST"/></button></a>
				<a href='<c:url value="/board/write/${categoryId}"/>'><button type="button" class="btn btn-info"><fmt:message key="WRITE_NEW_ARTICLE"/></button></a>
				<a href='<c:url value="/board/reply/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="REPLY"/></button></a>
				<a href='<c:url value="/board/update/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="UPDATE"/></button></a>
				<a href='<c:url value="/board/delete/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="DELETE"/></button></a>
				</td>
			</tr>
			</table>
              </div>
          </div>
    </div>    
</section>

<!--     ======= Map Section =======
    <section class="map mt-2">
      <div class="container-fluid p-0">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3024.2219901290355!2d-74.00369368400567!3d40.71312937933185!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a23e28c1191%3A0x49f75d3281df052a!2s150%20Park%20Row%2C%20New%20York%2C%20NY%2010007%2C%20USA!5e0!3m2!1sen!2sbg!4v1579767901424!5m2!1sen!2sbg" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
      </div>
    </section>End Map Section -->

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