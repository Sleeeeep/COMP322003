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
.Content {
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
}
</style>
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
	<div id="Content">
		<table>
			<tr>
				<td>${sessionScope.sessionName}님&nbsp;구매내역입니다.</td>
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

					query = "SELECT Onumber, Name, Stime, Ctime FROM ORDERS JOIN (SELECT Ono, Name FROM ORDER_LIST JOIN ITEM ON Item = Code) OI ON Onumber=Ono AND Cid="
							+ session.getAttribute("sessionID");
					
					pstmt = conn.prepareStatement(query);
					rs = pstmt.executeQuery();
					rsmd = rs.getMetaData();

					for (int i = 1; i <= rsmd.getColumnCount(); i++)
						out.println("<th>" + rsmd.getColumnName(i) + "</th>");
					while (rs.next()) {
						out.println("<tr>");
						out.println("<td>" + rs.getString(1) + "</td>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(3) + "</td>");
						out.println("<td>" + rs.getString(4) + "</td>");
						out.println("</tr>");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			%>
		</table>
	</div>
</body>
</html>
