<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>COMP322004-14��</title>
<link rel="stylesheet" href="../css/menu.css" />
<style>
.regContent {
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
}
</style>
<script>
	function checkValue() {
		if (!document.userInfo.id.value) {
			alert("���̵� �Է��ϼ���."); 
			return false;
		}

		if (!document.userInfo.password.value) {
			alert("��й�ȣ�� �Է��ϼ���.");
			return false;
		}

		if (document.userInfo.password.value != document.userInfo.passwordcheck.value) {
			alert("��й�ȣ�� �ٽ� Ȯ�����ּ���.");
			return false;
		}
		if (!document.userInfo.phone1.value || !document.userInfo.phone2.value || !document.userInfo.phone1.value) {
			alert("�޴���ȭ�� ��Ȯ�� �Է��ϼ���.");
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
			<li><a class="menuLink" href="../html/item.html">��ǰ</a></li>
			<li><a class="menuLink" href="../html/shoppingcart.html">��ٱ���</a></li>
			<li><a class="menuLink" href="../html/order.html">�ֹ�</a></li>
			<li><a class="menuLink" href="login.jsp">�α���</a></li>
			<li><a class="menuLink" href="../html/manage.html">����</a></li>
		</ul>
	</nav>

	<div class="regContent">
		<h2>ȸ������</h2>
		<form method="post" action="../jsp/register.jsp" name=userInfo
			onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title">���̵�</td>
					<td><input type="text" name="id" maxlength="20"
						placeholder="20���̳�"> <input type="button" value="�ߺ�Ȯ��"></td>
				</tr>

				<tr>
					<td id="title">��й�ȣ</td>
					<td><input type="password" name="password" maxlength="15"
						placeholder="15���̳�"></td>
				</tr>

				<tr>
					<td id="title">��й�ȣ Ȯ��</td>
					<td><input type="password" name="passwordcheck" maxlength="15">
					</td>
				</tr>

				<tr>
					<td id="title">�̸�</td>
					<td><input type="text" name="name" maxlength="5"></td>
				</tr>

				<tr>
					<td id="title">����</td>
					<td><input type="radio" name="gender" value="����" checked>����
						<input type="radio" name="gender" value="����">����</td>
				</tr>

				<tr>
					<td id="title">����</td>
					<td><input type="text" name="birthyy" maxlength="4"
						placeholder="��(4��)" size="6"> <select name="birthmm">
							<option value="">��</option>
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
					</select> <input type="text" name="birthdd" maxlength="2" placeholder="��"
						size="4"></td>
				</tr>

				<tr>
					<td id="title">������</td>
					<td><select name="userType">
							<option value="">���þ���</option>
							<option value="�Ҹž�">�Ҹž�</option>
							<option value="���ž�">���ž�</option>
					</select></td>
				</tr>

				<tr>
					<td id="title">�޴���ȭ</td>
					<td><input type="text" name="phone1" maxlength="3" />- <input
						type="text" name="phone2" maxlength="4" />- <input type="text"
						name="phone3" maxlength="4" /></td>
				</tr>
				<tr>
					<td id="title">�ּ�</td>
					<td><input type="text" size="50" name="address" /></td>
				</tr>
			</table>
			<br> <input type="submit" value="����" /> <input type="button"
				value="���" onclick="location.href='login.jsp'">
		</form>
	</div>
</body>
</html>