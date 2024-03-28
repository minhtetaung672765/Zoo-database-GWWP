<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.DBManager" %>
    <%@ page import = "com.csm.dao.DietManager" %>
    <%@ page import = "com.csm.entity.Diet" %>
    
    <%@ include file="Diet_list.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Diet</title>
</head>
<style>

.updated_list{
margin-left: 120px;
font-size: 20px;
font-family: Arial, sans-serif;
}

.updated_failed{
margin-left: 120px;
font-size: 20px;
color: red;
}

.listdata{
color: green;
}
p{
color: blue; 
font-weight: bold;
font-size: 25px;
}

</style>
<body>

<%
	String dId = request.getParameter("diet_id");
	String dtype = request.getParameter("diet_type");
	String dfeed = request.getParameter("diet_feed");
	
%>	
<div class="updated_list">
	<br>
	<span>Diet ID    : </span> <span class = 'listdata'><% out.println(dId); %></span><br>
	<span>Diet type  : </span> <span class = 'listdata'><% out.println(dtype); %></span><br>
	<span>No of feed : </span> <span class = 'listdata'><% out.println(dfeed); %></span><br>
</div>
<%
	DietManager dao = new DietManager();
	Diet d = new Diet(Integer.parseInt(dId),dtype, Integer.parseInt(dfeed));
	
	int rowAffected;
	try {
		rowAffected = dao.update(d);
		
%>
<p class="updated_list">
<%
		out.println("The record is successfully updated.");
%>
</p>
<%
	}catch (ClassNotFoundException ex){
		out.println(ex.getMessage());
	}catch (SQLException e){
		%>
		<p class="updated_failed">
		<%
		out.println(e.getMessage());
		%>
		</p>
		<%
	}
%>

</body>
</html>


