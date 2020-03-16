영화/도서 리뷰 사이트
=====
* [영화/도서 리뷰 사이트](https://github.com/nara1030/spring-board)의 JSP 버전
* 프론트를 따로 분리(React)하려 했으나 쉽지 않아 익숙한 JSP로 먼저 접근
- - -
## 목차
1. [개발환경](#개발환경)
2. [기록](#기록)
3. [참고](#참고)

## 개발환경
```txt
- Java 8
- Spring Boot 2.2.3
- Gradle
- JSP
```

##### [목차로 이동](#목차)

## 기록
1. JSP 사용 위한 프로젝트 구조  
	```txt
	└─ project
	    ├─ build
		├─ src
		│   ├── java
		│   └── com.eom.openapi
		│        ├── controller
		│        │    └── HomeController.java
		│        ├── service
		│        │    └── HomeService.java
		│        └── OpenApiApplication.java
		├─ resource
		│   ├── static
		│   └── application.yml
		└─ webapp
		    └── WEB-INF
		         └── jsp
		              └── home.jsp
	```
2. @RestController → @Controller  
	```txt
	- JSP, 즉 View단으로 데이터를 넘겨주기 위해 @Controller 사용
	- 넘어온 데이터는 JSP에서 EL/JSTL을 통해 화면 출력
	
	- @Controller: Restful하지 못한 건가?
	```
3. HTML 문서 Table 스타일 적용  
	```txt
	- head 태그 안에 다음 세 가지 추가
	   1. <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	   2. <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	   3. Uncaught Error: Bootstrap's JavaScript requires jQuery
	      - 부트스트랩 선언에 앞서 jQuery 선언 필요(아래 링크 참고)
	- 참고
	   - https://www.w3schools.com/bootstrap4/tryit.asp?filename=trybs_table_striped&stacked=h
	```
4. HTML 문서 내 스크립트 태그 위치  
	```txt
	추후 공부 필요
	
	- https://webdir.tistory.com/514
	- https://dailydev.tistory.com/15
	- https://epthffh.tistory.com/entry/JSTL-%EA%B3%BC-Javascript-%ED%98%BC%EC%9A%A9-%EC%82%AC%EC%9A%A9%EC%9D%98-%EC%8B%A4%EC%A0%9C%EC%82%AC%EB%A1%80
	```
5. JSTL 관련 ERROR  
	```txt
	에러 메세지: Don't know how to iterate over supplied "items" in &lt;forEach&gt;
	
	- JSP(search.jsp)에서 책 정보(${items.bookItems})만 가져왔을 때는 이상 없었음
	- 이해는 안 가지만 c:forEach문을 2번 사용한 것이 원인인 줄 알고 검색했으나 안 나옴
	- 원인은 다름 아니라 Controller의 리턴 타입이 달랐기 때문(책: List<BookItem>, 영화: MovieItems)
	```
6. 검색창 만들기  
	```txt
	- 검색 URL 케이스
	   - case1: ko-KR/search
       - case2: ko-KR/search?query=joker
	- 기존에는 직접 검색어(joker)를 넘겨주는 형식이었으나 검색창을 통해 검색어를 넘겨주는 형식으로 수정
	  (∴ case1 가능)
	- 참고
	   - https://www.w3schools.com/howto/howto_css_searchbar.asp
	```
7. API 엔드포인트 수정  
	```txt
	- 엔드 포인트 확장(왓챠 참고)
	   1. 직접 접근 혹은 검색창 미입력: http://localhost:8084/ko-KR/search
	   2. 검색어 입력: http://localhost:8084/ko-KR/search?query=love
	- 수정 코드 발췌
	    @GetMapping("search")
	    public String searchData(@RequestParam(required = false) String query, Model model) {
		    /*
		     * 1. requried = false: o, @Nullable: x
		     * 2. .equals()가 우선이면 검색창으로 ""이 넘어올 때는 맞으나 Null일 땐 NPE 발생
		     */
		    if (query == null || query.equals("")) {
			    query = "happy";
		    }
	    }
	- TODO: 검색창에 미입력("") 시와 직접 접근(null) 시 URL 통일
	   - http://localhost:8084/ko-KR/search
	   - http://localhost:8084/ko-KR/search?query=
	```
8. Tiles 적용  
	```txt
	- 페이지가 두 개이므로 공통 적용 위해 고려
	   - https://www.w3schools.com/howto/howto_css_fixed_sidebar.asp
	- 고민
	   1. 스프링 부트는 스프링과 다르게 자바빈 Config 설정
	      (ViewResolver: TilesViewResolver or UrlBasedViewResolver)
	   2. 처음에는 jar 파일을 war 파일로 패키징 해서 tomcat에 배포하는 방법 고려했으나 실패
	- 에러
	   1. java.lang.NoClassDefFoundError: org/apache/tiles/request/servlet/ServletApplicationContext
	      → 의존성(tiles-request-servlet) 추가(build.gradle)
	   2. java.lang.NoSuchMethodError: 'void org.apache.tiles.startup.TilesInitializer.initialize(org.apache.tiles.request.ApplicationContext)'
	      → tiles-jsp 버전 변경(2.2.2 → 3.0.7)
	- 참고
	   - Tiles
	      - https://www.baeldung.com/spring-mvc-apache-tiles
	      - https://www.devglan.com/spring-boot/spring-boot-mvc-apache-tiles-example
	      - https://www.codeproject.com/Articles/5249193/Spring-Boot-Web-Application-Development-using-JSTL
	      - https://www.hanumoka.net/2018/07/31/spring-20180731-spring4-mvc-tiles3/
	   - Spring
	      - https://www.baeldung.com/spring-xml-vs-java-config
	      - https://gigas-blog.tistory.com/115
	   - iframe
	      - https://okky.kr/article/318388
	```
9. .

##### [목차로 이동](#목차)

## 참고
1. [Spring Boot와 JSP 연동 방법](https://mia-dahae.tistory.com/131)
2. @RestController → @Controller
	* [Spring Controller 리턴타입](http://wonwoo.ml/index.php/post/2007)
	* [Restful 방식의 구현법](https://wondongho.tistory.com/76)
3. BOOTSTRAP 
	* [w3schools.com](https://www.w3schools.com/bootstrap4/bootstrap_forms.asp)
	* [부트스트랩 시작하기](http://bootstrapk.com/getting-started/)
4. .
5. JSTL ERROR
	* [Don't know how to iterate over supplied "items"](https://sshbug.tistory.com/213): forEach문에 넣어준 데이터가 리스트 타입인지 확인 필요
	* 발생 에러 메세지  
		<img src="./img/jstl_error_01.png" width="800" height="700"></br>
6. .
7. @Nullable & required = false
	* [Can @Nullable be used in place of (required=false) for a @RequestParam controller method parameter?](https://stackoverflow.com/questions/58142505/can-nullable-be-used-in-place-of-required-false-for-a-requestparam-controller)
	* 아래 로그를 보면 쿼리 받을 때 공백("")과 Null을 구분  
		<img src="./img/npe_01.png" width="800" height="550"></br>
8. Tiles ERROR
	* [java.lang.NoClassDefFoundError](https://stackoverflow.com/questions/52392925/spring-4-with-tiles-3-error-noclassdeffounderror-org-apache-tiles-request-appli)  
		<img src="./img/tiles_error_01.png" width="800" height="500"></br>
	* [java.lang.NoSuchMethodError](https://stackoverflow.com/questions/1048779/when-do-we-get-java-lang-nosuchmethoderror-even-when-the-jar-class-has-the-parti)  
		<img src="./img/tiles_error_02.png" width="800" height="500"></br>
	
9. .

##### [목차로 이동](#목차)