<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMP322004-14조</title>
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
			String url = "jdbc:mysql://localhost/project?useSSL=false&user=knu&password=comp322";
			conn = DriverManager.getConnection(url);
			//System.out.println("Connection Success");

			String id = "\'" + request.getParameter("id") + "\'";
			String pw = "\'" + request.getParameter("password") + "\'";
			String name = "\'" + request.getParameter("name") + "\'";
			String phone = "\'" + request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-"
					+ request.getParameter("phone3") + "\'";

			System.out.println(name);

			query = "SELECT * FROM CUSTOMER WHERE Id=" + id;
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			rsmd = rs.getMetaData();
			rs.last();
			check = rs.getRow();

			String msg = "";

			if (check == 1)
				msg = "register.jsp?msg=-1";
			else {
				query = "INSERT INTO CUSTOMER (Id, Pw, Name, Pnumber) VALUES (" + id + ", " + pw + ", " + name
						+ ", " + phone + ")";
				pstmt = conn.prepareStatement(query);
				pstmt.executeUpdate();
			}
			response.sendRedirect(msg);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>