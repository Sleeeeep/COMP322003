<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>COMP322004-14��</title>
<link rel="stylesheet" href="../css/menu.css" />
<style>
.loginContainer {
	width: 1920px;
	height: 900px;
	padding: 0px;
	margin: 0px;
}

.loginInput {
	vertical-align: middle;
	text-align: center;
}
</style>
</head>

<body>
	<div class="topTitle">
		<h2>
			<a class="topTitleLink" href="main.html">14�� 2013105046 ����� &
				2014105081 ������</a>
		</h2>
	</div>
	<nav id="topMenu">
		<ul>
			<li><a class="menuLink" href="../html/item.html">��ǰ</a></li>
			<li><a class="menuLink" href="../html/shoppingcart.html">��ٱ���</a></li>
			<li><a class="menuLink" href="../html/order.html">�ֹ�</a></li>
			<li><a class="menuLink" href="login.jsp">�α���</a></li>
			<li><a class="menuLink" href="../html/manage.html">����</a></li>
		</ul>
	</nav>
	<div class="loginInput">
		<p>
			ID : <input type="text" name="login_id"><br />
		</p>
		<p>
			PW: <input type="text" name="login_pw"><br />
		</p>
		<input type="submit" value="�α���"/>
		<input type="button" value="ȸ������" onclick="location.href='register.jsp'"/>
	</div>

</body>
</html>