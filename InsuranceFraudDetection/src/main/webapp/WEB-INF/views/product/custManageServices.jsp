	<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<style>
.pagination {
   justify-content: center;
}
</style>
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

    <!-- ======= Services Section ======= -->
    <section class="services">
      <!-- 고객 정보 확인 폼 -->
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
              <form action="<c:url value='/product/custManageServices/${sessionScope.custManagerId}/${custId}'/>" name="removefrm" method="POST">
                <div class="row">
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label id="sex">성별</label>
                      <select class="custom-select mr-sm-2" id="sex" name="sex" required="required"
                      onFocus='this.initialSelect = this.selectedIndex;' onChange='this.selectedIndex = this.initialSelect;'>
                        <c:forEach var="selectSex" items="${sexList}">
                          <option value="${cust.age}"<c:if test="${cust.age == selectSex.getKey()}">selected</c:if>>
                          ${selectSex.getValue() }
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-2 pr-1">
       				<div class="form-group">
   				  	  <label for="age">나이</label>
       				  <select class="custom-select mr-sm-2" id="age" name="age" required="required"
       				  onFocus='this.initialSelect = this.selectedIndex;' onChange='this.selectedIndex = this.initialSelect;'>
       				  	<c:forEach var="selectAge" items="${ageList}">
						  <option value="${cust.age}"<c:if test="${cust.age == selectAge.getKey()}">selected</c:if>>
						  ${selectAge.getValue() }
       					</c:forEach>
   			    	  </select>
         			</div>
        		  </div>
        		  <div class="col-md-2 pl-1">
        			<div class="form-group">
           			  <label for="resiCost">주택 가격</label>
           			  <input type="number" class="form-control" value=${cust.resiCost} id="resiCost"  name="resiCost" readonly="readonly">
         			</div>
       			  </div>
       			  <div class="col-md-2 pr-1">
       				<div class="form-group">
         			  <label for="resiTypeCode">거주TYPE</label>
            		  <select class="custom-select mr-sm-2" id="resiTypeCode" name="resiTypeCode" required="required"
            		  onFocus='this.initialSelect = this.selectedIndex;' onChange='this.selectedIndex = this.initialSelect;'>
            			<c:forEach var="selectResiType" items="${resiTypeList}">
            			  <option value="${cust.resiTypeCode}"<c:if test="${cust.resiTypeCode == selectResiType.getKey()}">selected</c:if>>
						  ${selectResiType.getValue() }
            			</c:forEach>								
            		  </select>
         			</div>
         		  </div>
       			  <div class="col-md-2 pr-1">
         			<div class="form-group">
           			  <label for="occpGrp1">직업 </label>
              		  <select class="custom-select mr-sm-2" id="occpGrp1" name="occpGrp1" required="required"
              		  onFocus='this.initialSelect = this.selectedIndex;' onChange='this.selectedIndex = this.initialSelect;'>
              		    <c:forEach var="selectOcci" items="${occiList}">
            			  <option value="${cust.occpGrp1}"<c:if test="${cust.occpGrp1 == selectOcci.getKey()}">selected</c:if>>
						  ${selectOcci.getValue() }
            			</c:forEach>			
            		  </select>
         			</div>
         		  </div>
                  <div class="col-md-2 pr-1">
					<div class="form-group">
					  <label for="ctpr">지역</label>
                      <select class="custom-select mr-sm-2" id="ctpr" name="ctpr" required="required"
                      onFocus='this.initialSelect = this.selectedIndex;' onChange='this.selectedIndex = this.initialSelect;'>
                        <c:forEach var="selectCptr" items="${cptrList}">
                          <option value="${cust.ctpr}"<c:if test="${cust.ctpr == selectCptr.getKey()}">selected</c:if>>
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
                      <input type="number" class="form-control" value="${cust.totalPrem}" id="totalPrem" name="totalPrem" readonly="readonly">
                    </div>
                  </div>
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label id="weddYn">결혼여부</label>
                      <select class="custom-select mr-sm-2" id="weddYn" name="weddYn" required="required"
                      onFocus='this.initialSelect = this.selectedIndex;' onChange='this.selectedIndex = this.initialSelect;'>
                        <c:forEach var="selectWedd" items="${weddList}">
                          <option value="${cust.weddYn}"<c:if test="${cust.weddYn == selectWedd.getKey()}">selected</c:if>>
						  ${selectWedd.getValue() }
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label for="mateOccpGrp1">배우자 직업</label>
                      <select class="custom-select mr-sm-2" id="mateOccpGrp1" name="mateOccpGrp1" required="required"
                      onFocus='this.initialSelect = this.selectedIndex;' onChange='this.selectedIndex = this.initialSelect;'> 
                        <c:forEach var="selectMateOcci" items="${mateOcciList}">
                          <option value="${cust.mateOccpGrp1}"<c:if test="${cust.mateOccpGrp1 == selectMateOcci.getKey()}">selected</c:if>>
						  ${selectMateOcci.getValue() }
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label for="chldCnt">자녀수</label>
                      <select class="custom-select mr-sm-2" id="chldCnt" name="chldCnt" required="required"
                      onFocus='this.initialSelect = this.selectedIndex;' onChange='this.selectedIndex = this.initialSelect;'>
                       	<c:forEach var="selectChld" items="${chldList}">
                          <option value="${cust.chldCnt}"<c:if test="${cust.chldCnt == selectChld.getKey()}">selected</c:if>>
						  ${selectChld.getValue() }
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label for="ltbnChldAge">막내 나이</label>
                      <select class="custom-select mr-sm-2" id="ltbnChldAge" name="ltbnChldAge" required="required"
                      onFocus='this.initialSelect = this.selectedIndex;' onChange='this.selectedIndex = this.initialSelect;'>
                      	<c:forEach var="selectLtbnChld" items="${ltbnChldList}">
                          <option value="${cust.ltbnChldAge}"<c:if test="${cust.ltbnChldAge == selectLtbnChld.getKey()}">selected</c:if>>
						  ${selectLtbnChld.getValue() }
                        </c:forEach>
                      </select>
                    </div>
                  </div>
               	  <div class="col-md-2 pl-1">
                    <div class="form-group">
                      <label for="maxPrm">최대 보험료</label>
                      <input type="number" class="form-control" value=${cust.maxPrm} id="maxPrm" name="maxPrm" readonly="readonly">
                    </div>
                  </div>  
                </div>
                <div class="row">
                  <div class="col-md-2 pr-1">
                    <div class="form-group">
                      <label for="custIncm">고객추정소득</label>
                      <input type="number" class="form-control" value=${cust.custIncm} id="custIncm" name="custIncm" readonly="readonly">
                    </div>
                  </div>
                  <div class="col-md-2 px-1">
                    <div class="form-group">
                      <label for="rcbaseHshdIncm">추정가구소득1</label>
                      <input type="number" class="form-control" value=${cust.rcbaseHshdIncm} id="rcbaseHshdIncm" name="rcbaseHshdIncm" readonly="readonly">
                    </div>
                  </div>
                  <div class="col-md-2 pl-1">
                    <div class="form-group">
                      <label for="jpbaseHshdIncm">추정가구소득2</label>
                      <input type="number" class="form-control" id="jpbaseHshdIncm" name="jpbaseHshdIncm" value=${cust.jpbaseHshdIncm} readonly="readonly">
                    </div>
                  </div>
                </div>
              </form>
              <div class="row">
              	<div class="update ml-auto mr-auto">
              	  <button class="custupdateBtn btn btn-primary btn-round" id="custupdateBtn">수정</button>
                  <button class="custdeleteBtn btn btn-danger btn-round" id="custdeleteBtn">삭제</button>
                </div>
              </div>
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
      <!-- END 고객 정보 확인 폼 -->
      
      <!-- 고객 청구 정보 확인 폼 -->
      <div class="col-md-12">
      	<div class="card card-body">
      		  <h2 align="center"> 총 ${TotalCount }개의 청구 데이터가 존재합니다.</h2>
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
		  <c:if test="${TotalCount !=0 }">
		  		<div class ="text-center">
					<nav aria-label="Page navigation example">
					    <c:set var="countList" value="10"></c:set>
					    <c:set var="countPage" value="10"></c:set>
					    <c:set var="currentPage" value="${currentPage}"></c:set>
					    <c:set var="stratPage" value="${((currentPage -1)/10)*10+1}"></c:set>
					    <c:set var="endPage" value="${stratPage + countPage -1}"></c:set>
					 	<c:set var="totalPage" value="${TotalCount/countList}"></c:set>
					 	<%-- <fmt:formatNumber value="${totalPage+(1-(totalPage%1))%1}" type="number"/>  --%>
					 	<c:if test="${endPage > totalPage}">
					 		<c:set var="endPage" value="${totalPage}"></c:set>
						</c:if>
					  <ul class="pagination" style="text-align:center;">
					    <li class="page-item">
					   <c:if test="${currentPage == 1}">
					    <a class="page-link disabled"aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					   </c:if>
					  <c:if test="${currentPage != 1}">
					      <a class="page-link" href="<c:url value='/product/custManageServices/${sessionScope.userId}/${sessionScope.custManagerId}/${custId}/1'/>" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					   </c:if>
					    </li>
					 	<c:if test="${TotalCount%countList > 0}">
					 		<c:set var="totalPage" value="${totalPage+1}"></c:set>
					 	</c:if>
					    <c:forEach var="i" begin="1" end="${totalPage}">
					    	<li class="page-item"><a class="page-link" href="<c:url value='/product/custManageServices/${sessionScope.userId}/${sessionScope.custManagerId}/${custId}/${i}'/>">${i}</a></li>
					    </c:forEach>
					    <li class="page-item">
					      <a class="page-link"  href="<c:url value='/product/custManageServices/${sessionScope.userId}/${sessionScope.custManagerId}/${custId}/${totalPage-(totalPage%1)}'/>" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
		  		</div>
		  	</c:if>
		</div>
	  </div>
	 <input id="dialog" type="password" title="비밀번호를 입력하세요" style="display:none" value=''></input>

	  
	  <!-- END 고객 청구 정보 확인 폼 -->
	</section>
	<!-- End Services Section -->
  </main>
  <!-- End #main -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
  
  <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

  
    <!-- 위 코드 고정 시키기   -->
  <script type="text/javascript">
  	document.getElementById('header').setAttribute('class', 'fixed-top')

  	$("#custupdateBtn").on("click", function(){
  		
   		var custId = $("#selectcustId").text();
		var custManagerId = ${sessionScope.custManagerId}
		location.href = "<c:url value='/product/custUpdate/'/>"+ custManagerId + "/" + custId;
  	});
  	
  	$("#custdeleteBtn").on("click", function () {
  		/*  	var password = "${password}"
  			var userInput = prompt("당신의 비밀번호는 무엇인가요?"+"");
	  		if(userInput == password){
	  			 if (confirm("정말 삭제하시겠습니까??") == true){//확인
	  	  		     document.removefrm.submit();
	  	  		 }else{//취소
	  	  			 alert("삭제 취소");
	  	  		     return false;
	  	  		 } 
	  		}else{
	  			alert("비밀번호가 틀렸습니다.");
	  			return false;
	  		} */
	  		$('#dialog').dialog({
	  			modal:true,
	  			position:[800,200],
	  			buttons:{
	  				"삭제": function(){
	  					var password = "${password}"
	  					inputData = $(this).val()
	  					if(inputData === password){
	  						 if (confirm("정말 삭제하시겠습니까??") == true){//확인
	  			  	  		     document.removefrm.submit();
	  			  	  		 }else{//취소
	  			  	  			 alert("삭제 취소");
	  			  	  		     return false;
	  			  	  			 $(this).dialog('close');
	  			  	  		 } 
	  						
	  					}else{
	  						alert("비밀번호가 틀립니다.");
	  						$(this).dialog('close'); 
	  					}
	  				},
	  				"취소": function(){ $(this).dialog('close');}
	  			}
	  		})
	  		
  	});
  </script>
</body>
</html>