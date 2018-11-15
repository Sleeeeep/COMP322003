<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMP322003-14조</title>
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
	function checkPW() {
		var pw = document.getElementById("password");

		if (!pw.value) {
			alert("비밀번호를 입력하세요.");
			pw.focus();
			return false;
		}

		pw = new String(pw.value);
		var sessionPW = (${sessionScope.sessionPW});
		
		if (pw != sessionPW) {
			alert("비밀번호를 확인해주세요.");
			pw.focus();
			return false;
		} else
			window.location.href = 'setInfo.jsp';
	}
</script>
</head>
<body>
	<%
		if (session.getAttribute("sessionID") == null) {
			out.println("<script>alert(\"로그인이 필요합니다.\");");
			out.print("window.location.href = 'login.jsp';</script>");
		}
	%>
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

	<div class="loginContent">
		1IfX1gT<input type="hidden" name="pwCheck" value="false"><br> <br> <br>
		<table>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="password" maxlength="15"
					placeholder="Password"></td>
				<td><input type="button" value="확인" onclick="checkPW()" /></td>
			</tr>
		</table>
	</div>
</body>
</html>
