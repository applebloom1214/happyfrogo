<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header2.jsp"%>
<div class="searchi" align="center">
	<br> <h4><b>현 시각 미세먼지 정보</b></h4>
	<p id="show"></p>
	<div>
	 <table>
	  <tr>
	  <th>원종동</th>
	  <th>&nbsp;${finedust.value}</th>
	  <th>&nbsp;${finedust.status}
	   <c:if test="${finedust.status=='좋음'}">
	   <img src="/resources/img/1.png" width="30px" height="30px" id="header">
	   </c:if>
	   <c:if test="${finedust.status=='보통'}">
	   <img src="/resources/img/2.png" width="30px" height="30px" id="header">
	   </c:if>
	   <c:if test="${finedust.status=='나쁨'}">
	   <img src="/resources/img/3.png" width="30px" height="30px" id="header">
	   </c:if>
	  
	  </th>
	  </tr>
	 </table>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">유머 게시판</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		<form id='sortForm' action="/happy/list" method='get'>
			<div class="panel-heading">
				정렬
			
			<input type='hidden' name='sort' value=''>
			<button id='latest' type="button" class="btn btn-xs btn-primary">최신순</button>	
			<button id='score' name='score' type="button" class="btn btn-xs btn-success">평점 TOP 10</button>
			<button id='replycnt' name='replycnt' type="button" class="btn btn-xs btn-info">댓글 TOP 10</button>
			<sec:authorize access="isAuthenticated()">
				<button id='regBtn' type="button" class="btn btn-xs pull-right">글쓰기</button>
			</sec:authorize>	
			</div>
			</form>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="board">
						<tr>
							<td><c:out value="${board.bno}" /></td>


							<td><a class='move' href='<c:out value="${board.bno}"/>'>
									<c:out value="${board.title}" /><b> [ <c:out
											value="${board.replyCnt}" /> ]
								</b>
							</a></td>

							<td><c:out value="${board.writer}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate}" /></td>
						</tr>
					</c:forEach>
				</table>

				<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/happy/list" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
									or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
									or 내용 or 작성자</option>
							</select> <input type='text' name='keyword'
								value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
								type='hidden' name='pageNum'
								value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
								type='hidden' name='amount'
								value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>Search</button>
						</form>
					</div>
				</div>


				<div class='pull-right'>
					<ul class="pagination">


						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>


					</ul>
				</div>
				<!--  end Pagination -->
			</div>


			<form id='actionForm' action="/happy/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

				<input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type }"/>'> <input
					type='hidden' name='keyword'
					value='<c:out value="${ pageMaker.cri.keyword }"/>'>


			</form>


			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Happy Frog</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->


		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->






<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var result = '<c:out value="${result}"/>';

						checkModal(result);

						history.replaceState({}, null, null);
						// 뒤로가기 시 mordal이 뜨는 문제를 history 객체를 조작하여 해결

						//Mordal 처리 메소드	
						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}//checkModal
						
						$.ajax({
					        type: "get",
					        url: "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty?stationName=%EC%98%A4%EC%A0%95%EB%8F%99&dataTerm=month&pageNo=1&numOfRows=10&ServiceKey=HAHWbQC9svofCnpJsgZiBSeg4sU3LFoq5zELqy%2B2XkQUSKDU673yZd98nu99GDisXXSzXiY7cHcXjhu9IYRf2Q%3D%3D&ver=1.3",
					        success:function(data){
					            $('#show').html(JSON.stringify(data));
					        }
					    })

						//등록 버튼을 눌렀을 대 이벤트
						$("#regBtn").on("click", function(e) {

							e.preventDefault();
							self.location = "/happy/register";
							//self = 현재창 자신 window와 같음
						});
						
						//최신순 버튼 클릭 이벤트
						$("#latest").on("click", function(e) {

							e.preventDefault();
							self.location = "/happy/list";
							//self = 현재창 자신 window와 같음
						});
						
						//평점순 버튼 클릭 이벤트
						$("#score").on("click", function(e) {

							var sortForm = $("#sortForm");
							e.preventDefault();
							sortForm.find("input[name='sort']")
							.val($(this).attr("name"));
							sortForm.submit();
							
						});
						
						//댓글순 버튼 클릭 이벤트
						$("#replycnt").on("click", function(e) {

							var sortForm = $("#sortForm");
							e.preventDefault();
							sortForm.find("input[name='sort']")
							.val($(this).attr("name"));
							sortForm.submit();
						});

						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='bno' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/happy/get");
											actionForm.submit();

										});

						var searchForm = $("#searchForm");

						$("#searchForm button").on(
								"click",
								function(e) {

									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();

									searchForm.submit();

								});//searchForm button

					});
</script>






<%@include file="../includes/footer.jsp"%>
