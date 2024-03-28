<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Go Wild WildLife Park</title>
</head>

<style>

body{
	background-image:url('https://wallpaperaccess.com/full/1862824.png');
	background-repeat: no-repeat;
	background-size:cover;
	box-sizing: border-size;
	margin:0;
	padding:0;
}

.menu_bar{
	z-index:1;
	opacity:0.8;
	background-color: #4B0082;
	text-align: left;
	height: 60px;
	float:top;
}

.menu_bar ul{
	display: inline-flex;
	list-style:none;
	color: white;
	font-size:20px;
	margin:0;
}

.menu_bar ul li{
	width: 120px;
	margin: 2px;
	padding: 15px;
	text-align: center;
}

.menu_bar ul li a {
	text-decoration:none;
	color:white;
	margin: 0;
}

.menu_bar ul li:hover{
	color: #800080;
	border-radius: 5px;
}

.sub-menu-1 {
	display: none;
}

.menu_bar ul li:hover .sub-menu-1{
	color:#800080;
	display: block;
	position: absolute;
	background: rgb(0,100,0);
	margin-top:15px;
	margin-left:-15px;
}

.menu_bar ul li:hover .sub-menu-1 ul{
	display: block;
	margin:1px;
}
.menu_bar ul li:hover .sub-menu-1 ul li{
	width: 150px;
	padding: 10px;
}

.sub-menu-1 ul li:hover{
background-color:#800080;}

h1{
	margin: 70px 80px 10px;
	color:#bfff00;
	font-family: Arial;
}

h2{
	margin:280px 150px 10px;
	color: #ffbf80;
	font-family: Arial;
	font-size:25px;
}

p{
	margin:20px 75px 10px;
	color: #ffbf80;
	font-size:23px;
	font-family: Arial;
}

.active{
border: 1px solid #004d00;
border-radius: 7px;
color: white;
background-color: #1d1160;
padding: 13px;}

.active:hover{
color: #DDA0DD}

#K_report{
padding: 10px;
background: purple;
border-radius: 5px;

}

</style>

<body>

<div class="menu_bar" >
<ul>		
	<li><a href="main.jsp" class="active">Home</a></li>
	
	<li><a href="#">Species</a>
	<div class="sub-menu-1" style="background-color: #EE82EE">
		<ul style="font-size:19px">
			<li><a href="Species_list.jsp" title="Direct to viewing species data" >View Species</a></li>
			<li> <a href="Species.jsp" title="Direct to Species" >Add Species</a></li>
			
		</ul>
		</div>
	</li>
	
	<li><a href="#">Enclosures</a>
	<div class="sub-menu-1" style="background-color: #EE82EE">
		<ul style="font-size:19px">
			<li><a href="Enclosures_list.jsp" title="Direct to viewing enclosures data" >View Enclosures</a></li>
			<li> <a href="Enclosures.jsp" title="Direct to Enclosures" >Add Enclosure</a></li>
			
			
		</ul>
		</div>
	</li>
	
	<li><a href="#">Diet</a>
	<div class="sub-menu-1" style="background-color: #EE82EE">
		<ul style="font-size:19px">
			<li><a href="Diet_list.jsp" title="Direct to viewing Diet data" >View Diet</a></li>
			<li> <a href="Diet.jsp" title="Direct to adding Diet data"  >Add Diet</a></li>
			
		</ul>
		</div>
	</li>

	<li><a href="#">Keepers</a>
	<div class="sub-menu-1" style="background-color: #EE82EE">
		<ul style="font-size:19px">
			<li><a href="Keepers_list.jsp" title="Direct to viewing keepers data" >View Keepers</a></li>
			<li> <a href="Keepers.jsp" title="Direct to Keepers" >Add Keepers</a></li>
			
		</ul>
		</div>
	</li>


	<li><a href="#">Animals</a>
	<div class="sub-menu-1" style="background-color: #EE82EE">
		<ul style="font-size:19px">
			<li><a href="Animals_list.jsp" title="Direct to viewing animals data" >View Animals</a></li>
			<li> <a href="Animals.jsp" title="Direct to Animals" >Add Animals</a></li>
		</ul>
		</div>
	</li>
	
	<li><a id="K_report" href="#">KeepersReport</a>
	<div class="sub-menu-1" style="background-color: #EE82EE">
		<ul style="font-size:19px">
			<li><a href="Report1.jsp" >Report 1</a></li>
			<li><a href="Report2.jsp" >Report 2</a></li>
		</ul>
		</div>
	</li>

	
</ul>
</div>
<center>
<h1>Welcome To Go Wild WildLife Park</h1>
<h2>Discover the animals world !!!</h2>
<b><p>Over 2000 animals with new challenges and excitement.Just enjoy the moment.</p></b>
</center>

</body>
</html>