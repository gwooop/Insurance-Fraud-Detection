<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html lang="en">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex justify-cntent-center align-items-center">
    <div id="heroCarousel" class="container carousel carousel-fade" data-ride="carousel">

      <!-- Slide 1 -->
      <div class="carousel-item active">
        <div class="carousel-container">
          <h2 class="animated fadeInDown">보험 사기자 판별 서비스</h2>
          <p class="animated fadeInUp">보험사기에 대한 적발금액과 적발인원이 역대 최고 수준으로 급증하고 직업・연령・성별에 관계없이 불특정 다수의 보험소비자가 범죄라는 인식 없이 피해를 과장하거나, 사실을 왜곡하여 보험금을 청구하는 보험사기에 가담하고 있습니다. 
          	<br>이러한 보험사기를 사전에 예방하기 위한 보험사기자 판별 서비스를 제공하는 사이트입니다.</p>
        </div>
      </div>

      <!-- Slide 2 -->
      <div class="carousel-item ">
        <div class="carousel-container">
          <h2 class="animated fadeInDown">Insurance Fraud Detection</h2>
          <p class="animated fadeInUp">The amount of insurance fraud and the number of people caught has rapidly increased to the highest level ever, and many unspecified insurance consumers exaggerate the damage without realizing that it is a crime or distort the facts to claim insurance fraud. I am participating.
			This site provides insurance fraud identification services to prevent such fraud in advance.</p>
        </div>
      </div>

      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon bx bx-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>

      <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon bx bx-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>

    </div>
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= Features Section ======= -->
    <section class="features">
      <div class="container">

        <div class="section-title">
          <h2>Features</h2>
          <p>'보험사기행위'란 보험사고의 발생, 원인 또는 내용에 관하여 보험자를 기망하여 보험금을 청구하는 행위를 말한다고 <br>「보험사기방지 특별법」(2016.9.30. 시행) 제2조에서 정의하고 있습니다.</p>
        </div>

        <div class="row" data-aos="fade-up">
          <div class="col-md-5">
            <img src="assets/img/features-show1.png" class="img-fluid" alt="">
          </div>
          <div class="col-md-7 pt-4">
            <h3>2019년 보험사기 적발현황</h3>
            <ul>
              <li><i class="icofont-check"></i> '19년 중 보험사기 적발금액은 8,809억원으로 전년(7,982억원) 대비 827억원(10.4%↑) 증가(역대 최고 수준)</li>
              <li><i class="icofont-check"></i> 적발 인원은 92,538명으로 ‘15년 이후 정체․감소추세를 보이다가 '19년 중 크게 증가(13,359명, 16.9%↑)</li>
              <li><i class="icofont-check"></i> 대다수의 보험사기(82%)가 1인당 평균 적발금액(9.5백만원) 미만으로 비교적 소액의 보험사기</li>
            </ul>
            <p class="font-italic">
             	불특정 다수의 보험소비자가 상해․질병 또는 자동차사고 등의 피해를 과장하거나 사실을 왜곡하여 보험금을 청구하는 생계형 보험사기가 증가한 것으로 분석
            </p>
          </div>
        </div>

        <div class="row" data-aos="fade-up">
          <div class="col-md-5 order-1 order-md-2">
            <img src="assets/img/features-show2.png" class="img-fluid" alt="">
          </div>
          <div class="col-md-7 pt-5 order-2 order-md-1">
            <h3>보험 사기자 판별 서비스란?</h3>
            <p class="font-italic">
            	보험회사의 보험설계자가 기존 또는 신규 고객들을 관리할 때<br>
            	 그들이 보험 사기자인지 아닌지를 판별하는 서비스              
            </p>
            <ul>
              <li><i class="icofont-check"></i> 사용 데이터 : 'H'보험회사의 약 10여년 간의 보험사기자와 일반고객으로 구분하여 구성된 데이터</li>
            </ul>
          </div>
        </div>

        <div class="row" data-aos="fade-up">
          <div class="col-md-5">
            <img src="assets/img/features-show3.png" class="img-fluid" alt="">
          </div>
          <div class="col-md-7 pt-5">
            <h3>Sunt consequatur ad ut est nulla consectetur reiciendis animi voluptas</h3>
            <p>Cupiditate placeat cupiditate placeat est ipsam culpa. Delectus quia minima quod. Sunt saepe odit aut quia voluptatem hic voluptas dolor doloremque.</p>
            <ul>
              <li><i class="icofont-check"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
              <li><i class="icofont-check"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
              <li><i class="icofont-check"></i> Facilis ut et voluptatem aperiam. Autem soluta ad fugiat.</li>
            </ul>
          </div>
        </div>

        <div class="row" data-aos="fade-up">
          <div class="col-md-5 order-1 order-md-2">
            <img src="assets/img/features-4.svg" class="img-fluid" alt="">
          </div>
          <div class="col-md-7 pt-5 order-2 order-md-1">
            <h3>Quas et necessitatibus eaque impedit ipsum animi consequatur incidunt in</h3>
            <p class="font-italic">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
              magna aliqua.
            </p>
            <p>
              Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
              velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
              culpa qui officia deserunt mollit anim id est laborum
            </p>
          </div>
        </div>

      </div>
    </section><!-- End Features Section -->

  </main><!-- End #main -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
</body>

</html>