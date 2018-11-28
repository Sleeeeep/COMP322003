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
			
			long time = System.currentTimeMillis();
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			String curTime = date.format(new java.util.Date(time));

			query = "INSERT INTO ORDERS(Cid,Stime) VALUES (" + session.getAttribute("sessionID")
					+ ", STR_TO_DATE('" + curTime + "', '%Y-%m-%d'))";
			pstmt = conn.prepareStatement(query);
			pstmt.executeUpdate();

			query = "SELECT Onumber FROM ORDERS WHERE Cid=" + session.getAttribute("sessionID")
					+ " ORDER BY Onumber DESC limit 1";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			rsmd = rs.getMetaData();

			int orderNumber = 0;
			while (rs.next()) {
				orderNumber = Integer.parseInt(rs.getString(1));
			}

			String[] orderItem = request.getParameterValues("chk");

			for (String item : orderItem) {
				StringTokenizer s = new StringTokenizer(item, "#");

				String tempItem = s.nextToken();
				int num = Integer.parseInt(s.nextToken());

				for (int i = 0; i < num; i++) {
					query = "INSERT INTO ORDER_LIST VALUES (" + orderNumber + ", " + tempItem + ")";
					pstmt = conn.prepareStatement(query);
					pstmt.executeUpdate();
					
					query = "UPDATE ITEM SET Stock=Stock -1 WHERE Code="+tempItem;
					pstmt = conn.prepareStatement(query);
					pstmt.executeUpdate();
				}
				query = "DELETE FROM SHOPPINGCART WHERE Item="+tempItem+" AND Cid="+session.getAttribute("sessionID");
				pstmt = conn.prepareStatement(query);
				pstmt.executeUpdate();
			}

			response.sendRedirect("order.jsp?msg=1");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>