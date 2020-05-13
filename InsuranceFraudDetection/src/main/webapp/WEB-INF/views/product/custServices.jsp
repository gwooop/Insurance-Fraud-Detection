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
            <li>${sessionScope.userId}님환영합니다</li>
          </ol>
        </div>

      </div>
    </section><!-- End Our Services Section -->

    <!-- ======= Services Section ======= -->
    <section class="services">
     
     <div class="col-md-12">
            <div class="card card-user">
              <div class="card-header">
                <h5 class="card-title">기본 회원 정보 입력${message}</h5>
              </div>
              <div class="card-body">
                <form action="<c:url value='/product/services/${sessionScope.custManagerId}'/>"  method="POST" required="required">
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
                        <input type="number" min="0" class="form-control"  placeholder="Company" id="totalPrem" name="totalPrem" required="required">
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
                        <input type="number"  id="maxPrm" name="maxPrm" min="0"class="form-control" placeholder="최대 보험료" value="" required="required">
                      </div>
                    </div>  
                  </div>
                  <div class="row">
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label for="custIncm">고객추정소득</label>
                        <input type="number" id="custIncm" name="custIncm" min="0" class="form-control"  placeholder="0" value="0" required="required">
                      </div>
                    </div>
                    <div class="col-md-2 px-1">
                      <div class="form-group">
                        <label for="rcbaseHshdIncm">추정가구소득1</label>
                        <input type="number"  id="rcbaseHshdIncm" name="rcbaseHshdIncm" min="0" class="form-control" placeholder="" value="0" required="required">
                      </div>
                    </div>
                    <div class="col-md-2 pl-1">
                      <div class="form-group">
                        <label for="jpbaseHshdIncm">추정가구소득2</label>
                        <input type="number"  id="jpbaseHshdIncm" name="jpbaseHshdIncm" min="0" class="form-control" placeholder="" value="0" required="required">
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
    </section><!-- End Services Section -->

    <!-- ======= Why Us Section ======= -->
    <section class="why-us section-bg" data-aos="fade-up" date-aos-delay="200">
   

        <div class="row">
          <div class="col-lg-6 video-box">
            <img src="<c:url value='/assets/img/why-us.jpg'/>" class="img-fluid" alt="">
            <a href="https://www.youtube.com/watch?v=jDDaplaOz7Q" class="venobox play-btn mb-4" data-vbtype="video" data-autoplay="true"></a>
          </div>

          <div class="col-lg-6 d-flex flex-column justify-content-center p-5">

            <div class="icon-box">
              <div class="icon"><i class="bx bx-fingerprint"></i></div>
              <h4 class="title"><a href="">Lorem Ipsum</a></h4>
              <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
            </div>

            <div class="icon-box">
              <div class="icon"><i class="bx bx-gift"></i></div>
              <h4 class="title"><a href="">Nemo Enim</a></h4>
              <p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
            </div>

          </div>
        </div>

      </div>

     
    </section><!-- End Why Us Section -->

    <!-- ======= Service Details Section ======= -->
    <section class="service-details">
      <div class="container">

        <div class="row">
          <div class="col-md-6 d-flex align-items-stretch" data-aos="fade-up">
            <div class="card">
              <div class="card-img">
                <img src="<c:url value='/assets/img/service-details-1.jpg'/>" alt="...">
              </div>
              <div class="card-body">
                <h5 class="card-title"><a href="#">Our Mission</a></h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat</p>
                <div class="read-more"><a href="#"><i class="icofont-arrow-right"></i> Read More</a></div>
              </div>
            </div>
          </div>
          <div class="col-md-6 d-flex align-items-stretch" data-aos="fade-up">
            <div class="card">
              <div class="card-img">
                <img src="<c:url value='/assets/img/service-details-2.jpg'/>" alt="...">
              </div>
              <div class="card-body">
                <h5 class="card-title"><a href="#">Our Plan</a></h5>
                <p class="card-text">Sed ut perspiciatis unde omnis iste natus error sit voluptatem doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo</p>
                <div class="read-more"><a href="#"><i class="icofont-arrow-right"></i> Read More</a></div>
              </div>
            </div>

          </div>
          <div class="col-md-6 d-flex align-items-stretch" data-aos="fade-up">
            <div class="card">
              <div class="card-img">
                <img src="<c:url value='/assets/img/service-details-3.jpg'/>" alt="...">
              </div>
              <div class="card-body">
                <h5 class="card-title"><a href="#">Our Vision</a></h5>
                <p class="card-text">Nemo enim ipsam voluptatem quia voluptas sit aut odit aut fugit, sed quia magni dolores eos qui ratione voluptatem sequi nesciunt Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet</p>
                <div class="read-more"><a href="#"><i class="icofont-arrow-right"></i> Read More</a></div>
              </div>
            </div>
          </div>
          <div class="col-md-6 d-flex align-items-stretch" data-aos="fade-up">
            <div class="card">
              <div class="card-img">
                <img src="<c:url value='/assets/img/service-details-4.jpg'/>" alt="...">
              </div>
              <div class="card-body">
                <h5 class="card-title"><a href="#">Our Care</a></h5>
                <p class="card-text">Nostrum eum sed et autem dolorum perspiciatis. Magni porro quisquam laudantium voluptatem. In molestiae earum ab sit esse voluptatem. Eos ipsam cumque ipsum officiis qui nihil aut incidunt aut</p>
                <div class="read-more"><a href="#"><i class="icofont-arrow-right"></i> Read More</a></div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Service Details Section -->

    <!-- ======= Pricing Section ======= -->
    <section class="pricing section-bg" data-aos="fade-up">
      <div class="container">

        <div class="section-title">
          <h2>Pricing</h2>
          <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
        </div>

        <div class="row no-gutters">

          <div class="col-lg-4 box">
            <h3>Free</h3>
            <h4>$0<span>per month</span></h4>
            <ul>
              <li><i class="bx bx-check"></i> Quam adipiscing vitae proin</li>
              <li><i class="bx bx-check"></i> Nec feugiat nisl pretium</li>
              <li><i class="bx bx-check"></i> Nulla at volutpat diam uteera</li>
              <li class="na"><i class="bx bx-x"></i> <span>Pharetra massa massa ultricies</span></li>
              <li class="na"><i class="bx bx-x"></i> <span>Massa ultricies mi quis hendrerit</span></li>
            </ul>
            <a href="#" class="get-started-btn">Get Started</a>
          </div>

          <div class="col-lg-4 box featured">
            <h3>Business</h3>
            <h4>$29<span>per month</span></h4>
            <ul>
              <li><i class="bx bx-check"></i> Quam adipiscing vitae proin</li>
              <li><i class="bx bx-check"></i> Nec feugiat nisl pretium</li>
              <li><i class="bx bx-check"></i> Nulla at volutpat diam uteera</li>
              <li><i class="bx bx-check"></i> Pharetra massa massa ultricies</li>
              <li><i class="bx bx-check"></i> Massa ultricies mi quis hendrerit</li>
            </ul>
            <a href="#" class="get-started-btn">Get Started</a>
          </div>

          <div class="col-lg-4 box">
            <h3>Developer</h3>
            <h4>$49<span>per month</span></h4>
            <ul>
              <li><i class="bx bx-check"></i> Quam adipiscing vitae proin</li>
              <li><i class="bx bx-check"></i> Nec feugiat nisl pretium</li>
              <li><i class="bx bx-check"></i> Nulla at volutpat diam uteera</li>
              <li><i class="bx bx-check"></i> Pharetra massa massa ultricies</li>
              <li><i class="bx bx-check"></i> Massa ultricies mi quis hendrerit</li>
            </ul>
            <a href="#" class="get-started-btn">Get Started</a>
          </div>

        </div>

      </div>
    </section><!-- End Pricing Section -->

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