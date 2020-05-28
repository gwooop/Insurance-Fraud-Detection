<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>

  <main id="main">

    <!-- ======= Our Services Section ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>Our Services</h2>
          <ol>
            <li><a href="./services/${sessionScope.custManagerId }">Services</a></li>
            <li>Our Services</li>
          </ol>
        </div>
      </div>
    </section><!-- End Our Services Section -->

    <!-- ======= 고객 청구 정보 입력 Section ======= -->
    <section class="services">
    	<div class="col-md-12">
            <div class="card card-user">
              <div class="card-header">
                <h5 class="card-title">회원 청구 정보 입력</h5>
              </div>
              <div class="card-body">
                <form action="<c:url value='/product/claimServices/${sessionScope.custManagerId}/${custId}'/>"  method="POST">
                  <div class="row">
                     <div class="col-md-2 pl-1">
                      <div class="form-group">
                        <label for="custId">고객 아이디</label>
                        <input type="number" class="form-control" placeholder="고객 아이디" value=${custId} min="0" id="custId"  name="custId" >
                      </div>
                     </div>
                     <div class="col-md-2 pl-1">
                      <div class="form-group">	
                        <label for="polyNo">증권 번호</label>
                        <input type="number" class="form-control" placeholder="증권 번호" value=""  min="0" id="polyNo" name="polyNo" required="required">
                      </div>
                     </div>
                     <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label for="acciDvsn">사고 구분</label>
                        <select class="custom-select mr-sm-2" id="acciDvsn" name="acciDvsn">
	                       	<option value="1">재해</option>
	                       	<option value="2">교통사고</option>
	                       	<option value="3">질병</option>
                        </select>
                      </div>
                     </div>
                     <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label for="dmndResnCode">청구사유코드</label>
                        <select class="custom-select mr-sm-2" id="dmndResnCode" name="dmndResnCode">
	                        <option value="1">사망</option>
	                        <option value="2">입원</option>
	                        <option value="3">통원</option>
	                        <option value="4">장해</option>
	                        <option value="5">수술</option>
	                        <option value="6">진단</option>
	                        <option value="7" id="disoption1">치료</option>
	                        <option value="9" id="disoption2">해지/무효</option>
	                    </select>
	                  </div>
	                 </div>
	                 <div class="col-md-2 pl-1">
                      <div class="form-group">
                        <label for="vlidHospOtda">유효입원/통원일수</label>
                        <input type="number" class="form-control" placeholder="유효입원/통원일수" value="" min="0" id="vlidHospOtda"  name="vlidHospOtda" required="required">
                      </div>
                     </div>
                     <div class="col-md-2 pl-1">
                      <div class="form-group">
                        <label for="hospCode">병원코드</label>
                        <input type="number" class="form-control" placeholder="병원코드" value="" min="0" id="hospCode"  name="hospCode" required="required">
                      </div>
                     </div>
                     <div class="col-md-2 pl-1">
                      <div class="form-group">
                        <label for="chmeLiceNo">담당의사면허번호</label>
                        <input type="number" class="form-control" placeholder="담당의사면허번호" value="" min="0" id="chmeLiceNo"  name="chmeLiceNo" required="required">
                      </div>
                     </div>
                     <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label id="heedHospYn">유의병원여부</label>
                           <select class="custom-select mr-sm-2" id="heedHospYn" name="heedHospYn">
                           <option value="Y">네</option>
                           <option value="N">아니요</option>
                         </select>
                      </div>
                     </div>
                  </div>
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                      <button type="submit" class="btn btn-success btn-round" id="submitBtn">제출하기</button>
                      <button type="reset" class="btn btn-primary btn-round">리셋</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
		</div>    
    </section>
    <!-- End 고객 청구 정보 입력 Section -->
  </main>
  <!-- End #main -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
    <!-- 위 코드 고정 시키기   -->
  <script type="text/javascript">
     document.getElementById('header').setAttribute('class', 'fixed-top');
	$('#acciDvsn').on("change", function(){
	    var select = document.getElementById("acciDvsn");
	    var option_value = select.options[select.selectedIndex].value;
		if(option_value == 2){
			$('#disoption1').prop('disabled', true)
			$('#disoption2').prop('disabled', true)
			var dmndvalue = $("#dmndResnCode").val()		
			console.log(typeof(dmndvalue));
			console.log(dmndvalue)
			if(dmndvalue === null){
				 
				alert("치료, 해지/무효는 입력할 수 없습니다.");
				$('#acciDvsn').val(1).prop('seleted', true);
				return false 
			}
			
		}else{
			$('#disoption1').prop('disabled', false)
			$('#disoption2').prop('disabled', false)
		}
		
	})		
 </script>
</body>

</html>