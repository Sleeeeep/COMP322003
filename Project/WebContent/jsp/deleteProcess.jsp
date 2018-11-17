<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMP322003-14조</title>
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
			//System.out.println("Connection Success");

			String[] delItem = request.getParameterValues("chk");
			for(String item: delItem)
			{
				StringTokenizer s = new StringTokenizer(item, "#");
				
				query = "DELETE FROM SHOPPINGCART WHERE Cid="+session.getAttribute("sessionID");
				query += " AND Item=(SELECT Code FROM ITEM WHERE Name='"+s.nextToken()+"')";
				System.out.println(query);
				pstmt = conn.prepareStatement(query);
				pstmt.executeUpdate();
			}
			
			response.sendRedirect("shoppingcart.jsp?msg=1");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>