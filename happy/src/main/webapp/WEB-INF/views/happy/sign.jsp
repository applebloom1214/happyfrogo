<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Welcome Happy Frog</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

 



	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							회원 가입 후 이용해주세요 ! <img src="/resources/img/frog.png" width="40px"
								height="40px">
						</h3>

					</div>
					<div class="panel-body">
						<form role="form" action="/happy/sign" method="post">
							<fieldset>
								<div class="form-group">
									<input class="form-control"  id="userid" placeholder="ID" name="userid" type="text" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password"
									id="userpw"	name="userpw" type="password">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Nickname"
									id="userName"	name="userName" type="text">
								      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  		
								</div>
                                <input type="hidden" id="result" value="${param.result}"/>  	
								<!-- Change this to a button or input when using this as a form -->
								<button class="btn btn-lg btn-danger btn-block" id="btnsign">가입</button>
								<a href="/" class="btn btn-lg btn-success btn-block">돌아가기</a>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/dist/js/sb-admin-2.js"></script>
	
	

<script type="text/javascript">
	$(document).ready(	function() {
		
		var result = $('#result').val();
		console.log(result);
		if(result == 'success'){
			alert('가입이 되었습니다 !');
		}else if(result =="fail"){
			alert('중복된 아이디입니다');
		}
		
		
		
		
		
		var formObj = $("form");
	

$('#btnsign').on("click", function(e){
		    
	e.preventDefault(); // 모든 버튼의 summit 기본 동작을 막음
		    var userid = $("#userid").val();
		    if(userid.length != 0) userid = 1;
		    userid = parseInt(userid) || 0;
		    console.log(userid);
		    
		    var userpw = $("#userpw").val();
		    if(userpw.length != 0) userpw = 3;
		    userpw = parseInt(userpw) || 0;
		    console.log(userpw);
		    
		    var userName = $("#userName").val();
		    if(userName.length != 0) userName = 5;
		    userName = parseInt(userName) || 0;
		    console.log(userName);
		   
		    var testSign = userid + userpw + userName;
		    console.log(testSign);
		    
		    if(testSign == 4){
		    	alert('닉네임을 입력해주세요');
		    	return;
		    }else if(testSign ==6){
		    	alert('패스워드를 입력해주세요');
		    	return;
		    }else if(testSign ==8){
		    	alert('아이디를 입력해주세요');
		    	return;
		    }else if(testSign ==9){
		    	formObj.submit();
		    }else{
		    	alert('항목을 모두 입력해주세요');
		    	return;
		    }
		        
		    });		 						

					});//end
</script>

</body>

</html>
