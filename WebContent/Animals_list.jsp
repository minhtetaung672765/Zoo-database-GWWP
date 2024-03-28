<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.util.ArrayList" %>
    <%@ page import = "com.csm.dao.AnimalsManager" %>
    <%@ page import = "com.csm.entity.Animals" %>
    <%@ page import = "com.csm.DBManager" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Animal List</title>

<script>
function confirmDelete() {
    return confirm("Are you sure you want to delete this record?");
}
</script>

</head>

<style>
body{
background: radial-gradient(circle,rgba(238,174,202,1)0%,
rgba(148,187,233,1)100%);
}

table,td,th{
border:2px solid black;}

table{
border-collapse: collapse;
width: 80%;
font-weight:bold;
text-align: center;
}

th{
height:42px;
background: #bfb5db ;
}

td {
height: 30px;}

#home{
border-radius: 10px;
padding: 15px;
text-decoration:none;
color: Black;
background-color:lightblue;
}

#home:hover{
color: blue;
}

#for_delete{
text-decoration: none;
color: red;
}

#for_delete:hover{
background: pink;
border-radius:5px;
color: navy;
}

#for_edit{
text-decoration: none;
color: blue;
}

#for_edit:hover{
background: pink;
border-radius:5px;
color: navy;
}

#DHead{width: 9%;}

</style>

<body>

<center><h1>Animals List</h1></center>

<a href="main.jsp" title="Go to Home page" id="home">Home</a>

<%
	try{
		DBManager dbMgr = new DBManager();
		dbMgr.getConnection();
		
		AnimalsManager aMgr = new AnimalsManager();
		ArrayList<Animals> animal = aMgr.fetchAll();
		
%>

	<center><table border="1">
	<tr>
		<th>Animal ID</th>
		<th>Animal Name</th>
		<th>Animal Gender</th>
		<th>Year of Arrival</th>
		<th>Species ID</th>
		<th>Enclosure ID</th>
		<th>Keeper ID</th>
		<th id="DHead">Diet ID</th>
		<th>Edit animal</th>
		<th>Delete animal</th>
		 
	</tr>
<%
	for (Animals ani :animal){
%>

	<tr>
	<td><%=ani.getAnimal_ID() %></td>
	<td><%=ani.getAnimal_Name() %></td>
	<td><%=ani.getGender() %></td>
	<td><%=ani.getArrival_Year() %></td>
	<td><%=ani.getSpecies_Species_ID() %></td>
	<td><%=ani.getEnclosures_Enclosure_ID() %></td>
	<td><%=ani.getKeepers_Keeper_ID() %></td>
	<td><%=ani.getDiet_Diet_ID() %></td>
	<td><a id="for_edit"   href="Animals_edit.jsp?AnimalID=<%= ani.getAnimal_ID() %>">Edit</a></td>
	<td><a id="for_delete" href="Animals_delete.jsp?AnimalID=<%= ani.getAnimal_ID() %>" onclick="return confirmDelete();">Delete</a></td>
	
 
	</tr>

<%
	}
%>

	</table></center>

<%
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(SQLException e){
		e.printStackTrace();
	}
%>


</body>
</html>