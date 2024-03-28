<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.DBManager "%>
    <%@ page import = "com.csm.dao.KeepersManager" %>
    <%@ page import = "com.csm.entity.Keepers" %>
    
    <%@ include file="Keepers_list.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete keeper</title>
</head>
<body>

<%
	String keeperID = request.getParameter("KeeperID");

	KeepersManager dao = new KeepersManager();
	int rowAffected;
	try {
		rowAffected = dao.delete(Integer.parseInt(keeperID));
		out.println ("<h2>The data has been deleted</h2> " );
		
	}catch (ClassNotFoundException ex){
		out.println(ex.getMessage());
	}catch (SQLException e){
		out.println(e.getMessage());
	}

%>

</body>
</html>