if (session.getAttribute("sessionID") == null) {
	response.sendRedirect("../jsp/login.jsp");
}
