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
<meta charset="EUC-KR">
<title>재고 추가</title>
</head>
<body>
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

			query = "UPDATE ITEM SET Stock=" + request.getParameter("num") + " WHERE Code="
					+ request.getParameter("item");
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt = conn.prepareStatement(query);
			pstmt.executeUpdate();
			
			response.sendRedirect("manageItem.jsp?msg=1");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>