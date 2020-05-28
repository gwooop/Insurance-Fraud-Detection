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
            <li>QnA</li>
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
                      <h2><fmt:message key="INSERT_USER_INFO"/></h2>
                  </div>
                  <div class="col-md-6">
                      <ol>
                          
                      </ol>
                  </div>
              </div>
          </div>
        <div class="content">
        <form action="<c:url value='/member/insert'/>" method="post" id="joinForm" class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-sm-2" for="userId">사용자 아이디</label>
            <div class="col-sm-4">
              <input type="text" name="userId" id="userId" value="${member['userId']}" ${empty member.userId ? "" : "readonly"} title="USER_TITLE" pattern="\w+" class="form-control" placeholder="" required></input> 
            </div>
          </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="password"><fmt:message key="MEMBER_PW"/></label>
            <div class="col-sm-4">
              <input type="password" name="password" id="password" value="${member.password}" class="form-control" title="<fmt:message key='PASSWORD_TITLE'/>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="password_re"><fmt:message key="MEMBER_PW_RE"/></label>
            <div class="col-sm-4">
              <input type="password" name="password_re" id="password_re" class="form-control" title="<fmt:message key='PASSWORD_RE_TITLE'/>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required>
            </div>
          </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="name"><fmt:message key="MEMBER_NAME"/></label>
            <div class="col-sm-4">
              <input type="text" name="name" id="name" value="${member.name}" class="form-control" required>
            </div>
          </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="phone"><fmt:message key="MEMBER_PHONE"/></label>
            <div class="col-sm-6">
              <input type="text" name="phone" id="phone" value="${member.phone}" class="form-control" required>
            </div>
          </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="email"><fmt:message key="MEMBER_EMAIL"/></label>
            <div class="col-sm-8">
              <input type="email" name="email" id="email" value="${member.address}" class="form-control" required>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="birth">생일</label>
            <div class="col-sm-2">
              <input type="date" name="birth" id="birth" value="${member.birth}" class="form-control" required>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-8">
          <input type="submit" class="btn btn-info" value="저장">
          <input type="reset" class="btn btn-info" value="취소">
          </div>
        </div>
        </form>
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
 
<c:set var="memberList" value="${memberList}"/>
  </main><!-- End #main -->	
<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
  <script type="text/javascript">
    
  	document.getElementById('header').setAttribute('class', 'fixed-top')
  	// 로그인 js 파일

	document.addEventListener("DOMContentLoaded", function() {
    // JavaScript form validation
    var checkPassword = function(str)
    {
      var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$/;
      return re.test(str);
    };

    var checkForm = function(e)
    {
      if(this.username.value == "") {
        alert("Error: 아이디를 입력하지 않았습니다.");
        this.username.focus();
        e.preventDefault(); // equivalent to return false
        return;
      }
      re = /^\w+$/;
      if(!re.test(this.username.value)) {
        alert("Error: 아이디는 문자, 숫자, 언더스코어만 사용이 가능 합니다!");
        this.username.focus();
        e.preventDefault();
        return;
      }
      if(this.pwd1.value != "" && this.pwd1.value == this.pwd2.value) {
        if(!checkPassword(this.pwd1.value)) {
          alert("The password you have entered is not valid!");
          this.pwd1.focus();
          e.preventDefault();
          return;
        }
      } else {
        alert("Error: Please check that you've entered and confirmed your password!");
        this.pwd1.focus();
        e.preventDefault();
        return;
      }
      alert("Both username and password are VALID!");
    };

    var myForm = document.getElementById("joinForm");
    myForm.addEventListener("submit", checkForm, true);

    // HTML5 form validation

    var supports_input_validity = function()
    {
      var i = document.createElement("input");
      return "setCustomValidity" in i;
    }

    if(supports_input_validity()) {
      var usernameInput = document.getElementById("userid");
      usernameInput.setCustomValidity(usernameInput.title);

      var pwd1Input = document.getElementById("password");
      pwd1Input.setCustomValidity(pwd1Input.title);

      var pwd2Input = document.getElementById("password_re");

      // input key handlers
	  usernameInput.onchange = function(){
    	  alert("내용이 바꼇습니다.");
      }
      usernameInput.addEventListener("keyup", function() {
        usernameInput.setCustomValidity(this.validity.patternMismatch ? usernameInput.title : "");
      }, false);

      pwd1Input.addEventListener("keyup", function() {
        this.setCustomValidity(this.validity.patternMismatch ? pwd1Input.title : "");
        if(this.checkValidity()) {
          pwd2Input.pattern = this.value;
          pwd2Input.setCustomValidity(pwd2Input.title);
        } else {
          pwd2Input.pattern = this.pattern;
          pwd2Input.setCustomValidity("");
        }
      }, false);

      pwd2Input.addEventListener("keyup", function() {
        this.setCustomValidity(this.validity.patternMismatch ? pwd2Input.title : "");
      }, false);

    }

  }, false);
  	
/*  document.getElementById('userId').onchange = function () {
	 <c:forEach items="${memberList}" var="member">
		${member.userId}
	 </c:forEach> 
	
} */

/*  document.getElementById('userId').onfocus = function(){

 }  */
 


  </script>
</body>
</html>
