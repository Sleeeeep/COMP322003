<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMP322004-14조</title>
</head>
<body>
	<%
		session.invalidate();
		response.sendRedirect("../");
	%>
</body>
</html>