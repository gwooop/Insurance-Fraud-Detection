# 데이터베이스 설치 및 설정(MariaDB & Oracle)
Maria DB
1. MariaDB 설치
mariadb.org에서 다운로드 후 설치
2. 로그인 후 데이터베이스 생성
create database insurance;
exit;
3. Maria DB 에 DataBase 폴더에 있는 MariaDB sql 파일 import 하기
ex) mysql -u username -p new_database < data-dump.sql
mysql -u root -p insurance < D:\m\DataBase\MariaDB.sql

# ORACLE DB
1. Oracle Express Edition 설치(oracle.com)
hr 계정 초기화
conn /as sysdba
exec dbms_xdb.sethttpport(8000)
alter user hr account unlock identified by hr;
conn hr/hr
select count(*) from employees;
2. SQL Developer 설치 및 설정(oracle.com)
3. ORACLE DB 에 DataBase 폴더에 있는 ORACLE-2 sql 파일 import 하기 (안되면) ORACLE sql 파일로
@D:\m\DataBase\Oracle-2.sql


# WAS 설정(파이썬 장고 & 자바 스프링)
## 장고
1. 파이썬 설치(python.org)
2.7.7권장(2.8은 윈도우7 설치전 윈도우 업데이트 해야 함)
설치폴더 : C:\Python37
2. 패키지 설치(터미널 창에 pip install -r requirements.txt)
python -m pip install --upgrade pip
cd D:\m\Insurance-Fraud-Detection-master
pip install -r requirements.txt
3. 파이참 설치(https://www.jetbrains.com/pycharm/)
community edition 설치
4. 파이참 실행 후 프로젝트 다운로드
파이참 VCS -> Get from Version Control -> https://github.com/gwooop/Insurance-Fraud-Detection 입력 후 받아옴
VCS-> git -> branches-> origin/django -> checkout
5. File > Settings > Project Interpreter 에서 파이썬 인터프린터 추가
6. RUN > Edit Configurations... 
Parameters에 runserver 입력 후 run
또는 터미널에서 python manage.py runserver
7. 테스트(웰컴페이지 없음)
http://127.0.0.1:8000/1

## 스프링
1. JDK설치(1.8)
2. 이클립스 설치(eclipse.org)
3. Perspective변경 -> git으로
4. 프로젝트 복사
Clone Git Repository-> https://github.com/gwooop/Insurance-Fraud-Detection 입력후 받아옴
5. 브렌치 선택후 프로젝트 임포트
깃 리포지토리 마우스 오른쪽 버튼 클릭 후 Switch To -> other -> Remote Tracking 아래의 origin/spring_semi 선택 -> check_out ->Check out as New Local Branch 선택 >  Finish 
6. 또는 이클립스에서 File > Import > General > Existing project into workspace
Select archive file : Insurance-Fraud-Detection.zip > Finish
7. 톰캣 설치
8. 이클립스에서 톰캣 서버 설정
9. C:\Users\B0111\.m2\repository\com\oracle\ojdbc\6 폴더에 Database/ojdbc-6.jar 파일 복사
데이터베이스 계정 정보(프로젝트 > Java Resources > src/main/resources/database/jdbc.properties
jdbc.driverClassName=oracle.jdbc.driver.OracleDriver
jdbc.url=jdbc:oracle:thin:@localhost:1521:xe
jdbc.username=hr
jdbc.password=hr
majdbc.driverClassName=org.mariadb.jdbc.Driver
majdbc.url=jdbc:mariadb://127.0.0.1:3306/insurance_data
majdbc.username=root
majdbc.password=1234
10. 서버실행
브라우저 주소는 http://localhost:8080/ins/member/login


## 보험 판별 프로젝트 실행 순서
1. 장고 서버를 먼저 킨다.
2. 스프링 서버를 킨다.
3. 스프링 서버에서 돌아가는 호스트 URL 로 접속한다.
4. service 에 들어가 잘되나 확인한다.
5. 관리자 임시 아이디/비밀번호 : admin/admin

## 간단한 시연 
[![kosongs Youtube](https://i9.ytimg.com/vi/qEVJKzUWWvM/mq1.jpg?sqp=CLiAwPcF&rs=AOn4CLCKz1CcEWX2AMZknpmtt4DbC-WfGw)](https://www.youtube.com/watch?v=qEVJKzUWWvM)
