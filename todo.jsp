<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import= "java.sql.*" %>
    <%
    request.setCharacterEncoding("utf-8");
      Statement stmt = null;
      ResultSet rs = null;
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/todos?serverTimezone=UTC", "root", "cs1234");
     
      
    	   stmt = conn.createStatement();
    	   if(stmt.execute("select * from todo")){
    		   rs= stmt.getResultSet();
    	   }
      
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div>
      <h1>jslee's todos</h1>
      <hr>
      <%
        while(rs.next()) {
        	out.println(rs.getInt("id")+ ":" +rs.getString("item")+"<br>");
        }
      rs.close();
      stmt.close();
      conn.close();
        %>
     <hr>
      <form method="post" action="write.jsp">
        <input type="text" name="todo-item" />
        <input type = "submit" value="작성" />
      </form>
</div>

</body>
</html>