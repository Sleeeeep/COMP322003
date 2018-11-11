<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>COMP322004-14조</title>
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
			<a class="topTitleLink" href="main.html">14조 2013105046 박재운 &
				2014105081 전우혁</a>
		</h2>
	</div>
	<nav id="topMenu">
		<ul>
			<li><a class="menuLink" href="../html/item.html">물품</a></li>
			<li><a class="menuLink" href="../html/shoppingcart.html">장바구니</a></li>
			<li><a class="menuLink" href="../html/order.html">주문</a></li>
			<li><a class="menuLink" href="login.jsp">로그인</a></li>
			<li><a class="menuLink" href="../html/manage.html">관리</a></li>
		</ul>
	</nav>
	<div class="loginInput">
		<p>
			ID : <input type="text" name="login_id"><br />
		</p>
		<p>
			PW: <input type="text" name="login_pw"><br />
		</p>
		<input type="submit" value="로그인"/>
		<input type="button" value="회원가입" onclick="location.href='register.jsp'"/>
	</div>

</body>
</html>