<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>COMP322004-14��</title>
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
			alert("���̵� �Է��ϼ���");
			inputForm.id.focus();
			return false;
		}
		if (!inputForm.password.value) {
			alert("��й�ȣ�� �Է��ϼ���");
			inputForm.password.focus();
			return false;
		}
	}
</script>
</head>

<body>
	<div class="topTitle">
		<h2>
			<a class="topTitleLink" href="../html/main.html">14�� 2013105046 ����� &
				2014105081 ������</a>
		</h2>
	</div>
	<nav id="topMenu">
		<ul>
			<li><a class="menuLink" href="item.jsp">��ǰ</a></li>
			<li><a class="menuLink" href="shoppingcart.jsp">��ٱ���</a></li>
			<li><a class="menuLink" href="order.jsp">�ֹ�</a></li>
			<li><a class="menuLink" href="login.jsp">�α���</a></li>
			<li><a class="menuLink" href="setting.jsp">����</a></li>
		</ul>
	</nav>
	<div class="loginContent">
		<form name="loginInfo" method="post" action="loginProcess.jsp"
			onsubmit="return checkValue()">
			<br><br><br>
			<table>
				<tr>
					<td>���̵�</td>
					<td><input type="text" name="id" maxlength="20"></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" name="password" maxlength="15"></td>
				</tr>
			</table>
			<br> <input type="submit" value="�α���" /> <input type="button"
				value="ȸ������" onclick="location.href='register.jsp'" />
		</form>
	</div>
	
	<%
		String msg = request.getParameter("msg");
	if(msg!=null && msg.equals("0")) 
		out.println("<script>alert(\"��й�ȣ�� Ȯ���ϼ���.\")</script>");
    else if(msg!=null && msg.equals("-1"))
    	out.println("<script>alert(\"���̵� Ȯ���ϼ���.\")</script>");
	%>

</body>
</html>