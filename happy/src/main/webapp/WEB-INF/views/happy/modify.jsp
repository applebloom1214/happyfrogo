<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header2.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Modify</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Board Modify</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

      <form role="form" action="/happy/modify" method="post">
        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
	    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
      
 
<div class="form-group">
  <label>Bno</label> 
  <input class="form-control" name='bno' 
     value='<c:out value="${board.bno }"/>' readonly="readonly">
</div>

<div class="form-group">
  <label>Title</label> 
  <input class="form-control" name='title' 
    value='<c:out value="${board.title }"/>' >
</div>

<div class="form-group">
  <label>Text area</label>
  <textarea class="form-control" rows="15" name='content' ><c:out value="${board.content}"/></textarea>
</div>

<div class="form-group">
  <label>Writer</label> 
  <input class="form-control" name='writer'
    value='<c:out value="${board.writer}"/>' readonly="readonly">            
</div>

<div class="form-group">
  <label>RegDate</label> 
  <input class="form-control" name='regDate'
    value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regdate}" />'  readonly="readonly">            
</div>

<div class="form-group">
  <label>Update Date</label> 
  <input class="form-control" name='updateDate'
    value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updateDate}" />'  readonly="readonly">            
</div>

          
<!-- data-xxxx 커스텀 속성 -->
  <button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
  <button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
  <button type="submit" data-oper='list' class="btn btn-info">List</button>
</form>


      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

 
<script type="text/javascript">
$(document).ready(function() {


	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); // 모든 버튼의 summit 기본 동작을 막음
	    
	    var operation = $(this).data("oper");
	    // this = 메소드를 호출한 객체 즉 button의 data() 함수로 value를 가져온다
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/happy/remove");
	      //버튼의 액션 속성을 바꿔준다
	      
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/happy/list").attr("method","get");
	      
	        
	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amount']").clone();
	      var keywordTag = $("input[name='keyword']").clone();
	      var typeTag = $("input[name='type']").clone();      
	        
	     formObj.empty(); // 조회 페이지에서 가져온 bno과 필요없는 내용을 비운다.
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	      formObj.append(keywordTag);
	      formObj.append(typeTag);	       
	    }
	    
	    formObj.submit();
	  });

});
</script>





<%@include file="../includes/footer.jsp"%>
