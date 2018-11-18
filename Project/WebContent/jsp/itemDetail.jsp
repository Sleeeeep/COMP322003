<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMP322003-14조</title>
<link rel="stylesheet" href="../css/menu.css" />
<style>
#Content {
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
}
</style>
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
	<div id="Content">
		<table>
			<tr>
				<td colspan="6" style="font-size: 20px; font-weight: bold">물품목록</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2"><select id="Large" name="large"
					onchange="changeLarge()">
						<option value="">대분류</option>
				</select> <select id="Middle" name="middle" onchange="changeMiddle()">
						<option value="">중분류</option>
				</select> <select id="Small" name="small">
						<option value="">소분류</option>
				</select>
					<button onclick="categorySearch()">조회</button></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><input type="text" name="searchTxt" placeholder="물품명"></td>
				<td><button onclick="searchBtn()">검색</button></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<%
				Connection conn;
				String query = "";
				PreparedStatement pstmt;
				ResultSet rs;
				ResultSetMetaData rsmd;

				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				try {
					String url = "jdbc:mysql://localhost/project?allowPublicKeyRetrieval=true&useSSL=false&user=knu&password=comp322";
					conn = DriverManager.getConnection(url);

					if (request.getParameter("msg") != null)
						query = "SELECT Code, Name, Price, Measure, Stock, Bname, Large, Middle, Small FROM (SELECT * FROM ITEM JOIN CATEGORY ON Small=Category) I"
								+ " JOIN (SELECT Item, Bname FROM BRAND_ITEM JOIN BRAND ON Bno=Bnumber) B ON Code=Item AND Name='"+request.getParameter("msg")+"'";
					else
						response.sendRedirect("item.jsp");
					
					System.out.println(query);
					pstmt = conn.prepareStatement(query);
					rs = pstmt.executeQuery();
					rsmd = rs.getMetaData();

					out.println("</script>");
					out.println("<th>코드</th>");
					out.println("<th>물품명</th>");
					out.println("<th colspan=\"2\">가격</th>");
					out.println("<th>단위</th>");
					out.println("<th>재고</th>");
					out.println("<th>브랜드</th>");
					out.println("<th colspan=\"3\">분류</th>");

					System.out.println(query);
					pstmt = conn.prepareStatement(query);
					rs = pstmt.executeQuery();
					rsmd = rs.getMetaData();

					while (rs.next()) {
						out.println("<tr>");
						out.println("<td>" + rs.getString(1) + "</td>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td colspan=\"2\">" + rs.getString(3) + "</td>");
						out.println("<td>" + rs.getString(4) + "</td>");
						out.println("<td>" + rs.getString(5) + "</td>");
						out.println("<td>" + rs.getString(6) + "</td>");
						out.println("<td>" + rs.getString(7) + "</td>");
						out.println("<td>" + rs.getString(8) + "</td>");
						out.println("<td>" + rs.getString(9) + "</td>");
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
