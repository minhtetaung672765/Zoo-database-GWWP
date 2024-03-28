<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.DBManager" %>
    <%@ page import = "com.csm.dao.AnimalsManager" %>
    <%@ page import = "com.csm.entity.Animals" %>
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Animals</title>

<script>
function confirmUpdate() {
    return confirm("Please confirm to update this record.");
}
</script>

</head>

<style>

 body{
font-family: Arial, sans-serif;
background-image:url('https://cdn4.vectorstock.com/i/1000x1000/61/83/animals-and-wildlife-green-background-vector-21366183.jpg');
background-repeat:no-repeat;
background-size:cover;
margin: 20px 450px 40px;
z-index:1;
}
h2{
margin-left: 42px;
margin-bottom: 9px;
}

form{
width:300px;
background: #fff ;
z-index: 2;
position: absolute;
text-align: center;
opacity: 0.8;
border-radius:15px;
height: 520px;
align:center;
padding:10px;

}

label{
color:black;
font-size:15px;
}

input[type=text],input[type=number]{
width: 80%;
height: 20px;
display:inline-block;
align:center;
font-size: 16px;
border: 3px solid #ccc;
    border-radius: 5px;
}

select, option {
width: 84%;
height: 30px;
align:center;
margin-bottom: 15px ;
font-size: 14px;
border: 3px solid #ccc;
border-radius: 5px;
color: green;
}

input{
color:green;}

input:hover , select:hover{
color: blue;}

input[type=submit]{
width:80%;
height: 34px;
border: 2px solid #ccc;
border-radius: 30px;
color: black;
background-color: lightblue ;
margin: 10px 23px 10px;
align:center;
font-size:18px;}

input[type=submit]:hover{
color: white;
background: green;}


.transparent-slide {
    background: rgba(0, 0, 0, 0.4);
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
  }
  
  a{
 z-index: 2;
    position: absolute;
    top: 20px;
    left: 20px;
    color: lightblue;
    text-decoration: none;
  }

</style>

<body>
<div class="transparent-slide"></div>

<h2>Edit form for Animal</h2>
<form method="POST" action="Animals_update.jsp">
<%
	String ani = request.getParameter("AnimalID");
		if (ani == null){
			out.println("Animal ID is not found.");
		}else {
			int id = Integer.parseInt(ani);
			AnimalsManager dao = new AnimalsManager();
			try {
				Animals a = dao.getById(id);
				//out.print(c);
%>
			<input type ="hidden" name="ani_id" value="<%=a.getAnimal_ID() %>"> <br><br>
			
			<label for="ani_name">Animal name</label><br>
			<input type="text" name="aniName" id="ani_name" value="<%=a.getAnimal_Name() %>" required><br><br>
			
			<label for="agender">Gender</label><br>
			<select name="anigender" id="agender" value="<%=a.getGender() %>" required>
			<option>Male</option>
			<option>Female</option>			
			</select><br>
			
			<label for="arvyear">Arrived year</label><br>
			<input type="text" name="aniArryear" id="arvyear" value= "<%=a.getArrival_Year() %>" required><br><br>
			
			<label for="spid">Species ID</label><br>
			<input type="number" name="speid" id="spid" value= "<%=a.getSpecies_Species_ID() %>" required><br><br>
			
			<label for="encid">Enclosure ID</label><br>
			<input type="number" name="encid" id="encid" value= "<%=a.getEnclosures_Enclosure_ID() %>" required><br><br>
			
			<label for="kpid">Keeper ID</label><br>
			<input type="number" name="kpid" id="kpid" value= "<%=a.getKeepers_Keeper_ID() %>" required><br><br>
			
			<label for="diet_id">Diet ID</label><br>
			<input type="number" name="dietID" id="diet_id" value= "<%=a.getDiet_Diet_ID() %>" required><br><br>
			
			<input type="submit" value="Update" onclick="return confirmUpdate();"/>
<%
			}catch (ClassNotFoundException ex){
				out.println(ex.getMessage());
			}catch (SQLException e){
				out.println(e.getMessage());
			}
		}
%>

</form>

<a href= "Animals_list.jsp">Back</a>

</body>
</html>
