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
</head>

<body>
	<%
		if (session.getAttribute("sessionID") == null || !session.getAttribute("sessionID").equals("'admin'")) {
			out.println("<script>alert(\"관리자만 접근 가능합니다.\")");
			out.println("window.location.href = 'main.jsp';</script>");
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
			<li><a class="menuLink" href="order.jsp">구매내역</a></li>
			<%
				if (session.getAttribute("sessionID") != null)
				{
					if (session.getAttribute("sessionID").equals("'admin'"))
						out.println("<li><a class=\"menuLink\" href=\"setting.jsp\">관리</a></li>");
					else
						out.println("<li><a class=\"menuLink\" href=\"setting.jsp\">설정</a></li>");
				}
				else
					out.println("<li><a class=\"menuLink\" href=\"setting.jsp\">설정</a></li>");		
			%>
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
					<td colspan="2" style="font-size: 20px; font-weight: bold">배송현황</td>
				</tr>
				<tr>
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

						out.println("<th>회사명</th>");
						out.println("<th>횟수</th>");

						query = "SELECT SCname, Cnt FROM SHIPPINGCOMPANY JOIN (SELECT SCno, count(*) AS Cnt FROM ORDERS GROUP BY SCno) O ON SCno = SCnumber";
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						rsmd = rs.getMetaData();

						while (rs.next()) {
							out.println("<tr>");
							out.println("<td>" + rs.getString(1) + "</td>");
							out.println("<td>" + rs.getString(2) + "</td>");
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
