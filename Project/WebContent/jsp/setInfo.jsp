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
#setting {
	float: left;
	width: 1920px;
	height: 300px;
}

#setting .left {
	display: inline-block;
	widht: 30%;
	height: 100%;
}

#setting .right {
	width: 70%;
	height: 100%;
	display: inline-block;
}

#leftMenu {
	margin: 0px;
	padding: 0px;
	height: 100px;
	width: 300px;
	border-collapse: separate;
	border-spacing: 0px;
	margin: 0px;
}

#leftMenu tr {
	padding: 0px;
	margin: 0px;
	height: 48px;
}

#leftMenu td {
	vertical-align: middle;
	height: 45px;
	border-bottom: 1px solid #808080;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

#leftMenu button {
	width: 100%;
	height: 100%;
	background-color: #ffffff;
	margin: 0px;
	padding: 0px;
	border: 0;
	outline: 0;
	font-size: 15px;
	font-weight: bold;
	border: 0;
	cursor: pointer;
	display: block;
	border: 0;
	padding: 0px;
}

#leftMenu button:hover {
	color: #ffffff;
	background-color: #808080;
}

.right table {
	margin-left: auto;
	margin-right: auto;
}

.must {
	color: red;
}
</style>
<script>
	function checkValue() {
		if (!document.userInfo.name.value) {
			alert("이름을 입력하세요.");
			return false;
		}
		if (!document.userInfo.phone1.value || !document.userInfo.phone2.value
				|| !document.userInfo.phone1.value) {
			alert("휴대전화를 정확히 입력하세요.");
			return false;
		}
		if (document.userInfo.birthyy.value) {
			if (isNaN(document.userInfo.birthyy.value)) {
				alert("년도는 숫자만 입력가능합니다.");
				return false;
			} else if (!document.userInfo.birthmm.value
					|| !document.userInfo.birthdd.value) {
				alert("생년월일을 정확히 입력해주세요.");
				return false;
			}
		}
		if (document.userInfo.birthdd.value) {
			if (!document.userInfo.birthyy.value
					|| !document.userInfo.birthdd.value) {
				alert("생년월일을 정확히 입력해주세요.");
				return false;
			}
		}
		if (document.userInfo.birthdd.value) {
			if (isNaN(document.userInfo.birthdd.value)) {
				alert("일은 숫자만 입력가능합니다.");
				return false;
			} else if (!document.userInfo.birthyy.value
					|| !document.userInfo.birthmm.value) {
				alert("생년월일을 정확히 입력해주세요.");
				return false;
			}
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
			<li><a class="menuLink" href="order.jsp">구매내역</a></li>
			<li><a class="menuLink" href="setting.jsp">설정</a></li>
			<%
				if (session.getAttribute("sessionID") == null)
					out.println("<li><a class=\"menuLink\" href=\"login.jsp\">로그인</a></li>");
				else
					out.println("<li><a class=\"menuLink\" href=\"logoutProcess.jsp\">로그아웃</a></li>");
			%>
		</ul>
	</nav>
	<br>
	<br>
	<br>
	<br>
	<div id="setting">
		<div class="left">
			<table id=leftMenu>
				<tr>
					<td>설 정</td>
				</tr>
				<tr>
					<td><button onclick="location.href='setInfo.jsp'">내
							정보 수정</button></td>
				</tr>
				<tr>
					<td><button onclick="location.href='setPW.jsp'">비밀번호
							변경</button></td>
				</tr>

			</table>
		</div>
		<div class="right">
			<form method="post" action="setProcess.jsp?msg=1" name=userInfo
				onsubmit="return checkValue()">
				<table>
					<tr>
						<td id="title" class="must">이름</td>
						<td><input type="text" name="name" maxlength="5"
							value=${sessionScope.sessionName}></td>
					</tr>

					<tr>
						<td id="title">성별</td>
						<td>
							<%
								if (session.getAttribute("sessionSex").equals("")) {
									out.print(
											"<input type=\"radio\" name=\"sex\" value=\"남자\">남자  <input type=\"radio\" name=\"sex\" value=\"여자\">여자");
								} else if (session.getAttribute("sessionSex").equals("남자")) {
									out.print(
											"<input type=\"radio\" name=\"sex\" value=\"남자\" checked>남자  <input type=\"radio\" name=\"sex\" value=\"여자\">여자");
								} else {
									out.print(
											"<input type=\"radio\" name=\"sex\" value=\"남자\">남자  <input type=\"radio\" name=\"sex\" value=\"여자\" checked>여자");
								}
							%>
						</td>
					</tr>

					<tr>
						<td id="title">생일</td>
						<td><input type="text" name="birthyy" maxlength="4"
							placeholder="년(4자)" size="6" value=${sessionScope.sessionYy}>
							<select name="birthmm">
								<option value="">월</option>
								<%
									if (session.getAttribute("sessionMm").equals("01"))
										out.print("<option value=\"01\" selected>1</option>");
									else
										out.print("<option value=\"01\">1</option>");

									if (session.getAttribute("sessionMm").equals("02"))
										out.print("<option value=\"02\" selected>2</option>");
									else
										out.print("<option value=\"02\">2</option>");

									if (session.getAttribute("sessionMm").equals("03"))
										out.print("<option value=\"03\" selected>3</option>");
									else
										out.print("<option value=\"03\">3</option>");

									if (session.getAttribute("sessionMm").equals("04"))
										out.print("<option value=\"04\" selected>4</option>");
									else
										out.print("<option value=\"04\">4</option>");

									if (session.getAttribute("sessionMm").equals("05"))
										out.print("<option value=\"05\" selected>5</option>");
									else
										out.print("<option value=\"05\">5</option>");

									if (session.getAttribute("sessionMm").equals("06"))
										out.print("<option value=\"06\" selected>6</option>");
									else
										out.print("<option value=\"06\">6</option>");

									if (session.getAttribute("sessionMm").equals("07"))
										out.print("<option value=\"07\" selected>7</option>");
									else
										out.print("<option value=\"07\">7</option>");

									if (session.getAttribute("sessionMm").equals("08"))
										out.print("<option value=\"08\" selected>8</option>");
									else
										out.print("<option value=\"08\">8</option>");

									if (session.getAttribute("sessionMm").equals("09"))
										out.print("<option value=\"09\" selected>9</option>");
									else
										out.print("<option value=\"09\">9</option>");

									if (session.getAttribute("sessionMm").equals("10"))
										out.print("<option value=\"10\" selected>10</option>");
									else
										out.print("<option value=\"10\">10</option>");

									if (session.getAttribute("sessionMm").equals("11"))
										out.print("<option value=\"11\" selected>11</option>");
									else
										out.print("<option value=\"11\">11</option>");

									if (session.getAttribute("sessionMm").equals("12"))
										out.print("<option value=\"12\" selected>12</option>");
									else
										out.print("<option value=\"12\">12</option>");
								%>
						</select> <input type="text" name="birthdd" maxlength="2" placeholder="일"
							size="4" value=${sessionScope.sessionDd}></td>
					</tr>
					<tr>
						<td id="title">직업</td>
						<td><input type="text" name="job" maxlength="20"
							value=${sessionScope.sessionJob}></td>
					</tr>
					<tr>
						<td id="title">직업군</td>
						<td><select name="userType">
								<%
									if (session.getAttribute("sessionType").equals("")) {
										out.print("<option value=\"\" selected>선택안함</option>");
										out.print("<option value=\"소매업\">소매업</option>");
										out.print("<option value=\"도매업\">도매업</option>");
									} else if (session.getAttribute("sessionType").equals("소매업")) {
										out.print("<option value=\"\" >선택안함</option>");
										out.print("<option value=\"소매업\" selected>소매업</option>");
										out.print("<option value=\"도매업\">도매업</option>");
									} else {
										out.print("<option value=\"\" >선택안함</option>");
										out.print("<option value=\"소매업\">소매업</option>");
										out.print("<option value=\"도매업\" selected>도매업</option>");
									}
								%>
						</select></td>
					</tr>

					<tr>
						<td id="title" class="must">휴대전화</td>
						<td><input type="text" name="phone1" maxlength="3"
							value=${sessionScope.sessionP1} >- <input type="text"
							name="phone2" maxlength="4" value=${sessionScope.sessionP2} >-
							<input type="text" name="phone3" maxlength="4"
							value=${sessionScope.sessionP3} ></td>
					</tr>
					<tr>
						<td id="title">주소</td>
						<td><input type="text" size="50" name="address"
							value=${sessionScope.sessionAdd} ></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="수정" />&nbsp;&nbsp;&nbsp;
							<button>취소</button></td>
					</tr>
				</table>
			</form>
		</div>

	</div>
</body>
</html>
