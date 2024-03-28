<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.util.ArrayList" %>
    <%@ page import = "com.csm.dao.KeepersManager" %>
    <%@ page import = "com.csm.entity.Keepers" %>
    <%@ page import = "com.csm.DBManager" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Keeper List</title>

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

.changeOP{width: 15%;}

</style>

<body>

<center><h1>Keepers List</h1></center>

<a href="main.jsp" title="Go to Home page" id="home">Home</a>

<%
	try{
		DBManager dbMgr = new DBManager();
		dbMgr.getConnection();
		
		KeepersManager kMgr = new KeepersManager();
		ArrayList<Keepers> keeper = kMgr.fetchAll();
		
%>

	<center><table border="1">
	<tr>
		<th>Keeper ID</th>
		<th>Keeper Name</th>
		<th>Date of Birth</th>
		<th>Keeper Rank</th>
		<th class="changeOP">Delete keeper</th>
		<th class="changeOP">Edit keeper</th>
		 
	</tr>
<%
	for (Keepers kp :keeper){
%>

	<tr>
	<td><%=kp.getKeeper_ID() %></td>
	<td><%=kp.getKeeper_Name() %></td>
	<td><%=kp.getBirthday() %></td>
	<td><%=kp.getKeeper_Rank() %></td>
	<td><a id="for_edit"   href="Keepers_edit.jsp?KeeperID=<%= kp.getKeeper_ID() %>">Edit</a></td>
	<td><a id="for_delete" href="Keepers_delete.jsp?KeeperID=<%= kp.getKeeper_ID() %>" onclick="return confirmDelete();">Delete</a></td>
 
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