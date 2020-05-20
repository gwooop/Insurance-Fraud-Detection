<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <li><a href="./">Home</a></li>
            <li>Our Services</li>
          </ol>
        </div>
      </div>
    </section><!-- End Our Services Section -->

    <!-- ======= 고객 정보 수정 Section ======= -->
    <section class="services">
      <c:forEach  var="cust" items="${custOne}">
        <div class="col-md-12">
          <div class="card card-user">
            <div class="card-header">
              <div class="card-title">
                <h5 id="selectcustId" style="display:inline;">${cust.custId}</h5>
                <h5 style="display:inline;">회원 정보</h5>
              </div>
            </div>
            <div class="card-body">
              <form action="<c:url value='/product/custUpdate/${sessionScope.custManagerId}/${cust.custId}'/> " method="POST">
                <div class="row">
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label id="sex">성별</label>
                      <select class="custom-select mr-sm-2" id="sex" name="sex" required="required">
                        <c:forEach var="selectSex" items="${sexList}">
                          <option value="${selectSex.getKey()}"<c:if test="${cust.age == selectSex.getKey()}">selected</c:if>>
                          ${selectSex.getValue() }
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label for="age">나이</label>
                      <select class="custom-select mr-sm-2" id="age" name="age" required="required">
                        <c:forEach var="selectAge" items="${ageList}">
				    	  <option value="${selectAge.getKey()}"<c:if test="${cust.age == selectAge.getKey()}">selected</c:if>>
						  ${selectAge.getValue() }
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-2 pl-1">
                    <div class="form-group">
                      <label for="resiCost">주택 가격</label>
                      <input type="number" class="form-control" value=${cust.resiCost}  id="resiCost"  name="resiCost" required="required">
                    </div>
                  </div>
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label for="resiTypeCode">거주TYPE</label>
                      <select class="custom-select mr-sm-2" id="resiTypeCode" name="resiTypeCode" required="required">
                     	<c:forEach var="selectResiType" items="${resiTypeList}">
                          <option value="${selectResiType.getKey()}"<c:if test="${cust.resiTypeCode == selectResiType.getKey()}">selected</c:if>>
						  ${selectResiType.getValue() }
                       	</c:forEach>	
                      </select>
                    </div>
                  </div>
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label for="occpGrp1">직업 </label>
                      <select class="custom-select mr-sm-2" id="occpGrp1" name="occpGrp1" required="required"> 
                      	<c:forEach var="selectOcci" items="${occiList}">
                       	  <option value="${selectOcci.getKey()}"<c:if test="${cust.occpGrp1 == selectOcci.getKey()}">selected</c:if>>
						  ${selectOcci.getValue() }
                        </c:forEach>			
                      </select>
                    </div>
                  </div>
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label for="ctpr">지역</label>
                      <select class="custom-select mr-sm-2" id="ctpr" name="ctpr" required="required">
                       	<c:forEach var="selectCptr" items="${cptrList}">
                       	  <option value="${selectCptr.getKey()}"<c:if test="${cust.ctpr == selectCptr.getKey()}">selected</c:if>>
						  ${selectCptr.getValue() }
                        </c:forEach>
      				  </select>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label>납입총보험료</label>
                      <input type="number" class="form-control" value=${cust.totalPrem} id="totalPrem" name="totalPrem" required="required">
                    </div>
                  </div>
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label id="weddYn">결혼여부</label>
                      <select class="custom-select mr-sm-2" id="weddYns" name="weddYn" required="required">
                       	<c:forEach var="selectWedd" items="${weddList}">
                       	  <option value="${selectWedd.getKey()}"<c:if test="${cust.weddYn == selectWedd.getKey()}">selected</c:if>>
						  ${selectWedd.getValue() }
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label for="mateOccpGrp1">배우자 직업</label>
                      <select class="custom-select mr-sm-2" id="mateOccpGrp1" name="mateOccpGrp1" required="required"> 
                       	<c:forEach var="selectMateOcci" items="${mateOcciList}">
                       	  <option value="${selectMateOcci.getKey()}"<c:if test="${cust.mateOccpGrp1 == selectMateOcci.getKey()}">selected</c:if>>
						  ${selectMateOcci.getValue() }
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label for="chldCnt">자녀수</label>
                      <select class="custom-select mr-sm-2" id="chldCnt" name="chldCnt" required="required">
                       	<c:forEach var="selectChld" items="${chldList}">
                       	  <option value="${selectChld.getKey()}"<c:if test="${cust.chldCnt == selectChld.getKey()}">selected</c:if>>
						  ${selectChld.getValue() }
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label for="ltbnChldAge">막내 나이</label>
                      <select class="custom-select mr-sm-2" id="ltbnChldAge" name="ltbnChldAge" required="required">
                        <c:forEach var="selectLtbnChld" items="${ltbnChldList}">
                          <option value="${selectLtbnChld.getKey()}"<c:if test="${cust.ltbnChldAge == selectLtbnChld.getKey()}">selected</c:if>>
						  ${selectLtbnChld.getValue() }
                        </c:forEach>
                      </select>
                    </div>
                  </div>
               	  <div class="col-md-2 pl-1">
                    <div class="form-group">
                      <label for="maxPrm">최대 보험료</label>
                      <input type="number" class="form-control" value=${cust.maxPrm} id="maxPrm" name="maxPrm" required="required">
                    </div>
                  </div>  
                </div>
                <div class="row">
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label for="custIncm">고객추정소득</label>
                      <input type="number" class="form-control" value=${cust.custIncm} id="custIncm" name="custIncm" required="required">
                    </div>
                  </div>
                  <div class="col-md-2 px-1">
                    <div class="form-group">
                      <label for="rcbaseHshdIncm">추정가구소득1</label>
                      <input type="number" class="form-control" value=${cust.rcbaseHshdIncm} id="rcbaseHshdIncm" name="rcbaseHshdIncm" required="required">
                    </div>
                  </div>
                  <div class="col-md-2 pl-1">
                    <div class="form-group">
                      <label for="jpbaseHshdIncm">추정가구소득2</label>
                      <input type="number" class="form-control" id="jpbaseHshdIncm" name="jpbaseHshdIncm" value=${cust.jpbaseHshdIncm} required="required">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="update ml-auto mr-auto">
                    <button type="submit" ID="update_Btn" class="btn btn-outline-primary btn-round">확인</button>
                    <button type="button" id="back_Btn" class="custdeleteBtn btn btn-outline-danger btn-round" >취소</button>
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
      </c:forEach>
          
      <!-- CLAIM_DATA -->
      <div class="col-md-12">
        <div class="card card-body">
          <c:forEach  var="claim" items="${claimTotal}">
          	<div class="row">
			  <div class="back container">
          		<div align="center" class="col-md-14 pr-14">
          		  <div class="form-group">
          			<table class="table" border="1">
          			  <thead class="table-primary">
          				<tr>
          				  <td scope="col" align="center">고객 아이디</td>
          				  <td scope="col" align="center">증권 번호</td>
          				  <td scope="col" align="center">사고 구분</td>
          				  <td scope="col" align="center">청구사유코드</td>
          				  <td scope="col" align="center">유효입원/통원일수(일)</td>
          				  <td scope="col" align="center">병원코드</td>
          				  <td scope="col" align="center">담당의사면허번호</td>
          				  <td scope="col" align="center">유의병원여부</td>          					
          				</tr>
          			  </thead>
					  <tbody>
						<tr>
						  <td align="center">${claim.custId}</td>
						  <td align="center">${claim.polyNo}</td>
						  <td align="center">${claim.acciDvsn}</td>
						  <td align="center">${claim.dmndResnCode}</td>
						  <td align="center">${claim.vlidHospOtda}</td>
						  <td align="center">${claim.hospCode}</td>
						  <td align="center">${claim.chmeLiceNo}</td>
						  <td align="center">${claim.heedHospYn}</td>
						</tr>						
					  </tbody>
          			</table>
				  </div>
				</div>
			  </div>
			</div>
		  </c:forEach>
		  <!-- END CLAIM_DATA -->
		</div>
	  </div>
    </section>
    <!-- End 고객 정보 수정 Section -->
  </main>
  <!-- End #main -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
    <!-- 위 코드 고정 시키기   -->
  <script type="text/javascript">
  	document.getElementById('header').setAttribute('class', 'fixed-top')  	
  	
  	$("#back_Btn").on("click", function () {
  		var custId = $("#selectcustId").text();
  		var custManagerId = ${sessionScope.custManagerId}
  		
  		location.href = "<c:url value='/product/custManageServices/'/>" + custManagerId + "/" + custId;	
	});
  </script>
</body>
</html>