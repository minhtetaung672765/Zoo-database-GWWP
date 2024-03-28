<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Animals table</title>

<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-image: url('https://cdn4.vectorstock.com/i/1000x1000/61/83/animals-and-wildlife-green-background-vector-21366183.jpg');
    background-size: cover;
    background-repeat: no-repeat;
  }
  .transparent-slide {
    background: rgba(0, 0, 0, 0.5);
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
  }
  .content {
    position: relative;
    z-index: 2;
    opacity:0.8;
    text-align: center;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  }
  form {
    display: inline-block;
  }
  label {
    display: block;
    margin-bottom: 2px;
  }
  input[type="text"], input[type="date"] {
    width: 200px;
    padding: 5px;
    margin-bottom: 3px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  input[type="submit"], input[type="reset"] {
    padding: 10px 20px;
    background-color: #004c4c;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
  input[type="submit"]:hover {
    background-color: #007575;
  }
  input[type="reset"]:hover {
   background-color: red;
  }
  .back-button {
  	z-index: 3;
    position: absolute;
    top: 20px;
    left: 20px;
    color: lightblue;
    text-decoration: none;
  }
  #agend{
 	width: 200px;
    padding: 5px;
    text-align: center;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  
</style>

</head>
<body>

<a class="back-button" href="main.jsp" title="back to main page">Home</a>

<div class="transparent-slide"></div>
<div class="content">

<center>

<form action="Animals_action.jsp" method="post">

<label for="aname">Animal Name</label>
<input id="aname" type="text" name="aniname" required><br><br>

<label for="agend">Animal Gender </label>
<select id="agend" name="agender" required>
<option>Male</option>
<option>Female</option>
</select><br><br>

<label for="arryear">Year of Arrival</label>
<input id="arryear" type="text" name="aryear" required><br><br>

<label for="spid">Species ID of animal</label>
<input id="spid" type="text" name="speid" required><br><br>

<label for="enid">Enclosure ID of animal</label>
<input id="enid" type="text" name="encid" required><br><br>

<label for="kpid">Keeper ID of animal</label>
<input id="kpid" type="text" name="kepid" required><br><br>

<label for="dietid">Diet ID of animal</label>
<input id="dietid" type="text" name="dietid" required><br><br>


<input type="submit" value="Save">
<input type="reset" value="Reset">

</form>
</center>


</div>
</body>
</html>