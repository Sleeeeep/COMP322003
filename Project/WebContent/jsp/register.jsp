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
			String serverIP = "localhost";
			String strSID = "orcl";
			String portNum = "1521";
			String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;
			String user = "knu";
			String pass = "comp322";
			Connection conn;
			PreparedStatement pstmt;
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
		%>
</body>
</html>