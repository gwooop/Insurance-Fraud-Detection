<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<link rel="stylesheet" href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" type="text/css"/>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
 




  <main id="main">

    <!-- ======= About Us Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>About Us</h2>
          <ol>
            <li><a href="./">Home</a></li>
            <li>About Us</li>
          </ol>
        </div>

      </div>
    </section><!-- End About Us Section -->

    <!-- ======= About Section ======= -->
<div class="col-md-12">
            <div class="card card-user">
              <div class="card-header">
                <h5 class="card-title">기본 회원 정보 입력</h5>
              </div>
              <div class="card-body">
                <form action="<c:url value='/product2'/>"  method="POST">
                  <div class="row">
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label id="sex">성별</label>
                        	<select class="custom-select mr-sm-2" id="sex" name="sex">
         
      							<option value="1">남</option>
      							<option value="2">여</option>
	   					    </select>
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label for="age">나이</label>
                        	<select class="custom-select mr-sm-2" id="age" name="age">
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
                        <input type="number" class="form-control" placeholder="거주지 가격" value=""  min="0" id="resiCost"  name="resiCost">
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label for="resiTypeCode">RESI_TYPE_CODE</label>
                        	<select class="custom-select mr-sm-2" id="resiTypeCode" name="resiTypeCode">
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
                        <label for="occpGrp1">직업</label>
                        	<select class="custom-select mr-sm-2" id="occpGrp1" name="occpGrp1">
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
                        	<select class="custom-select mr-sm-2" id="ctpr" name="ctpr">
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
                        <input type="number" min="0" class="form-control"  placeholder="Company" id="totalPrem" name="totalPrem">
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label id="weddYn">결혼여부</label>
                        	<select class="custom-select mr-sm-2" id="weddYns" name="weddYns">
         						<option value="Y">네</option>
      							<option value="N">아니요</option>
	   					    </select>
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label for="mateOccpGrp1">배우자 직업</label>
                        	<select class="custom-select mr-sm-2" id="mateOccpGrp1" name="mateOccpGrp1"> 
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
                        	<select class="custom-select mr-sm-2" id="chldCnt" name="chldCnt">
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
                        	<select class="custom-select mr-sm-2" id="ltbnChldAge" name="ltbnChldAge">
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
                        <input type="number"  id="maxPrm" name="maxPrm" min="0"class="form-control" placeholder="최대 보험료" value="">
                      </div>
                    </div>  
                  </div>
                  <div class="row">
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label for="custIncm">고객추정소득</label>
                        <input type="number" id="custIncm" name="custIncm" min="0" class="form-control"  placeholder="0" value="0">
                      </div>
                    </div>
                    <div class="col-md-2 px-1">
                      <div class="form-group">
                        <label for="rcbaseHshdIncm">추정가구소득1</label>
                        <input type="number"  id="rcbaseHshdIncm" name="rcbaseHshdIncm" min="0" class="form-control" placeholder="" value="0">
                      </div>
                    </div>
                    <div class="col-md-2 pl-1">
                      <div class="form-group">
                        <label for="jpbaseHshdIncm">추정가구소득2</label>
                        <input type="number"  id="jpbaseHshdIncm" name="jpbaseHshdIncm" min="0" class="form-control" placeholder="" value="0">
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
  <!--              <form>
  				<div class="form-group">
    				<label for="exampleFormControlFile1">파일 입력해서 가져오기</label>
    				<input type="file" class="form-control-file" id="exampleFormControlFile1">
				</div>
			  </form> -->
              </div>
            </div>
          </div>
	<div>
	 <input  id="restTest">
     <button id="test" >testButton</button>
     <div id="result"></div>
	</div>
    </section><!-- End About Section -->

    <!-- ======= Facts Section ======= -->
    <section class="facts section-bg" data-aos="fade-up">
      <div class="container">

        <div class="row counters">

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">232</span>
            <p>Clients</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">521</span>
            <p>Projects</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">1,463</span>
            <p>Hours Of Support</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">15</span>
            <p>Hard Workers</p>
          </div>

        </div>

      </div>
    </section><!-- End Facts Section -->

    <!-- ======= Our Skills Section ======= -->
    <section class="skills" data-aos="fade-up">
      <div class="container">

        <div class="section-title">
          <h2>Our Skills</h2>
          <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
        </div>

        <div class="skills-content">

          <div class="progress">
            <div class="progress-bar bg-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
              <span class="skill">HTML <i class="val">100%</i></span>
            </div>
          </div>

          <div class="progress">
            <div class="progress-bar bg-info" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
              <span class="skill">CSS <i class="val">90%</i></span>
            </div>
          </div>

          <div class="progress">
            <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
              <span class="skill">JavaScript <i class="val">75%</i></span>
            </div>
          </div>

          <div class="progress">
            <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100">
              <span class="skill">Photoshop <i class="val">55%</i></span>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Our Skills Section -->

    <!-- ======= Tetstimonials Section ======= -->
    <section class="testimonials" data-aos="fade-up">
    
<table id="myTable" class="display" style="width:100%" >
    <thead>
        <tr>
            <th>Column 1</th>
            <th>Column 2</th>
        </tr>
    </thead>
    <c:forEach var="i" begin="1" end="30">
    <tbody>
    
        <tr>
            <td>Row Data ${i}</td>
            <td>Row Data ${i+1}</td>
        </tr>
    </tbody>
    </c:forEach>
</table>
    
    
    
      <div class="container">

        <div class="section-title">
          <h2>Tetstimonials</h2>
          <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
        </div>

        <div class="owl-carousel testimonials-carousel">

          <div class="testimonial-item">
            <img src="assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
            <h3>Saul Goodman</h3>
            <h4>Ceo &amp; Founder</h4>
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
          </div>

          <div class="testimonial-item">
            <img src="assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
            <h3>Sara Wilsson</h3>
            <h4>Designer</h4>
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
          </div>

          <div class="testimonial-item">
            <img src="assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
            <h3>Jena Karlis</h3>
            <h4>Store Owner</h4>
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
          </div>

          <div class="testimonial-item">
            <img src="assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
            <h3>Matt Brandon</h3>
            <h4>Freelancer</h4>
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
          </div>

          <div class="testimonial-item">
            <img src="assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
            <h3>John Larson</h3>
            <h4>Entrepreneur</h4>
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
          </div>

        </div>

      </div>
    </section><!-- End Ttstimonials Section -->

  </main><!-- End #main -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
  
  <!-- 위로 올라가는 화살표  -->
  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
  <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.js"></script>

  	
  	
  </script>
  <!-- 위 코드 고정 시키기   -->
  <script type="text/javascript">
  $(document).ready( function () {
	    $('#myTable').DataTable();
	} );
  
  
  
  	document.getElementById('header').setAttribute('class', 'fixed-top')
  $("#test").on("click",function(){
     var cust= $("#restTest").value;
	 	console.log(cust) 
	$.ajax({
		url:"<c:url value='/restTest/100'/>",
		type:"GET",
		data:{},
		success:function(data){
			console.log(data);
		}
	})  
  })
  

</script>
 
</body>

</html>