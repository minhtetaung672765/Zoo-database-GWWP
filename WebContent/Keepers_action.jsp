<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.Date" %>
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.dao.KeepersManager" %>
    <%@ page import = "com.csm.entity.Keepers" %>
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


</style>

<title>Save Keeper data</title>
</head>
<body>

<%
try
{
	String kn = request.getParameter("kname");
	Date kb = Date.valueOf(request.getParameter("kbirth"));
	String kr = request.getParameter("krank");
	
	if(kr.isEmpty()){
		kr = null;
	}
	
	//calling DBManager 
	DBManager dbMgr = new DBManager();
	
	//using object calling jdbc getconnection
	dbMgr.getConnection();
	
	//two parameter passing 
	Keepers k = new Keepers(kn,kb,kr);
	
	//calling DietManage
	KeepersManager kMag = new KeepersManager();
	int Affect = -1;
	
	//calling dao 
	Affect = kMag.insert(k);
	
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