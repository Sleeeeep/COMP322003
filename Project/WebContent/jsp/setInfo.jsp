<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMP322004-14조</title>
<link rel="stylesheet" href="../css/menu.css" />
<style>
table {
	margin: 0px;
	padding: 0px;
}

#leftMenu {
	height: 700px;
	width: 400px;
}

#leftMenu td {
	background-color: #4d4d4d;
	vertical-align: middle;
	text-align: center;
	font-size: 15px;
	font-weight: bold;
	color: white;
}
</style>
</head>

<body>
	<div class="topTitle">
		<h2>
			<a class="topTitleLink" href="main.jsp">14조 2013105046 박재운 &
				2014105081 전우혁</a>
		</h2>
	</div>
	<nav id="topMenu">
		<ul>
			<li><a class="menuLink" href="item.jsp">물품</a></li>
			<li><a class="menuLink" href="shoppingcart.jsp">장바구니</a></li>
			<li><a class="menuLink" href="order.jsp">주문확인</a></li>
			<li><a class="menuLink" href="setting.jsp">설정</a></li>
			<%
				if (session.getAttribute("sessionID") == null)
					out.println("<li><a class=\"menuLink\" href=\"login.jsp\">로그인</a></li>");
				else
					out.println("<li><a class=\"menuLink\" href=\"logoutProcess.jsp\">로그아웃</a></li>");
			%>
		</ul>
	</nav>
	<br><br><br><br><br><br>
	<table id=leftMenu>
		<tr>
			<td>내 정보 수정</td>
		</tr>
		<tr>
			<td>비밀번호 변경</td>
		</tr>
		<tr/><tr/><tr/><tr/><tr/><tr/><tr/>
	</table>
</body>
</html>
