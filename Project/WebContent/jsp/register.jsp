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
.regContent {
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
}

.must {
	color: red;
}
</style>
<script>
	function checkValue() {
		if (!document.userInfo.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.userInfo.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.userInfo.password.value != document.userInfo.passwordcheck.value) {
			alert("비밀번호를 다시 확인해주세요.");
			return false;
		}

		if (!document.userInfo.name.value) {
			alert("이름을 입력하세요.")
			return false;
		}
		if (!document.userInfo.phone1.value || !document.userInfo.phone2.value
				|| !document.userInfo.phone1.value) {
			alert("휴대전화를 정확히 입력하세요.");
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
					out.println("<li><a class=\"menuLink\" href=\"logoutProcess.jsp\">로그아웃</a></li>");
			%>
		</ul>
	</nav>

	<div class="regContent">
		<h2>회원가입</h2>
		<form method="post" action="registerProcess.jsp" name=userInfo 
			onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title" class="must">아이디</td>
					<td><input type="text" name="id" maxlength="20"
						placeholder="20자이내"></td>
				</tr>

				<tr>
					<td id="title" class="must">비밀번호</td>
					<td><input type="password" name="password" maxlength="15"
						placeholder="15자이내"></td>
				</tr>

				<tr>
					<td id="title" class="must">비밀번호 확인</td>
					<td><input type="password" name="passwordcheck" maxlength="15">
					</td>
				</tr>

				<tr>
					<td id="title" class="must">이름</td>
					<td><input type="text" name="name" maxlength="5"></td>
				</tr>

				<tr>
					<td id="title">성별</td>
					<td><input type="radio" name="gender" value="남자" checked>남자
						<input type="radio" name="gender" value="여자">여자</td>
				</tr>

				<tr>
					<td id="title">생일</td>
					<td><input type="text" name="birthyy" maxlength="4"
						placeholder="년(4자)" size="6"> <select name="birthmm">
							<option value="">월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
					</select> <input type="text" name="birthdd" maxlength="2" placeholder="일"
						size="4"></td>
				</tr>

				<tr>
					<td id="title">직업군</td>
					<td><select name="userType">
							<option value="">선택안함</option>
							<option value="소매업">소매업</option>
							<option value="도매업">도매업</option>
					</select></td>
				</tr>

				<tr>
					<td id="title" class="must">휴대전화</td>
					<td><input type="text" name="phone1" maxlength="3" />- <input
						type="text" name="phone2" maxlength="4" />- <input type="text"
						name="phone3" maxlength="4" /></td>
				</tr>
				<tr>
					<td id="title">주소</td>
					<td><input type="text" size="50" name="address" /></td>
				</tr>
			</table>
			<br> <input type="submit" value="가입" /> <input type="button"
				value="취소" onclick="location.href='login.jsp'">
		</form>
	</div>
	<%
		String msg = request.getParameter("msg");
		if (msg != null && msg.equals("-1"))
			out.println("<script>alert(\"이미 존재하는 아이디입니다.\")</script>");
	%>
</body>
</html>