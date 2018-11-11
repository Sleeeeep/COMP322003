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
		
		String id= request.getParameter("id");
        String pw = request.getParameter("password");
        
		String query = "SELECT * FROM EMPLOYEE WHERE ID=\'"+id+"\'";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();

		ResultSetMetaData rsmd = rs.getMetaData();
		int check = rsmd.getColumnCount();
        
        String msg = "";
        
        if(check == 0)
        	 msg = "login.jsp?msg=-1";
        else
        {
        	query = "SELECT * FROM EMPLOYEE WHERE Id=\'"+id+"\' AND Pw=\'"+pw+"\'";
    		pstmt = conn.prepareStatement(query);
    		rs = pstmt.executeQuery();
    		rsmd = rs.getMetaData();
    		check = rsmd.getColumnCount();
    		 if(check == 1)
    	        { 
    	            session.setAttribute("sessionID", id);
    	            msg = "../";
    	        }
    	        else if(check == 0) // 비밀번호가 틀릴경우
    	        {
    	            msg = "login.jsp?msg=0";
    	        }
        }         
        response.sendRedirect(msg);
    %>


출처: http://all-record.tistory.com/115?category=733042 [세상의 모든 기록]
</body>
</html>