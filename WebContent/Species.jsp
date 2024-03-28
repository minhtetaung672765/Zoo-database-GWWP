<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Species table</title>

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
  label,input{
  z-index:3;
 
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
    margin-bottom: 6px;
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
  input[type="submit"]:hover, input[type="reset"]:hover {
    background-color: #007575;
  }
  .back-button {
  z-index: 3;
    position: absolute;
    top: 20px;
    left: 20px;
    color: lightblue;
    text-decoration: none;
  }
</style>


</head>
<body>

<a class="back-button" href="main.jsp" title="back to main page">Home</a>

<div class="transparent-slide"></div>
<div class="content">

<center>

<form action="Species_action.jsp" method="post">

<label for="Stype">Species type </label>
<input id="Stype" type="text" name="stype" required><br><br>

<label for="sgp">Species group </label>
<input id="sgp" type="text" name="sgp" required><br><br>

<label for="slife">Lifestyle </label>
<input id="slife" type="text" name="slife" required><br><br>

<label for="scon">Conservation status </label>
<input id="scon" type="text" name="scon" ><br><br>

<input type="submit" value="Save">
<input type="reset" value="Reset">

</form>
</center>
</div>

</body>
</html>