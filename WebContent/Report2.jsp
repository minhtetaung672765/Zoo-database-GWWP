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
<title>Report 2</title>
</head>

<style>

body{
background: radial-gradient(circle,rgba(238,174,202,1)0%,
rgba(148,187,233,1)100%);}

table, td, th {
  border: 2px solid black;
  font-weight: bold;
  }

table {
  border-collapse: collapse;
  width: 60%;}

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
	ArrayList<Animals> animal = aMgr.fetchAnimalGroupByKeeper();

%>
	<center><div>
	<h1>Report 2</h1>
	<table>
		<tr>
			<th>Keeper Name</th>
			<th>Total Animal</th>	
		</tr>
		<%
			for (Animals a : animal){
		%>
			<tr>
				<td> <%= a.getName() %></td>
				<td> <%= a.getTotalAnimals() %></td>
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
