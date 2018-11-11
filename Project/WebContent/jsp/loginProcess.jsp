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
			System.out.println("Connection Success");

			String id = request.getParameter("id");
			String pw = request.getParameter("password");

			query = "SELECT * FROM CUSTOMER";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			rsmd = rs.getMetaData();
			check = rs.getRow();

			String msg = "";

			if (check == 0)
				msg = "login.jsp?msg=-1";
			else {

				query = "SELECT * FROM USER WHERE Id=\'" + id + "\' AND Pw=\'" + pw + "\'";
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				rsmd = rs.getMetaData();
				check = rs.getRow();
				out.println(check);
				if (check == 1) {
					session.setAttribute("sessionID", id);
					msg = "../";
				} else if (check == 0) // 비밀번호가 틀릴경우
				{
					msg = "login.jsp?msg=0";
				}

			}
			response.sendRedirect(msg);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>