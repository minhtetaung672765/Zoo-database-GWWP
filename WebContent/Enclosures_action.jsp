<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.dao.EnclosuresManager" %>
    <%@ page import = "com.csm.entity.Enclosures" %>
    <%@ page import = "com.csm.DBManager" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Save Enclosure data</title>


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

</style>

</head>
<body>

<%
try
{
	String et = request.getParameter("etype");
	String el = request.getParameter("elocate");
	
	if(el.isEmpty()){
		el = null;
	}

	
	//calling DBManager 
	DBManager dbMgr = new DBManager();
	
	//using object calling jdbc getconnection
	dbMgr.getConnection();
	
	//two parameter passing 
	Enclosures e = new Enclosures(et,el);
	
	//calling DietManage
	EnclosuresManager eMag = new EnclosuresManager();
	int Affect = -1;
	
	//calling dao 
	Affect = eMag.insert(e);
	
	if(Affect == 1)
		out.println("Successfully Inserted.");

}catch (ClassNotFoundException e){
	e.printStackTrace();
}catch (SQLException e){
	e.printStackTrace();
	out.println("Insertion failed.");
}
%>

<br><br>
<a href="main.jsp" class="linkhome" >Home</a>

</body>
</html>