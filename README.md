★ 프로젝트 - 제목학원

참고 서적 - 코드로 배우는 스프링 웹 프로젝트

★ 기본 설정
JDK 1.8
STS 3.9 in 이클립스 (의존성 주입 등 설정은 xml 방식으로)
TOMCAT 9.0
오라클 / SQL DEVELOPER
아약스
+ 아마존 AWS로 서버 돌릴 예정

★ 주요 기능 - 
댓글 별점 기능(0%)
주간 혹은 월간 별점 순위권 글목록 표시(0%)

★ 사이트 조감도

로그인 페이지

메인 페이지
헤더(미정, 사이트이름) 
메인(기본 드립 게시판, 이미지 검색 api)

★ 사이트 흐름

로그인 창 (index) -> 메인 창

★ 테이블 명세

|작업|url|method|parameter|form|url 이동|
|전체 목록|/happy/list|get||||
|등록 처리|/happy/register|post|모든 항목|y|이동|
|조회|/happy/read|get|bno=?|||
|삭제 처리|/happy/remove|post|bno|y|이동|
|수정 처리|/happy/modify|post|모든 항목|y|이동|
