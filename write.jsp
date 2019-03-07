<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
	Statement stmt = null;
	ResultSet rs = null;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/todos?characterEncoding=utf8&serverTimezone=UTC", "root", "cs1234");
//	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/todos", "root", "cs1234");
	String item = request.getParameter("todo-item");
	String sql = "insert into todo(item) values('" + item + "')";  
	stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	response.sendRedirect("todo.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	insert <%= item %>!!
</body>
</html>