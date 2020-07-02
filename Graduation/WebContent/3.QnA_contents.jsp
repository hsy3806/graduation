<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">

<script type="text/javascript">
function secret_(){ 
	
	document.getElementById("abc").innerHTML = "<p align='center'><input type='password' id='pwd' name='pwd' style='width:30%;'><br>비밀번호 4자리를 입력해주세요</p>" ;
} 
function secret2_(){ 
		document.getElementById("abc").innerHTML = " " ;
		
	} 
function inputCheck() {
	
	if (document.getElementById("title").value=="") {
		alert("제목을 입력해주세요");
		document.getElementById("title").focus();
		return false;
	}
	if (document.getElementById("contents").value=="") {
		alert("내용을 입력해주세요.");
		document.getElementById("contents").value = "";
		document.getElementById("contents").focus();
		return false;
	}
	if(document.getElementById("secret").value=="yes"){
		if(document.getElementById("pwd").value.length !=4)
		{
			alert("비밀번호는 4자리를 입력해주세요.");
			document.getElementById("pwd").value = "";
			document.getElementById("pwd").focus();
			return false;
		}
		}
}
function logout()
{
	if(confirm("로그아웃 하시겠습니까?")==true)
{

	location.href="logout.jsp";
}
	else
{
	return;
}
}
</script>
<title>QnA 작성 : Tomorrow is...</title>
</head>

</head>
<body>
	<!-- Header -->
	<header id="header">
	<div class="inner">
		<a href="Home.jsp" class="logo">Tomorrow is...</a>
			<a href="1.receiveWorry.jsp">받은 편지함</a>
						<a href="1.sendWorry.jsp">보낸 편지함</a>
						<a href="2.answer.jsp">To.오늘의 나</a>
						<a href="3.QnA.jsp">QnA</a>
		<a href="4.notice_list.jsp">Notice</a>
		<%
			if (!(session.getAttribute("id") == null)) {
		%> <a href="javascript:logout()"><font color="red">Logout</a> </font> <%
 	}
 %> </nav>
		<a href="#navPanel" class="navPanelToggle"><span
			class="fa fa-bars"></span></a>
	</div>
	</header>
		
<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
					<img src="images/icons/question.png" width="30px" /><br>
							<h3>QnA 작성</h3>
							<p>문의 사항은 언제든 환영입니다.<br>
							 </p>
						
					</p>
				</div>
			</div>
		</div>
		</section>
<br><br>
<br>
	<form name="form" class="form" method="post" action="3.QnAProcess.jsp" onsubmit = "return inputCheck()">
	
<div class="inner">
			<div class="field">
					
					<label for="name">문의 제목</label>
					<td><textarea rows="3" cols="250" name="title" id="title"></textarea>
				<br><br>
					<label for="name">문의 내용</label>
					<textarea rows="10" cols="250" name="contents"
							id="contents"></textarea>
				<br><br>
					<label for="name"><font color="#11214a">비밀로 할까요?</font>&nbsp;
    <input type="radio" name="secret" value="yes" onclick="secret_()" />YES
    <input type="radio" name="secret" value="no" onclick="secret2_()"  checked/>NO</label>
    

			
			<div id="abc"></div>
</div>
			
			<center>
				
					<br> <br>
				
						<input type="submit" value="작성완료">
					<input type="button" class = "button" value="돌아가기" onclick="location.href='3.QnA.jsp'"> 
						
				</div>

			</center>
		</div>
</form>
	
		<script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();

		}

         </script>
</body>
</html>