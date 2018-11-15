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

		String url = "jdbc:mysql://localhost/project?useSSL=false&user=knu&password=comp322";
		String id = (String) session.getAttribute("sessionID");
		System.out.println(id);
		String sndmsg = "";

		if (request.getParameter("msg") != null) {
			if (request.getParameter("msg").equals("1")) {
				try {
					conn = DriverManager.getConnection(url);

					String name = "\'" + request.getParameter("name") + "\'";
					String phone = "\'" + request.getParameter("phone1") + "-" + request.getParameter("phone2")
							+ "-" + request.getParameter("phone3") + "\'";
					String sex = "\'" + request.getParameter("sex") + "\'";
					String bdate = "\'" + request.getParameter("birthyy") + "-" + request.getParameter("birthmm")
							+ "-" + request.getParameter("birthdd") + "\'";
					String job = "\'" + request.getParameter("job") + "\'";
					String usertype = "\'" + request.getParameter("userType") + "\'";
					String address = "\'" + request.getParameter("address") + "\'";

					query = "UPDATE CUSTOMER SET Name=" + name + ", Pnumber=" + phone;

					if (sex.contains("null") == false)
						query += ", Sex=" + sex;
					if (bdate.length() > 10)
						query += ", Bdate=, STR_TO_DATE(" + bdate + ", \'%Y-%m-%d\')";
					if (job.length() > 2)
						query += ", Job=" + job;
					if (usertype.length() > 2)
						query += ", Type=" + usertype;
					if (address.length() > 2)
						query += ", Address=" + address;
					query += " WHERE Id=" + id;

					System.out.println(query);
					pstmt = conn.prepareStatement(query);
					pstmt.executeUpdate();

					sndmsg = "main.jsp?msg=2";

					response.sendRedirect(sndmsg);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else if (request.getParameter("msg").equals("2")) {
				try {
					conn = DriverManager.getConnection(url);

					String pw = "\'" + request.getParameter("password") + "\'";

					query = "UPDATE CUSTOMER SET Pw=" + pw + " WHERE Id=" + id;

					System.out.println(query);
					pstmt = conn.prepareStatement(query);
					pstmt.executeUpdate();

					out.println("<script>alert(\"다시 로그인해주세요.\");");
					out.print("window.location.href = 'logoutProcess.jsp';</script>");
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	%>
</body>
</html>