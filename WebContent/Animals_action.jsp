<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.dao.AnimalsManager" %>
    <%@ page import = "com.csm.entity.Animals" %>
    <%@ page import = "com.csm.DBManager" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style type="text/css">

.linkhome{
width: 200px;
    padding: 5px;
    margin-bottom: 10px;
    border-radius: 5px;
    background: #5F9EA0;
    text-decoration: none;
}
.linkhome:hover{
color: #A3C1AD;
}

body{
background: #A3C1AD;
text-align: center;
font-size: 22px;
padding: 200px;
}

#fail{
color: red;
font-size:24px;
}


</style>

<title>Save animal data</title>
</head>
<body>

<%
try
{
	String an = request.getParameter("aniname");
	String gd = request.getParameter("agender");
	int arvy = Integer.parseInt(request.getParameter("aryear"));
	int spid = Integer.parseInt(request.getParameter("speid"));
	int encid = Integer.parseInt(request.getParameter("encid"));
	int keid = Integer.parseInt(request.getParameter("kepid"));
	int deid = Integer.parseInt(request.getParameter("dietid"));
	 
	DBManager dbMgr = new DBManager();
	
	dbMgr.getConnection();
	
	Animals a = new Animals(an,gd,arvy,spid,encid,keid,deid);
	
	AnimalsManager aMag = new AnimalsManager();
	int Affect = -1;
	
	Affect = aMag.insert(a);
	
	if(Affect == 1){
		out.println("Successfully Inserted.");//////
	}
}catch (ClassNotFoundException e){
	e.printStackTrace();
}catch (SQLException e){
	e.printStackTrace();
%>

<div id="fail">	
<%
	out.println("Insertion failed. ");
	out.println(" The ID you entered does not exist.");
}
%>
</div>

<br><br>
<a href="main.jsp" class="linkhome" >Home</a>

</body>
</html>