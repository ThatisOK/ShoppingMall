<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (session.getAttribute("user") == null) {
	%>
	<script type="text/javascript">
		alert("您还没有登录，请登录...");
		window.location.href = "Login.html"
	</script>
	<%
		//response.sendRedirect("Login.html");
		}
	%>
	<%
		response.setHeader("refresh", "0;URL=Login.html");
		session.invalidate();
	%>
</body>
</html>