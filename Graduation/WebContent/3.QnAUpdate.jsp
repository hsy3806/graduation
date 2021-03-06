<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="QnA.QnABean" %>
    <%
    int idx=Integer.parseInt(request.getParameter("idx"));
    String nowPage=request.getParameter("nowPage");
    QnABean bean=(QnABean)session.getAttribute("bean");
    String title=bean.getTitle();
    String contents=bean.getContents();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">
		<link rel="icon" type="image/png" href="images/icons/favicon_main.ico"/>
<title>QnA 수정 : Tomorrow is...</title>
<script type="text/javascript">

function check() {
	
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
	if(<%=bean.getSecret()%>==1){
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
 %> 
		<a href="#navPanel" class="navPanelToggle"><span
			class="fa fa-bars"></span></a>
	</div>
	</header>
		
<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
					<img src="images/icons/question.png" width="30px" /><br><br>
							<h3>QnA</h3>
							<p>아, 문의사항에서 빠지면 안 될 걸 빼놓고 적으셨군요?<br>
							 </p>
						
					</p>
				</div>
			</div>
		</div>
		</section>
<br><br><br>
<form name="updqteFrm" method="post" action="3.QnAUpdateProcess.jsp" onsubmit="check()">
<input type="hidden" name="nowPage" value="<%=nowPage %>">
<input type="hidden" name="idx" value="<%=idx%>">
<input type="hidden" name="depth" value="<%=bean.getDepth()%>">

				<div class="inner">
			<div class="field">
					
					<label for="name">문의 제목(수정)</label>
					<textarea rows="3" cols="250" name="title" id="title"><%=bean.getTitle()%></textarea>
				<br><br>
					<label for="name">문의 내용(수정)</label>
					<td><textarea rows="10" cols="250" name="contents"
							id="contents"><%=bean.getContents()%></textarea>
			
				<%if((bean.getSecret()==1) && !session.getAttribute("id").equals("rhksflwk")) {%>
				<br><br>
				<p align="center"><input type="password" id="pwd" name="pwd" style="width:30%;"><br>비밀번호 4자리를 입력해주세요</p>
				
				<%} %>

		
			<center>
			
					<br> <br>
				<div class="Button">
				<input type="submit" value="수정하기">
				<input type="button" value="돌아가기" onclick="location.href='3.QnARead.jsp?idx=<%=idx%>'">
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