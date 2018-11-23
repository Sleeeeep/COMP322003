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
<script>
	function changeLarge() {
		var large = document.getElementById("Large");
		var middle = document.getElementById("Middle");
		var small = document.getElementById("Small");
		middle.selectedIndex = 0;
		small.selectedIndex = 0;

		for (var i = 1; i < middle.length; i++) {
			middle.options[i].disabled = true;
		}
		for (var i = 1; i < small.length; i++) {
			small.options[i].disabled = true;
		}
		if (large.selectedIndex == 0)
			return;
		middle.options[2 * large.selectedIndex].disabled = false;
		middle.options[2 * large.selectedIndex - 1].disabled = false;
	}

	function changeMiddle() {
		var middle = document.getElementById("Middle");
		var small = document.getElementById("Small");

		small.selectedIndex = 0;

		for (var i = 1; i < small.length; i++) {
			small.options[i].disabled = true;
		}
		if (middle.selectedIndex == 0)
			return;
		small.options[3 * middle.selectedIndex].disabled = false;
		small.options[3 * middle.selectedIndex - 1].disabled = false;
		small.options[3 * middle.selectedIndex - 2].disabled = false;
	}

	function categorySearch() {
		var large = document.getElementById("Large");
		var middle = document.getElementById("Middle");
		var small = document.getElementById("Small");

		var msg = "?large=" + large.selectedIndex;
		msg = msg + "&middle=" + middle.selectedIndex;
		msg = msg + "&small=" + small.selectedIndex;

		window.location.href = 'item.jsp' + msg;
	}

	function searchBtn() {
		window.location.href = 'item.jsp?msg='
				+ (document.getElementsByName("searchTxt"))[0].value;
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
				out.println("<script>");
				Connection conn;
				String query;
				PreparedStatement pstmt;
				ResultSet rs;
				ResultSetMetaData rsmd;
				int check = -1;
				String[] Large = new String[3];
				String[] Middle = new String[6];
				String[] Small = new String[18];
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				try {
					String url = "jdbc:mysql://localhost/project?allowPublicKeyRetrieval=true&useSSL=false&user=knu&password=comp322";
					conn = DriverManager.getConnection(url);

					query = "SELECT distinct Large FROM CATEGORY ORDER BY Large";

					pstmt = conn.prepareStatement(query);
					rs = pstmt.executeQuery();
					rsmd = rs.getMetaData();

					int cnt = 0;
					while (rs.next()) {
						Large[cnt] = rs.getString(1);
						out.println("document.getElementById(\"Large\").options.add(new Option(\"" + Large[cnt] + "\", \""
								+ Large[cnt] + "\"))");
						cnt++;
					}

					cnt = 0;
					for (int i = 0; i < 3; i++) {
						query = "SELECT DISTINCT Middle FROM CATEGORY WHERE Large='" + Large[i] + "'";

						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						rsmd = rs.getMetaData();

						while (rs.next()) {
							Middle[cnt] = rs.getString(1);
							out.println("document.getElementById(\"Middle\").options.add(new Option(\"" + Middle[cnt]
									+ "\", \"" + Middle[cnt] + "\"))");
							cnt++;
							out.println("document.getElementById(\"Middle\").options[" + cnt + "].disabled = true;");
						}
					}

					cnt = 0;
					for (int i = 0; i < 6; i++) {
						query = "SELECT Small FROM CATEGORY WHERE Middle='" + Middle[i] + "'";

						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						rsmd = rs.getMetaData();

						while (rs.next()) {
							Small[cnt] = rs.getString(1);
							out.println("document.getElementById(\"Small\").options.add(new Option(\"" + Small[cnt]
									+ "\", \"" + Small[cnt] + "\"))");
							cnt++;
							out.println("document.getElementById(\"Small\").options[" + cnt + "].disabled = true;");
						}
					}
					out.println("</script>");
					out.println("<th>코드</th>");
					out.println("<th>물품명</th>");
					out.println("<th colspan=\"2\">가격</th>");
					out.println("<th>단위</th>");
					out.println("<th>재고</th>");
					if (request.getParameter("msg") != null)
						query = "SELECT Code, Name, Price, Measure, Stock FROM ITEM WHERE Name Like '%"
								+ request.getParameter("msg") + "%'";
					else {
						if (request.getParameter("large") == null || request.getParameter("large").equals("0"))
							query = "SELECT Code, Name, Price, Measure, Stock FROM ITEM ORDER BY Code";
						else {
							out.println("<script>document.getElementById(\"Large\").options[" + Integer.parseInt(request.getParameter("large")) + "].selected = true;");
							out.println("changeLarge();</script>");
							if (request.getParameter("middle").equals("0"))
								query = "SELECT Code, Name, Price, Measure, Stock FROM Item WHERE Category IN (SELECT Small FROM CATEGORY WHERE Large='"
										+ Large[Integer.parseInt(request.getParameter("large")) - 1] + "') ORDER BY Code";
							else {
								out.println("<script>document.getElementById(\"Middle\").options[" + Integer.parseInt(request.getParameter("middle")) + "].selected = true;");
								out.println("changeMiddle();</script>");
								if (request.getParameter("small").equals("0"))
									query = "SELECT Code, Name, Price, Measure, Stock FROM Item WHERE Category IN (SELECT Small FROM CATEGORY WHERE Middle='"
											+ Middle[Integer.parseInt(request.getParameter("middle")) - 1]
											+ "') ORDER BY Code";
								else{
									out.println("<script>document.getElementById(\"Small\").options[" + Integer.parseInt(request.getParameter("small")) + "].selected = true;</script>");
									query = "SELECT Code, Name, Price, Measure, Stock FROM Item WHERE Category='"
											+ Small[Integer.parseInt(request.getParameter("small")) - 1]
											+ "' ORDER BY Code";
								}
							}
						}
					}
					pstmt = conn.prepareStatement(query);
					rs = pstmt.executeQuery();
					rsmd = rs.getMetaData();

					while (rs.next()) {
						out.println("<tr>");
						out.println("<td>" + rs.getString(1) + "</td>");
						out.println("<td><a href=itemDetail.jsp?msg=" + rs.getString(1) +">" + rs.getString(2) + "</td>");
						out.println("<td colspan=\"2\">" + rs.getString(3) + "</td>");
						out.println("<td>" + rs.getString(4) + "</td>");
						out.println("<td>" + rs.getString(5) + "</td>");
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
