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
#Content {
	text-align: center;
}

#name {
	colspan: 2;
}

table {
	margin-left: auto;
	margin-right: auto;
}
</style>
<script>
	function atAction(str) {
		if (str == "1")
			scForm.action = "orderProcess.jsp";
		else if (str == "2")
			scForm.action = "deleteProcess.jsp";
	}
	function checkValue() {
		var chkarr = document.getElementsByName("chk");
		var cntarr = document.getElementsByName("cnt");
		var stockarr = document.getElementsByName("stock");
		var cnt = 0;
		
		for (var i = 0; i < chkarr.length; i++) {
			if (chkarr[i].checked == true) {
				cnt++;	
				if (scForm.action == "http://localhost:8080/Project/jsp/orderProcess.jsp") {
					if (cntarr[i].value > stockarr[i].value) {
						alert("재고가 부족합니다.");
						return false;
					}
				}
			}
		}
		if (cnt == 0) {
			alert("선택된 상품이 없습니다.");
			return false;
		}
	}
</script>
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
		<form name="scForm" method="post" onsubmit="return checkValue()">
			<table>
				<tr>
					<td colspan="5" style="font-size: 20px; font-weight: bold">장바구니</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<th>선택</th>
				<th>물품</th>
				<th>수량</th>
				<th>재고</th>
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
						System.out.println(request.getParameter("num"));
						if (/*request.getParameter("item") != null && */request.getParameter("num") != null) {
							System.out.println("asd" + request.getParameter("item") + request.getParameter("num"));
							for (int i = 0; i < Integer.parseInt(request.getParameter("num")); i++) {
								query = "INSERT INTO SHOPPINGCART VALUES (" + session.getAttribute("sessionID") + ", "
										+ request.getParameter("item") + ")";
								pstmt = conn.prepareStatement(query);
								pstmt.executeUpdate();
							}
						}
						query = "SELECT Name, Item, COUNT(*), Stock FROM SHOPPINGCART JOIN ITEM ON Item=Code AND Cid="
								+ session.getAttribute("sessionID") + " GROUP BY Name, Item";

						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						rsmd = rs.getMetaData();

						while (rs.next()) {
							out.println("<tr>");
							out.println("<td><input  id=\"check\" name=\"chk\" type=\"checkbox\" value=\"" + rs.getString(2)
									+ "#" + rs.getString(3) + "\"></td>");
							out.println("<td id=\"name\">" + rs.getString(1) + "</td>");
							out.println("<td><input type=\"hidden\" name=\"cnt\" value=\""+rs.getString(3)+"\">" + rs.getString(3) + "</td>");
							out.println("<td><input type=\"hidden\" name=\"stock\" value=\""+rs.getString(4)+"\">" + rs.getString(4) + "</td>");
							out.println("</tr>");
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				%>
				<tr>
					<td colspan="4" style="text-align: right"><input type="submit"
						value="구매" onclick='atAction("1");' />&nbsp; <input type="submit"
						value="삭제" onclick='atAction("2");' /></td>
				</tr>
			</table>
		</form>
	</div>
	<%
		if (request.getParameter("msg") != null) {
			if (request.getParameter("msg").equals("1"))
				out.println("<script>alert(\"선택한 상품이 삭제되었습니다.\")</script>");
		}
	%>
</body>
</html>
