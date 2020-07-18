<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Travel App</title>
</head>
<body>
	<h1>Travel App</h1>
	<h2>${message}</h2>
	<h1>Hotel: ${hotel.name}</h1>
	<p>Country: ${hotel.country}</p>
	<p>Stars: ${hotel.stars}</p>
	<p>Description: ${hotel.description}</p>
	<h1>Room</h1>
	<p>Room name: ${room.name}</p>
	<p>Description: ${room.description}</p>
	<p>Price: ${room.price}</p><br>
	<span>${resultOperation}</span><br>
	<form action="" method="post">
		<table>
			<tr>
				<td>Select begin date</td>
				<td><input type="date" name="beginDate"></td>
			</tr>
			<tr>
				<td>Select end date</td>
				<td><input type="date" name="endDate"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Book"></td>
			</tr>
		</table>
	</form>
	<form action="/logout" method="post">
		<input value="Logout" type="submit">
	</form>
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</body>
</html>