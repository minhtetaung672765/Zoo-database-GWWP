<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
	<%@ page import = "java.sql.*" %>
	<%@ page import = "com.csm.dao.AnimalsManager"%>
	<%@ page import = "com.csm.entity.Animals" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Report 1</title>
</head>

<style>

body{
background: radial-gradient(circle,rgba(238,174,202,1)0%,
rgba(148,187,233,1)100%);}

table, td, th {
  border: 2px solid black;
}

table {
  border-collapse: collapse;
  width: 80%;
  font-weight: bold;
}

th,td {
  height: 30px;
  text-align: center;
}

th{
 background: #C297C8;
 padding: 10px;
 font-size:18px;
 }

#linkhome{
background: lightblue;
padding: 10px;
color: black;
text-decoration: none;
}

#linkhome:hover{
background: cyan;
color: navy;
}

</style>

<body>

<a href="main.jsp" id="linkhome">Home</a>

<%
	try{
		
		AnimalsManager aMgr = new AnimalsManager();
		ArrayList<Animals> animals = aMgr.fetchDaveorTemi();
%>
	<center><div>
	<h1>Report 1</h1>
	<table>
		<tr>
			<th>Animals ID</th>
			<th>Animals Name</th>
			<th>Gender</th>
			<th>Arrived Year</th>
			<th>Keepers ID</th>
			<th>Keepers Name</th>
		</tr>
	<%
		for (Animals a : animals){
	%>
		<tr>
			<td> <%= a.getAnimal_ID() %></td>
			<td> <%= a.getAnimal_Name() %></td>
			<td> <%= a.getGender() %> </td>
			<td> <%= a.getArrival_Year() %> </td>
			<td> <%= a.getKeepers_Keeper_ID() %> </td>
			<td> <%= a.getName() %> </td>
			
		</tr>
		<%
			}
		%>
</table>
</div></center>
<%
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>

</body>
</html>
