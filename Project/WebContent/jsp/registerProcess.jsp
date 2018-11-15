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
			String url = "jdbc:mysql://localhost/project?useSSL=false&user=knu&password=comp322";
			conn = DriverManager.getConnection(url);

			String id = "\'" + request.getParameter("id") + "\'";
			String pw = "\'" + request.getParameter("password") + "\'";
			String name = "\'" + request.getParameter("name") + "\'";
			String phone = "\'" + request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-"
					+ request.getParameter("phone3") + "\'";
			String sex = "\'" + request.getParameter("sex") + "\'";
			String bdate = "\'" + request.getParameter("birthyy") + "-" + request.getParameter("birthmm") + "-"
					+ request.getParameter("birthdd") + "\'";
			String job = "\'" + request.getParameter("job") + "\'";
			String usertype = "\'" + request.getParameter("userType") + "\'";
			String address = "\'" + request.getParameter("address") + "\'";
			

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
				query = "INSERT INTO CUSTOMER (Id, Pw, Name, Pnumber";
				String query2 = ") VALUES (" + id + ", " + pw + ", " + name + ", " + phone;

				if (sex.contains("null") == false) {
					query += ", Sex";
					query2 += ", " + sex;
				}
				if (bdate.length() > 10) {
					query += ", Bdate";
					query2 += ", STR_TO_DATE(" + bdate + ", \'%Y-%m-%d\')";
				}
				if (job.length() > 2) {
					query += ", Job";
					query2 += ", " + job;
				}
				if (usertype.length() > 2) {
					query += ", Type";
					query2 += ", " + usertype;
				}
				if (address.length() > 2) {
					query += ", Address";
					query2 += ", " + address;
				}
				query += query2 + ")";

				System.out.println(query);
				pstmt = conn.prepareStatement(query);
				pstmt.executeUpdate();

				msg = "main.jsp?msg=1";
			}
			response.sendRedirect(msg);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>