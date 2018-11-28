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

.right td {
	vertical-align: middle;
	text-align: center;
}
</style>
<script>
	function categorySearch() {
		var y = document.getElementsByName("yy")[0];
		var m = document.getElementsByName("mm")[0];
		var d = document.getElementsByName("dd")[0];
		var msg = "?";

		if (!y.value && !m.value && !d.value) {
			alert("조회를 원하는 연/월/일을 입력해주세요.");
			return false;
		}
		msg += "year";
		if (y.value) {
			if (isNaN(y.value)) {
				alert("년도는 숫자만 입력가능합니다.");
				return false;
			}
			msg += "=" + y.value;
		}
		msg += "&month";
		if (m.value) {
			if (!y.value) {
				alert("년도를 입력해주세요.");
				return false;
			}
			msg += "=" + m.selectedIndex;
		}
		msg += "&day";
		if (d.value) {
			if (isNaN(d.value)) {
				alert("일은 숫자만 입력가능합니다.");
				return false;
			} else if (!y.value || !m.value) {
				alert("년,월을 입력해주세요.");
				return false;
			}
			msg += "=" + d.value;
		}
		window.location.href = 'viewSales.jsp' + msg;
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
	<div id="setting">
		<div class="left">
			<table id=leftMenu>
				<tr>
					<td>관 리</td>
				</tr>
				<tr>
					<td><button onclick="location.href='manageItem.jsp'">재고관리</button></td>
				</tr>
				<tr>
					<td><button
							onclick="location.href='viewSales.jsp?year&month&day'">매출현황</button></td>
				</tr>
				<tr>
					<td><button onclick="location.href='viewDelivery.jsp'">배송현황</button></td>
				</tr>
			</table>
		</div>
		<div class="right">
			<table>
				<tr>
					<td colspan="6" style="font-size: 20px; font-weight: bold">물품목록</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4"><input type="text" name="yy" maxlength="4"
						placeholder="년(4자)" size="6"
						value="<%out.print(request.getParameter("year"));%>"> <select
						name="mm">
							<option value="">월</option>
							<option value="01"
								<%if (request.getParameter("month").equals("1"))
				out.print("selected");%>>1</option>
							<option value="02"
								<%if (request.getParameter("month").equals("2"))
				out.print("selected");%>>2</option>
							<option value="03"
								<%if (request.getParameter("month").equals("3"))
				out.print("selected");%>>3</option>
							<option value="04"
								<%if (request.getParameter("month").equals("4"))
				out.print("selected");%>>4</option>
							<option value="05"
								<%if (request.getParameter("month").equals("5"))
				out.print("selected");%>>5</option>
							<option value="06"
								<%if (request.getParameter("month").equals("6"))
				out.print("selected");%>>6</option>
							<option value="07"
								<%if (request.getParameter("month").equals("7"))
				out.print("selected");%>>7</option>
							<option value="08"
								<%if (request.getParameter("month").equals("8"))
				out.print("selected");%>>8</option>
							<option value="09"
								<%if (request.getParameter("month").equals("9"))
				out.print("selected");%>>9</option>
							<option value="10"
								<%if (request.getParameter("month").equals("10"))
				out.print("selected");%>>10</option>
							<option value="11"
								<%if (request.getParameter("month").equals("11"))
				out.print("selected");%>>11</option>
							<option value="12"
								<%if (request.getParameter("month").equals("12"))
				out.print("selected");%>>12</option>
					</select> <input type="text" name="dd" maxlength="2" placeholder="일"
						size="4" value="<%out.print(request.getParameter("day"));%>">
						<button onclick="categorySearch()">조회</button></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<%
					Connection conn;
					String query;
					PreparedStatement pstmt;
					ResultSet rs;
					ResultSetMetaData rsmd;
					int check = -1;

					try {
						Class.forName("com.mysql.jdbc.Driver");
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					}
					try {
						String url = "jdbc:mysql://localhost/project?allowPublicKeyRetrieval=true&useSSL=false&user=knu&password=comp322";
						conn = DriverManager.getConnection(url);

						query = "SELECT Code, Name, COUNT(*)*Price FROM ITEM JOIN (SELECT Item, Stime FROM (SELECT Onumber, Stime FROM ORDERS) O JOIN ORDER_LIST ON Onumber=Ono) OL ON Code=Item";

						out.println("<th>코드</th>");
						out.println("<th colspan=\"2\">물품명</th>");
						out.println("<th colspan=\"2\">매출</th>");

						if (request.getParameter("year") != "")
						{
							if(request.getParameter("month") != "")
							{
								if(request.getParameter("day") != "")
									query += " AND Stime='"+request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day")+"'";
								else
									query += " AND Stime>='"+request.getParameter("year")+"-"+request.getParameter("month")+"-1' AND Stime<='"+request.getParameter("year")+"-"+request.getParameter("month")+"-31'";
							}
							else
								query += " AND Stime>='"+request.getParameter("year")+"-1-1' AND Stime<='"+request.getParameter("year")+"-12-31'";
						}
						query += " GROUP BY Code ORDER BY COUNT(*)*Price DESC";
						System.out.println(query);
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						rsmd = rs.getMetaData();

						while (rs.next()) {
							out.println("<tr>");
							out.println("<td>" + rs.getString(1) + "</td>");
							out.println("<td colspan=\"2\">" + rs.getString(2) + "</td>");
							out.println("<td colspan=\"2\">" + rs.getString(3) + "</td>");
							out.println("</tr>");
						}

					} catch (SQLException e) {
						e.printStackTrace();
					}
				%>
			</table>
		</div>

	</div>
</body>
</html>
