<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.DBManager" %>
    <%@ page import = "com.csm.dao.SpeciesManager" %>
    <%@ page import = "com.csm.entity.Species" %>
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Species</title>
<style>
  body{
font-family: Arial, sans-serif;
background-image:url('https://cdn4.vectorstock.com/i/1000x1000/61/83/animals-and-wildlife-green-background-vector-21366183.jpg');
background-repeat:no-repeat;
background-size:cover;
margin: 50px 450px 40px;
z-index:1;
}
h2{
margin-left: 40px;
margin-bottom: 30px;
}

form{
width:300px;
background: #fff ;
z-index: 2;
position: absolute;
text-align: center;
opacity: 0.8;
border-radius:15px;
height: 430px;
align:center;
padding:10px;

}

input[type=text]{
width: 80%;
height: 30px;
display:inline-block;
align:center;
margin-bottom: 8px ;
padding-left: 5px;
font-size: 14px;
border: 3px solid #ccc;
    border-radius: 5px;
}
input{
color:green;}

input:hover {
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

label{
color:black;
font-size:17px;
}

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
</head>
<body>
<div class="transparent-slide"></div>

<h2>Edit form for Species</h2>
<div class="content">
  <form method="POST" action="Species_update.jsp">
    <%
    String spe = request.getParameter("SpeciesID");
    if (spe == null) {
      out.println("Species ID is not found.");
    } else {
      int id = Integer.parseInt(spe);
      SpeciesManager dao = new SpeciesManager();
      try {
        Species s = dao.getById(id);
    %>

    <input type="hidden" name="spe_id" value="<%=s.getSpecies_ID() %>"> <br><br>

    <label for="spe_type">Species Type</label><br>
    <input type="text" name="spe_type" id="spe_type" value="<%=s.getSpecies_Type() %>" required><br><br>

    <label for="spe_gp">Species Group</label><br>
    <input type="text" name="spe_group" id="spe_gp" value="<%=s.getGroup() %>" required><br><br>

    <label for="spe_ls">Lifestyle</label><br>
    <input type="text" name="spe_life" id="spe_ls" value="<%=s.getLifestyle() %>" required><br><br>

    <label for="spe_con">Conservation Status</label><br>
    <input type="text" name="spe_cs" id="spe_con" value="<%=s.getConservation() %>" required><br><br>

    <input type="submit" value="Update" onclick = "return confirmUpdate();"/>

    <%
      } catch (ClassNotFoundException ex) {
        out.println(ex.getMessage());
      } catch (SQLException e) {
        out.println(e.getMessage());
      }
    }
    %>
  </form>
</div>

<a href= "Species_list.jsp">Back</a>

<script>
function confirmUpdate() {
    return confirm("Please confirm to update this record.");
}
</script>

</body>
</html>
