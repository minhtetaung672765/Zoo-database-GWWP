<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.DBManager" %>
    <%@ page import = "com.csm.dao.AnimalsManager" %>
    <%@ page import = "com.csm.entity.Animals" %>
    
    <%@ include file="Animals_list.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Animals</title>
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
	int aniID = Integer.parseInt(request.getParameter("ani_id"));
	String aniName = request.getParameter("aniName");
	String aniGender = request.getParameter("anigender");
	int aniYear = Integer.parseInt(request.getParameter("aniArryear"));
	int spID = Integer.parseInt(request.getParameter("speid"));
	int enID = Integer.parseInt(request.getParameter("encid"));
	int kpID = Integer.parseInt(request.getParameter("kpid"));
	int dtID = Integer.parseInt(request.getParameter("dietID"));
	
	
	%>	
	<div class="updated_list">
		<br>
		<span>Animal ID    : </span> <span class = 'listdata'><% out.println(aniID); %></span><br>
		<span>Animal name  : </span> <span class = 'listdata'><% out.println(aniName); %></span><br>
		<span>Gender       : </span> <span class = 'listdata'><% out.println(aniGender); %></span><br>
		<span>Arrived year : </span> <span class = 'listdata'><% out.println(aniYear); %></span><br>
		<span>Species ID   : </span> <span class = 'listdata'><% out.println(spID); %></span><br>
		<span>Enclosure ID : </span> <span class = 'listdata'><% out.println(enID); %></span><br>
		<span>Keeper ID    : </span> <span class = 'listdata'><% out.println(kpID); %></span><br>
		<span>Diet ID      : </span> <span class = 'listdata'><% out.println(dtID); %></span><br>
	</div>
	<%
	
	AnimalsManager dao = new AnimalsManager();
	Animals a = new Animals(aniID,aniName,aniGender,aniYear,spID,enID,kpID,dtID);
	
	int rowAffected;
	try {
		rowAffected = dao.update(a);
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


