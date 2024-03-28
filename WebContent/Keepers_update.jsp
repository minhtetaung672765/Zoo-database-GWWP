<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.sql.Date" %>
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.DBManager" %>
    <%@ page import = "com.csm.dao.KeepersManager" %>
    <%@ page import = "com.csm.entity.Keepers" %>
    
    <%@ include file="Keepers_list.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Keepers</title>
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
	String kID = request.getParameter("kp_id");
	String kname = request.getParameter("kpname");
	String kbirth = request.getParameter("kpbirth");
	String krank = request.getParameter("kprank");
	
	%>	
	<div class="updated_list">
		<br>
		<span>Keeper ID    : </span> <span class = 'listdata'><% out.println(kID); %></span><br>
		<span>Keeper Name  : </span> <span class = 'listdata'><% out.println(kname); %></span><br>
		<span>Birthday     : </span> <span class = 'listdata'><% out.println(kbirth); %></span><br>
		<span>Keeper Rank  : </span> <span class = 'listdata'><% out.println(krank); %></span><br>
	</div>
	<%
	
	KeepersManager dao = new KeepersManager();
	Keepers k = new Keepers(Integer.parseInt(kID),kname,Date.valueOf(kbirth),krank);
	
	int rowAffected;
	try {
		rowAffected = dao.update(k);
		%>
		<p class="updated_list">
		<%
				out.println("The record is successfully updated.");
		%>
		</p><br>
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


