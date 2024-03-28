<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.DBManager" %>
    <%@ page import = "com.csm.dao.EnclosuresManager" %>
    <%@ page import = "com.csm.entity.Enclosures" %>
    
    <%@ include file="Enclosures_list.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Enclosure</title>
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
	String eid = request.getParameter("enc_id");
	String etype = request.getParameter("enc_type");
	String eloc = request.getParameter("enc_locate");
	
	
	%>	
	<div class="updated_list">
		<br>
		<span>Enclosure ID    : </span> <span class = 'listdata'><% out.println(eid); %></span><br>
		<span>Enclosure type  : </span> <span class = 'listdata'><% out.println(etype); %></span><br>
		<span>Location        : </span> <span class = 'listdata'><% out.println(eloc); %></span><br>
	</div>
	<%
	
	EnclosuresManager dao = new EnclosuresManager();
	Enclosures e = new Enclosures(Integer.parseInt(eid),etype, eloc);
	
	int rowAffected;
	try {
		rowAffected = dao.update(e);
		%>
		<p class="updated_list">
		<%
				out.println("The record is successfully updated.");
		%>
		</p><br>
		<%
	}catch (ClassNotFoundException ex){
		out.println(ex.getMessage());
	}catch (SQLException ex){
		%>
		<p class="updated_failed">
		<%
		out.println(ex.getMessage());
		%>
		</p>
		<%
	}
%>

</body>
</html>


