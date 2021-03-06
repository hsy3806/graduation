<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
<%@page import="mail.receiveBean"%>
<jsp:useBean id="rMgr" class="mail.receiveMgr" scope="session" />
<%@page import="java.util.Vector"%>
<%@page import="member.LogonDataBean"%>
<%@ page import="member.LogonDBBean"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String)session.getAttribute("id");

	LogonDBBean manager = LogonDBBean.getInstance(); //회원정보 수정 처리 메소드 호출 후 수정 상황값 반환
	LogonDBBean mMgr = LogonDBBean.getInstance();

		request.setCharacterEncoding("EUC-KR");
		int totalRecord = 0; //전체레코드수 
		int numPerPage = 5; // 페이지당 레코드 수 
		int pagePerBlock = 15; //블럭당 페이지수
		int totalPage = 0; //전체 페이지 수 
		int totalBlock = 0; //전체 블럭수
		int nowPage = 1; // 현재페이지 
		int nowBlock = 1; //현재블럭
		int start = 0; //디비의 select 시작번호 
		int end = 10; //시작번호로 부터 가져올 select 갯수
		int listSize = 0; //현재 읽어온 게시물의 수 
		int newMessage = rMgr.getNewmessage(id); 

		Vector<LogonDataBean> vlist = null;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		start = (nowPage * numPerPage) - numPerPage;
		end = start + numPerPage;
		totalRecord = mMgr.getTotalCount();

		totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //전체페이지수 
		nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //현재블럭 계산 
		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //전체블럭계산
	%>
<script type="text/javascript">

	
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
	
	function list() {
		document.listFrm.action= "index_adminLoginAfter.jsp";
		document.listFrm.submit();
		}
		function pageing(page) {
		location.href="index_adminLoginAfter.jsp?nowPage="+page;
		}
		function block(value) {
		var pagePerBlock=<%=pagePerBlock%> * (value-1) + 1;
		location.href="index_adminLoginAfter.jsp?nowPage="+pagePerBlock;

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

	
		<title>Tomorrow is...</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin" rel="stylesheet" type="text/css">

	</head>

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="Home.jsp" class="logo">Tomorrow is...</a>
						<a href="admin_report.jsp">신고관리</a>
						<a href="3.QnA.jsp">QnA</a>
						<a href="4.notice_list.jsp">Notice</a>
						<a href="javascript:logout()"><font color="red">Logout</a> </font>
				</div>
			</header>
			
		<!-- Banner -->
			<!-- Banner -->
			<section id="banner">
				<div class="inner">

					<div class="flex">

						<div>
						<%if( newMessage!=0 ){ %>
							<input type="image" src="images/icons/siren_rhksflwk.gif" width="40px" onclick="location.href='admin_report.jsp'">
							<% }
						else{%>
							<input type="image" src="images/icons/alarm_rhksflwk.png" width="40px" onclick="location.href='admin_report.jsp'"/>
							<%}%>
							<h3>신고관리</h3>
							
						</div>
						<div>
							<input type="image" src="images/icons/question2.png" width="35px" onclick="location.href='3.QnA.jsp'"/>
							<h3>QnA관리</h3>
						</div>

						<div>
							<input type="image" src="images/icons/microphone.png" width="35px"  onclick="location.href='4.notice_list.jsp'"/>
							<h3>공지사항</h3>
						</div>
					</div>
						
							
</center>
			</section><br><br>
			
<table>
			<colgroup>
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>ID</th>
					<th>Password</th>
					<th>Email</th>
					<th>Report</th>
				</tr>
			</thead>

			<tbody>
			<% 
  vlist = mMgr.getUserList(start, end); 
  listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
  if (vlist.isEmpty()) { 
  %>
		<tr>
			<td colspan="4" align="center">등록된 회원이 없습니다 .</td>
		</tr>
		<% 
  } else { 
	  for (int i = 0; i < numPerPage; i++) { 
		  if (i == listSize) break; 
		  LogonDataBean bean = vlist.get(i); 
		  int idx = bean.getIdx(); 
		  String mem=bean.getId();
		  String password=bean.getPassword();
		  String email=bean.getEmail();
		  int report=bean.getReport();
		  %>
		<tr>
			<td><%=totalRecord - ((nowPage - 1) * numPerPage) - i%></td>
			<td><%=mem%></td>
			<td><%=password%></td>
			<td><%=email%></td>
			<td><%=report%></td>
		</tr>
		<% 
		  } // for 
	  } //if 
	  %>
			</tbody>
		</table>
		
			<br><center>
			
	<%
int pageStart= (nowBlock-1) * pagePerBlock+ 1; //하단페이지시작번호
int pageEnd= ((pageStart+ pagePerBlock) < totalPage) ? (pageStart+ pagePerBlock) : totalPage+ 1;
//하단페이지끝번호
if(totalPage!= 0) {
if(nowBlock> 1) {
%>
<a href="javascript:block('<%=nowBlock-1%>')">[이전]</a>
<%} %>&nbsp;
<% for(; pageStart< pageEnd; pageStart++) { %>
<a href="javascript:pageing('<%=pageStart%>')">
<% if(pageStart== nowPage) {%>
<font color="blue"><Strong>
<%} %>[<%=pageStart%>] 
<%if(pageStart== nowPage) {%></Strong></font>
<%} %></a>
<% } //for
%>&nbsp;
<% if(totalBlock> nowBlock) { %>
<a href="javascript:block('<%=nowBlock+ 1%>')">[다음]</a>
<%} %>&nbsp;
<%}%>	
<form name="listFrm" method="post" >
<input type="hidden" name="reload" value="true">
<input  type="hidden" name="nowPage" value="1">
</form>
<form name="readFrm" id="readFrm" method="get" >
<input type="hidden" name="pagefile" value="3.QnA">
<input type="hidden" name="idx">
<input type="hidden" name="nowPage" id="nowPage" value="<%=nowPage%>">
</form>
		
		
		
		
		</center><br><br>
	</div>

	
		

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>