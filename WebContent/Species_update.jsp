<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.DBManager" %>
    <%@ page import = "com.csm.dao.SpeciesManager" %>
    <%@ page import = "com.csm.entity.Species" %>
    
    <%@ include file="Species_list.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Species</title>
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
	String sID = request.getParameter("spe_id");
	String stype = request.getParameter("spe_type");
	String sgp = request.getParameter("spe_group");
	String slife = request.getParameter("spe_life");
	String scon = request.getParameter("spe_cs");
	
	
	%>	
	<div class="updated_list">
		<br>
		<span>Species ID    : </span> <span class = 'listdata'><% out.println(sID); %></span><br>
		<span>Species type  : </span> <span class = 'listdata'><% out.println(stype); %></span><br>
		<span>Group         : </span> <span class = 'listdata'><% out.println(sgp); %></span><br>
		<span>Lifestyle     : </span> <span class = 'listdata'><% out.println(slife); %></span><br>
		<span>Conservation  : </span> <span class = 'listdata'><% out.println(scon); %></span><br>
	</div>
	<%
	
	SpeciesManager dao = new SpeciesManager();
	Species s = new Species(Integer.parseInt(sID),stype, sgp,slife,scon);
	
	int rowAffected;
	try {
		rowAffected = dao.update(s);
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


