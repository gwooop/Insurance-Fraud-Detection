<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


  <!-- ======= Header의 네비게이션 바  ======= -->
  
  <!--header-transparent 를 처리 해야댐   -->
  <header id="header" class="fixed-top header-transparent">
    <div class="container">

      <div class="logo float-left">
        <h1 class="text-light"><a href="<c:url value='/'/>"><span>코송이들</span></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>
      <nav class="nav-menu float-right d-none d-lg-block">
        <ul>
          <li class="active"><a href="<c:url value='/'/>">홈으로 가기</a></li>
          <li><a href="<c:url value='/about'/>">about</a></li>
          <li><a href="<c:url value='/blog'/>">blog</a></li>
          <li><a href="<c:url value='/board/cat/1'/>">board</a></li>
          <li><a href="<c:url value='/portfolio'/>">Portfolio</a></li>
          <li><a href="<c:url value='/team'/>">team</a></li>
          <c:if test="${not empty sessionScope.userId }">
          <li><a href="<c:url value='/product/services/${sessionScope.custManagerId}'/>">services</a></li>
          </c:if>
          <c:if test="${empty sessionScope.userId }">
          <li><a href="<c:url value='/product/services'/>">services</a></li>
          </c:if>
          <!-- <li class="drop-down"><a href="<c:url value='/'/>">뀨</a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="drop-down"><a href="#">Drop Down 2</a>
                <ul>
                  <li><a href="<c:url value='/'/>">Deep Drop Down 1</a></li>
                  <li><a href="<c:url value='/'/>">Deep Drop Down 2</a></li>
                  <li><a href="<c:url value='/'/>">Deep Drop Down 3</a></li>
                  <li><a href="<c:url value='/'/>">Deep Drop Down 4</a></li>
                  <li><a href="<c:url value='/'/>">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="<c:url value='/'/>">Drop Down 3</a></li>
              <li><a href="<c:url value='/'/>">Drop Down 4</a></li>
              <li><a href="<c:url value='/'/>">Drop Down 5</a></li>
            </ul>
          
          </li>
           -->
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