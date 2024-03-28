<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.util.ArrayList" %>
    <%@ page import = "com.csm.dao.SpeciesManager" %>
    <%@ page import = "com.csm.entity.Species" %>
    <%@ page import = "com.csm.DBManager" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Species List</title>

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

.changeOP{width: 11%;}

</style>

<body>

<center><h1>Species List</h1></center>

<a href="main.jsp" title="Go to Home page" id="home">Home</a>

<%
	try{
		DBManager dbMgr = new DBManager();
		dbMgr.getConnection();
		
		SpeciesManager sMgr = new SpeciesManager();
		ArrayList<Species> species = sMgr.fetchAll();
		
%>

	<center><table border="1">
	<tr>
		<th>Species ID</th>
		<th>Species Type</th>
		<th>Group</th>
		<th>Lifestyle</th>
		<th>Conservation status</th>
		<th class="changeOP">Edit species</th>
		<th class="changeOP">Delete species</th>
		 
	</tr>
<%
	for (Species sp :species){
%>

	<tr>
	<td><%=sp.getSpecies_ID() %></td>
	<td><%=sp.getSpecies_Type() %></td>
	<td><%=sp.getGroup() %></td>
	<td><%=sp.getLifestyle() %></td>
	<td><%=sp.getConservation() %></td>
	<td><a id="for_edit"   href="Species_edit.jsp?SpeciesID=<%= sp.getSpecies_ID() %>">Edit</a></td>
	<td><a id="for_delete" href="Species_delete.jsp?SpeciesID=<%= sp.getSpecies_ID() %>" onclick="return confirmDelete();">Delete</a></td>
	
 
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