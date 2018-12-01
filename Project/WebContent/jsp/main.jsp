<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*,java.sql.*,java.util.*"%>
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
	<%
		if (request.getParameter("msg") != null) {
			if (request.getParameter("msg").equals("1"))
				out.println("<script>alert(\"회원가입을 축하드립니다.\")</script>");
			else if (request.getParameter("msg").equals("2"))
				out.println("<script>alert(\"정보가 수정되었습니다.\")</script>");

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

				query = "SELECT * FROM CUSTOMER WHERE Id=" + session.getAttribute("sessionID");
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				rsmd = rs.getMetaData();
				while (rs.next()) {
					StringTokenizer s;
					session.setAttribute("sessionName", rs.getString(3));

					if (rs.getString(4) == null)
						session.setAttribute("sessionSex", "");
					else
						session.setAttribute("sessionSex", rs.getString(4));

					if (rs.getString(5) == null)
						session.setAttribute("sessionJob", "");
					else
						session.setAttribute("sessionJob", rs.getString(5));

					if (rs.getString(6) == null)
						session.setAttribute("sessionType", "");
					else
						session.setAttribute("sessionType", rs.getString(6));

					if (rs.getString(7) == null) {
						session.setAttribute("sessionYy", "");
						session.setAttribute("sessionMm", "");
						session.setAttribute("sessionDd", "");
					} else {
						s = new StringTokenizer(rs.getString(7), "-");
						session.setAttribute("sessionYy", s.nextToken());
						session.setAttribute("sessionMm", s.nextToken());
						session.setAttribute("sessionDd", s.nextToken());
					}

					if (rs.getString(8) == null)
						session.setAttribute("sessionAdd", "");
					else
						session.setAttribute("sessionAdd", rs.getString(8));

					if (rs.getString(9) == null) {
						session.setAttribute("sessionP1", "");
						session.setAttribute("sessionP2", "");
						session.setAttribute("sessionP3", "");
					} else {
						s = new StringTokenizer(rs.getString(9), "-");
						session.setAttribute("sessionP1", s.nextToken());
						session.setAttribute("sessionP2", s.nextToken());
						session.setAttribute("sessionP3", s.nextToken());
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	%>
	<br>
	<br>
	<br>
	<div id="Content">
		<table>
			<tr>
				<td colspan="6" style="font-size: 20px; font-weight: bold">최근 3달의
					TOP5</td>
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

					out.println("<th>코드</th>");
					out.println("<th>물품명</th>");
					out.println("<th colspan=\"2\">가격</th>");
					out.println("<th>단위</th>");
					out.println("<th>재고</th>");

					query = "SELECT I.Code, I.Name, I.Price, I.Measure, I.stock, COUNT(I.Code) as count FROM ITEM I, ORDERS O, ORDER_LIST L, CUSTOMER C "
							+ "WHERE I.Code = L.Item AND O.Onumber = L.Ono AND O.Cid = C.Id AND I.Stock > 0 "
							+ "AND C.Type <> '도매업' AND O.Stime >= DATE_ADD(NOW(), INTERVAL -1 MONTH) "
							+ "GROUP BY I.Code ORDER BY count DESC limit 5";
					pstmt = conn.prepareStatement(query);
					rs = pstmt.executeQuery();
					rsmd = rs.getMetaData();

					while (rs.next()) {
						out.println("<tr>");
						out.println("<td>" + rs.getString(1) + "</td>");
						out.println("<td><a href=itemDetail.jsp?msg=" + rs.getString(1) + ">" + rs.getString(2) + "</td>");
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
