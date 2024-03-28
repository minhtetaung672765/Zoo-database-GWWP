<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.util.ArrayList" %>
    <%@ page import = "com.csm.dao.DietManager" %>
    <%@ page import = "com.csm.entity.Diet" %>
    <%@ page import = "com.csm.DBManager" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Diet Lists</title>

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
font-weight:bold;}

th{
height:42px;
background: #bfb5db ;
}

td {
height: 30px;
text-align: center;
}

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

#feedHead{width: 22%;}

.changeOP{width: 15%;}

</style>

<body>

<center><h1>Diet List</h1></center>

<a href="main.jsp" title="Go to Home page" id="home">Home</a>

<%
	try{
		DBManager dbMgr = new DBManager();
		dbMgr.getConnection();
		
		DietManager dMgr = new DietManager();
		ArrayList<Diet> diet = dMgr.fetchAll();
					
%>

	<center><table border="1">
	<tr>
		<th>Diet ID</th>
		<th>Diet Type</th>
		<th id="feedHead">Number of feed per day</th>
		<th class="changeOP">Edit Diet</th> 
		<th class="changeOP">Delete Diet</th> 
	</tr>
<%
	for (Diet dt :diet){
%>

	<tr>
	<td><%=dt.getDiet_ID() %></td>
	<td><%=dt.getDiet_Type() %></td>
	<td><%=dt.getFeed_per_day() %></td>
	<td><a id="for_edit"   href="Diet_edit.jsp?DietID=<%= dt.getDiet_ID() %>">Edit</a></td>
	<td><a id="for_delete" href="Diet_delete.jsp?DietID=<%= dt.getDiet_ID() %>" onclick="return confirmDelete();">Delete</a></td> 
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