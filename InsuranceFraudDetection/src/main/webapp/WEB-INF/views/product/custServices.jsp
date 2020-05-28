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
    </section>
    <!-- End Our Services Section -->

    <!-- ======= 고객 정보 입력 Section ======= -->
    <section class="services">
      <div class="col-md-12">
        <div class="card card-user">
          <div class="card-header">
            <h5 class="card-title">기본 회원 정보 입력${message}</h5>
          </div>
          <div class="card-body">
            <form action="<c:url value='/product/custServices/${sessionScope.custManagerId}'/>"  method="POST">
              <div class="row">
                <div class="col-md-2 pr-1">
                  <div class="form-group">
                    <label id="sex">성별</label>
                    <select class="custom-select mr-sm-2" id="sex" name="sex" required="required">        
                      <option value="1">남</option>
                      <option value="2">여</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-2 pr-1">
                  <div class="form-group">
                    <label for="age">나이</label>
                    <select class="custom-select mr-sm-2" id="age" name="age" required="required">
                      <option value="0">0~9</option>
                      <option value="1">10~19</option>
                      <option value="2">20~29</option>
                      <option value="3">30~39</option>
                      <option value="4">40~49</option>
                      <option value="5">50~59</option>
                      <option value="6">60~69</option>
                      <option value="7">70~79</option>
                      <option value="8">80이상</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-2 pl-1">
                  <div class="form-group">
                    <label for="resiCost">주택 가격</label>
                    <input type="number" class="form-control" placeholder="거주지 가격" value=""  min="0" id="resiCost"  name="resiCost" required="required">
                  </div>
                </div>
                <div class="col-md-2 pr-1">
                  <div class="form-group">
                    <label for="resiTypeCode">RESI_TYPE_CODE</label>
                    <select class="custom-select mr-sm-2" id="resiTypeCode" name="resiTypeCode" required="required">
                      <option value="11">일반단독주택</option>
                      <option value="12">다가구단독주택</option>
                      <option value="13">영업겸용단독주택</option>
                      <option value="20">아파트</option>
                      <option value="30">연립다가구주택</option>
                      <option value="40">상가등 비거주용건물</option>
                      <option value="50">오피스텔</option>
                      <option value="60">숙박업소의 객실</option>
                      <option value="70">기숙사</option>
                      <option value="99">그외</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-2 pr-1">
                  <div class="form-group">
                    <label for="occpGrp1">직업 </label>
                    <select class="custom-select mr-sm-2" id="occpGrp1" name="occpGrp1" required="required"> 
                      <option value="사무직">사무직</option>
                      <option value="서비스">서비스</option>
                      <option value="자영업">자영업</option>
                      <option value="전문직">전문직</option>
                      <option value="제조업">제조업</option>
                      <option value="주부">주부</option>
                      <option value="기타">기타</option>
                      <option value="1차산업">1차산업</option>
                      <option value="n">없음</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-2 pr-1">
                  <div class="form-group">
                    <label for="ctpr">지역</label>
                    <select class="custom-select mr-sm-2" id="ctpr" name="ctpr" required="required">
                      <option value="서울">서울</option>
                      <option value="대구">대구</option>
                      <option value="충북">충북</option>
                      <option value="경기">경기</option>
                      <option value="광주">광주</option>
                      <option value="충남">충남</option>
                      <option value="전북">전북</option>
                      <option value="대구">대구</option>
                      <option value="부산">부산</option>
                      <option value="인천">인천</option>
                      <option value="울산">울산</option>
                      <option value="경남">경남</option>
                      <option value="전남">전남</option>
                      <option value="대전">대전</option>
                      <option value="강원">강원</option>
                      <option value="제주">제주</option>
                      <option value="세종">세종</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-2 pr-1">
                  <div class="form-group">
                    <label>납입총보험료</label>
                    <input type="number" min="0" class="form-control"  placeholder="" id="totalPrem" name="totalPrem" required="required">
                  </div>
                </div>
                <div class="col-md-2 pr-1">
                  <div class="form-group">
                    <label id="weddYn">결혼여부</label>
                    <select class="custom-select mr-sm-2" id="weddYns" name="weddYn" required="required">
                      <option value="Y">네</option>
                      <option value="N">아니요</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-2 pr-1">
                  <div class="form-group">
                    <label for="mateOccpGrp1">배우자 직업</label>
                    <select class="custom-select mr-sm-2" id="mateOccpGrp1" name="mateOccpGrp1" required="required"> 
                      <option value="사무직">사무직</option>
                      <option value="서비스">서비스</option>
                      <option value="자영업">자영업</option>
                      <option value="전문직">전문직</option>
                      <option value="제조업">제조업</option>
                      <option value="주부">주부</option>
                      <option value="기타">기타</option>
                      <option value="1차산업">1차산업</option>
                      <option value="n">없음</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-2 pr-1">
                  <div class="form-group">
                    <label for="chldCnt">자녀수</label>
                    <select class="custom-select mr-sm-2" id="chldCnt" name="chldCnt" required="required">
                      <option value="0">없음</option>
                      <option value="1">1명</option>
                      <option value="2">2명</option>
                      <option value="3">3명</option>
                      <option value="4">4명</option>
                      <option value="5">5명</option>
                      <option value="6">6명이상</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-2 pr-1">
                  <div class="form-group">
                    <label for="ltbnChldAge">막내 나이</label>
                    <select class="custom-select mr-sm-2" id="ltbnChldAge" name="ltbnChldAge" required="required">
                      <option value="0">0~9</option>
                      <option value="1">10~19</option>
                      <option value="2">20~29</option>
                      <option value="3">30대이상</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-2 pl-1">
                  <div class="form-group">
                    <label for="maxPrm">최대 보험료</label>
                    <input type="number"  id="maxPrm" name="maxPrm" min="0"class="form-control" placeholder="" value="" required="required">
                  </div>
                </div>  
              </div>
              <div class="row">
                <div class="col-md-2 pr-1">
                  <div class="form-group">
                    <label for="custIncm">고객추정소득</label>
                    <input type="number" id="custIncm" name="custIncm" min="0" class="form-control"  placeholder="" value="" required="required">
                  </div>
                </div>
                <div class="col-md-2 px-1">
                  <div class="form-group">
                    <label for="rcbaseHshdIncm">추정가구소득1</label>
                    <input type="number"  id="rcbaseHshdIncm" name="rcbaseHshdIncm" min="0" class="form-control" placeholder="" value="" required="required">
                  </div>
                </div>
                <div class="col-md-2 pl-1">
                  <div class="form-group">
                    <label for="jpbaseHshdIncm">추정가구소득2</label>
                    <input type="number"  id="jpbaseHshdIncm" name="jpbaseHshdIncm" min="0" class="form-control" placeholder="" value="" required="required">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="update ml-auto mr-auto">
                  <button type="submit" class="btn btn-success btn-round">제출하기</button>
                  <button type="reset" class="btn btn-primary btn-round">리셋</button>
                </div>
              </div>
            </form>
<%-- 파일로 고객 정보 저장하는 form            	           
  			<form>
              <div class="form-group">
                <label for="exampleFormControlFile1">파일 입력해서 가져오기</label>
                <input type="file" class="form-control-file" id="exampleFormControlFile1">
              </div>
           	</form>
--%>
          </div>
        </div>
      </div>    
    </section>
    <!-- End 고객 정보 입력 Section -->
  </main><!-- End #main -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
    <!-- 위 코드 고정 시키기   -->
  <script type="text/javascript">
     document.getElementById('header').setAttribute('class', 'fixed-top');
    $("#test").on("click",function(){
        var cust= $("#restTest").value;
          console.log(cust) 
      $.ajax({
         url:"<c:url value='/restTest/22427'/>",
         type:"GET",
         data:{},
         success:function(data){
            console.log(data);
         }
      })  
   })
   
   $("#getCustList").on("click", function(){
      var custManagerId = ${sessionScope.custManagerId}
      $.ajax({
         url:"<c:url value='/product/list/'/>"+custManagerId,
         type:"GET",
         data:{},
         success:function(data){
            console.log(data);
            $("#custBody").empty()
            
            
            for(i =0; i <data.length; i++){
                  var applyHTML =$("<tr scope='row'>"+
                        "<td>"+ data[i].custId+"</td>"+
                        "<td>"+"<button class='btn btn-info'>등록</button>" +"</td>"+
                        "<td>"+"<button class='btn btn-info'>탐색하기</button>" +"</td>"+
                        "</tr>")
            $("#custBody").append(applyHTML);            
            }   
         }
      })
   })
   </script>
</body>
</html>