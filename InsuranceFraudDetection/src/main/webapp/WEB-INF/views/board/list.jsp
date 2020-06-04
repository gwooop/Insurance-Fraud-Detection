<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/board" />
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags" %>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<main id="main">
<!-- ======= Board List Section ======= -->
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
<!-- End Board List Section -->

<section class="blog" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500" style="margin-bottom:4%">
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
		                <li><fmt:message key="BOARD"/> 게시판 검색</li>
		            </ol>
		        </div>
	        </div>
	    </div>        
	${message}
	<div class="content">
	    <table class="table table-hover table-bordered">
		<thead>
		<tr>
			<!-- td class="pc"><fmt:message key="NO"/></td-->
			<td><fmt:message key="BOARD_ID"/></td>
			<td class="pc"><fmt:message key="WRITER"/></td>
			<td><fmt:message key="SUBJECT"/></td>
			<td class="pc"><fmt:message key="WRITE_DATE"/></td>
			<td class="pc"><fmt:message key="READ_COUNT"/></td>
			<!--td class="pc"><fmt:message key="FILE"/></td-->
		</tr>
		</thead>
		<c:set var="seq" value="${(page-1)*10}" scope="page" />
		<c:forEach var="board" items="${boardList}">
		<tr>
			<c:set var="seq" value="${seq + 1}" scope="page"/>
			<!-- td class="pc">${seq}</td-->
			<td>${board.boardId}<!-- (${board.categoryId})--></td>
			<td class="pc">${board.writer}</td>
			<td>
			<jk:reply replynum="${board.replyNumber}" replystep="${board.replyStep}"/>
			<a href='<c:url value="/board/${board.boardId}"/>'>${board.title}</a>
			</td>
			<td class="pc"><fmt:formatDate value="${board.writeDate}" pattern="YYYY-MM-dd"/></td>
			<td class="pc">${board.readCount}</td>
			<!-- td class="pc"><span class="glyphicon glyphicon-file"></span-->
		</tr>
		</c:forEach>
		</table>

		<table class="table">
		<tr>
			<td align="left">
				<jk:paging categoryId="${categoryId}" totalPageCount="${totalPageCount}" nowPage="${page}"/>
			</td>
			<c:if test="${sessionScope.userId == 'admin' }">
			<td align="right">
				<a href='<c:url value="/board/write/${categoryId}"/>'><button type="button" class="btn btn-info">새 글쓰기</button></a>
			</td>
			</c:if>
		</tr>
		</table>
	</div>
</div>
</section>
</main>
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
