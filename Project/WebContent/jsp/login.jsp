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
.loginContent {
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
}
</style>
<script>
	function checkValue() {
		inputForm = eval("document.loginInfo");
		if (!inputForm.id.value) {
			alert("아이디를 입력하세요");
			inputForm.id.focus();
			return false;
		}
		if (!inputForm.password.value) {
			alert("비밀번호를 입력하세요");
			inputForm.password.focus();
			return false;
		}
	}
</script>
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
			<li><a class="menuLink" href="order.jsp">주문</a></li>
			<li><a class="menuLink" href="setting.jsp">설정</a></li>
			<%
				if (session.getAttribute("sessionID") == null)
					out.println("<li><a class=\"menuLink\" href=\"login.jsp\">로그인</a></li>");
				else
					out.println("<li><a class=\"menuLink\" href=\"login.jsp\">로그아웃</a></li>");
			%>
		</ul>
	</nav>
	<div class="loginContent">
		zQKog/1IfX1gT
		<form name="loginInfo" method="post" action="loginProcess.jsp"
			onsubmit="return checkValue()">
			<br>
			<br>
			<br>
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" maxlength="20"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" maxlength="15"></td>
				</tr>
			</table>
			<br> <input type="submit" value="로그인" /> <input type="button"
				value="회원가입" onclick="location.href='register.jsp'" />
		</form>
	</div>

	<%
		String msg = request.getParameter("msg");
		if (msg != null && msg.equals("0"))
			out.println("<script>alert(\"비밀번호를 확인하세요.\")</script>");
		else if (msg != null && msg.equals("-1"))
			out.println("<script>alert(\"아이디를 확인하세요.\")</script>");
	%>

</body>
</html>