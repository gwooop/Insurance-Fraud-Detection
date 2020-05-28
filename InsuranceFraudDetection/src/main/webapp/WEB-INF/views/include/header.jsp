<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


  <!-- ======= Header의 네비게이션 바  ======= -->
  
  <!--header-transparent 를 처리 해야댐   -->
  <header id="header" class="fixed-top header-transparent">
    <div class="container">

      <div class="logo float-left">
        <h1 class="text-light"><a href="<c:url value='/'/>"><span>코송이들</span></a></h1>
      </div>
      <nav class="nav-menu float-right d-none d-lg-block">
        <ul>
          <li class="active"><a href="<c:url value='/'/>">홈으로 가기</a></li>
          <li><a href="<c:url value='/statistic'/>">statistic</a></li>
          <c:if test="${not empty sessionScope.userId }">
          <li><a href="<c:url value='/product/services/${sessionScope.custManagerId}/1'/>">services</a></li>
          </c:if>
          <c:if test="${empty sessionScope.userId }">
          <li><a href="<c:url value='/product/services'/>" >services</a></li>
          </c:if>
          <li><a href="<c:url value='/board/cat/7'/>">board</a></li>
          <li><a href="<c:url value='/team'/>">team</a></li>
          <c:if test="${empty sessionScope.userId}">
          <li><a href="<c:url value='/member/login'/>">로그인</a></li>
          </c:if>
          <c:if test="${not empty sessionScope.userId}">
          <li><a href="<c:url value='/member/login'/>">My Page</a></li>
          </c:if>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
  
