<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>

<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>404 HTML Template by Colorlib</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">

	<!-- Custom stlylesheet -->
	<link href="<c:url value='/assets/css/errorStyle.css'/>" rel="stylesheet">
	

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->



<body>
	<div id="notfound">
		<div class="notfound" style="background:<c:url value="/assets/img/comments-2.jpg"/>">
			<div class="notfound-404">
				<h1>4<span>0</span>4</h1>
				<h4>${message}</h4>
			</div>
		
			<form class="notfound-search">
				<input type="text" placeholder="Search...">
				<button type="button"><span></span></button>
			</form>
		</div>
	</div>
  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
    <script type="text/javascript">
  	document.getElementById('header').setAttribute('class', 'fixed-top')
  </script>
    
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->


</html>