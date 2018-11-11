<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>COMP322004-14조</title>
</head>
<body>
	<%
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			String url = "jdbc:mysql://localhost/project?user=knu&password=comp322";
			conn = DriverManager.getConnection(url);
			System.out.println("Connection Success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		PreparedStatement pstmt;
		ResultSet rs;
		ResultSetMetaData rsmd;
		int check = -1;
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String query;

		try {
			query = "SELECT * FROM CUSTOMER WHERE ID=\'" + id + "\'";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			rsmd = rs.getMetaData();
			check = rsmd.getColumnCount();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String msg = "";

		if (check == 0)
			msg = "login.jsp?msg=-1";
		else {
			try {
				query = "SELECT * FROM USER WHERE Id=\'" + id + "\' AND Pw=\'" + pw + "\'";
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				rsmd = rs.getMetaData();
				check = rsmd.getColumnCount();
				if (check == 1) {
					session.setAttribute("sessionID", id);
					msg = "../";
				} else if (check == 0) // 비밀번호가 틀릴경우
				{
					msg = "login.jsp?msg=0";
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		response.sendRedirect(msg);
	%>
</body>
</html>