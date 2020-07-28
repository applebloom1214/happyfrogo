<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<!DOCTYPE html>
<html lang="en">

<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />


<style type="text/css">

#header{
  margin-top: 8px;
}


 

</style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Happy Frog</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <form role="form" method='get' action="/customLogout">
                <img src="/resources/img/frog.png" width="40px" height="40px" id="header">
                <a class="navbar-brand" href="/">Happy Frog v0.0</a>
         
          
          <sec:authorize access="isAnonymous()">
          <button type="submit" data-oper='sign' class="btn btn-danger" id="header">등록</button>
          <button type="submit" data-oper='login' class="btn btn-success" id="header">로그인</button>
          </sec:authorize>
          
          <sec:authorize access="isAuthenticated()">
          
          <button type="submit" data-oper='logout' class="btn btn-success" id="header">로그아웃</button>
          <input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
          </sec:authorize>
          
          </form>
            </div>
           
           
        </nav>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript">

$(document).ready(function(){
	
	var formObj = $("form");
	
	  $('button#header').on("click", function(e){
		    
		    e.preventDefault(); // 모든 버튼의 summit 기본 동작을 막음
		    
		    var operation = $(this).data("oper");
		    // this = 메소드를 호출한 객체 즉 button의 data() 함수로 value를 가져온다
		    
		    console.log(operation);
		    
		    if(operation === 'sign'){
		      formObj.attr("action", "/happy/sign");
		      //버튼의 액션 속성을 바꿔준다
		      
		    }else if(operation === 'login'){
		      //move to list
		      formObj.attr("action", "/happy/login");
		             
		    }else if(operation === 'logout'){
		    	//formObj.attr("action", "/logout");
		    	formObj.attr("action", "/customLogout");
	        }
		    
		    formObj.submit();
		  });
	<%--
	$("#sign").on("click",function(e){
		console.log("=======");
		location.href = "/happy/sign";
		
	});//sign 버튼 이벤트		
	
	$("#login").on("click",function(e){
		console.log("=======");
		location.href = "/happy/login";
		
	});//sign 버튼 이벤트	 --%>
	
});



</script>