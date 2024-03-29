<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/board" />
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags" %>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<div class="container">
	<div class="pg-opt">
        <div class="row">
            <div class="col-md-6 pc">
                <h2><fmt:message key="BOARD_LIST"/></h2>
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
		<form action="<c:url value='/board/search/1'/>" method="get">
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
			<td>${board.boardId}</td>
			<td class="pc">${board.writer}</td>

			<td>
				<a href='<c:url value="/board/${board.boardId}" />'>${board.title}</a>
			</td>
			<td class="pc"><fmt:formatDate value="${board.writeDate}" pattern="YYYY-MM-dd"/></td>
			<td class="pc">${board.readCount}</td>
		</tr>
		</c:forEach>
		</table>

		<table class="table">
		<tr>
			<td align="left">
				<jk:spaging keyword="${keyword}" totalPageCount="${totalPageCount}" nowPage="${page}"/>
			</td>
			<td align="right">
				&nbsp;
			</td>
		</tr>
		</table>
	</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>
