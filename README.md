# Maria DB
Maria DB 에  DataBase 폴더에 있는 MariaDB 
sql 파일 import 하기
# 장고
1. 파이참을 설치
2. 파이참 VCS -> Get from Version Control -> https://github.com/gwooop/Insurance-Fraud-Detection 입력 후 받아옴 
3. VCS-> git -> branches-> origin/django -> checkout
4. 터미널 창에 pip install -r requirements.txt  -> 설치 완료후 python manage.py runserver 
 

# ORACLE DB
ORACLE DB 에 DataBase 폴더에 있는 ORACLE-2 sql 파일 import 하기
(안되면) ORACLE sql 파일로

# 스프링
이클립스 설치 
1. Clone Git Repository-> https://github.com/gwooop/Insurance-Fraud-Detection  입력후 받아옴
2. Switch To ->  other -> spring_semi -> check_out -> 실행


# 보험 판별 프로젝트 실행 순서
(사전에 DB에 값을 다 넣어야한다.)
1. 장고 서버를 먼저 킨다.
2. 스프링 서버를 킨다.
3. 스프링 서버에서 돌아가는 Url 로 접속한다.
4. service 에 들어가 잘되나 확인한다.


## DB 정보
<오라클>
- jdbc.username=hr
- jdbc.password=hr

<마리아 DB>
- majdbc.url=jdbc:mariadb://127.0.0.1:3306/insurance_data
- majdbc.username=root
- majdbc.password=1234

