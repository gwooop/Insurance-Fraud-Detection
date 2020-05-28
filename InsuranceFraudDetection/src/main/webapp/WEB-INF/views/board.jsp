<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %> q
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
          <h2>게시판</h2>
          <ol>
            <li><a href="ins/">Home</a></li>
            <li>게시판</li>
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
		            <h2><fmt:message key="BOARD_LIST"/> 
		            <c:if test="${empty name}">
		            <small style="color:red;"><fmt:message key="LOGIN"/></small>
		            </c:if>
		            </h2>
		        </div>
		        <div class="col-md-6">
		            <ol class="breadcrumb">
		                <li><fmt:message key="BOARD"/></li>
		                <li class="active"><fmt:message key="BOARD_LIST"/></li>
		            </ol>
		        </div>
		    </div>
	    </div>
		${message}
		<div class="content">
			<form action="<c:url value='/board/search'/>" method="get">
				<div class="pull-right" style="margin-bottom: 5px;">
				<div class="col-xs-9">
			        <input type="text" name="keyword" class="form-control">
			    </div>
			        <input type="submit" class="btn btn-warning" value="<fmt:message key="SEARCH"/>">
				</div>
			</form>
		    <table class="table table-hover table-bordered">
			<thead>
			<tr>
				<td><fmt:message key="BOARD_ID"/></td>
				<td class="pc"><fmt:message key="WRITER"/></td>
				<td><fmt:message key="SUBJECT"/></td>
				<td class="pc"><fmt:message key="WRITE_DATE"/></td>
				<td class="pc"><fmt:message key="READ_COUNT"/></td>
			</tr>
			</thead>
			<c:set var="seq" value="${(page-1)*10}" scope="page" />
			<c:forEach var="board" items="${boardList}">
			<tr>
				<c:set var="seq" value="${seq + 1}" scope="page"/>
				<td>${board.boardId}<!-- (${board.categoryId})--></td>
				<td class="pc">${board.writer}</td>
				<td>
				<jk:reply replynum="${board.replyNumber}" replystep="${board.replyStep}"/>
				<a href='<c:url value="/board/${board.boardId}"/>'>${board.title}</a>
				</td>
				<td class="pc"><fmt:formatDate value="${board.writeDate}" pattern="YYYY-MM-dd"/></td>
				<td class="pc">${board.readCount}</td>
			</tr>
			</c:forEach>
			</table>
	
			<table class="table">
			<tr>
				<td align="left">
					<jk:paging categoryId="${categoryId}" totalPageCount="${totalPageCount}" nowPage="${page}"/>
				</td>
				<td align="right">
					<a href='<c:url value="/board/write/${categoryId}"/>'><button type="button" class="btn btn-info"><fmt:message key="WRITE_NEW_ARTICLE"/></button></a>
				</td>
			</tr>
			</table>
		</div>
	</div> 
  
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
  </script>
</body>
</html>
