<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Travel App</title>
	<style>
		table {
			border-collapse: collapse;
			width: 100%;
		}
		th{
			background: goldenrod;
			color: white;
		}
		th, td {
			text-align: left;
			padding: 8px;
		}

		tr:nth-child(even) {background-color: #f2f2f2;}

		tr[data-href]{
			cursor: pointer;
		}
		tr:hover{
			background-color:#ffcc00;
		}
	</style>
</head>
<body>
	<h1>Travel App</h1>
	<h2>${message}</h2><br>
	<h2>Filter by</h2>
	<form action="" method="get">
		<label for="hotelName">Write hotel name:</label>
		<input type="text" placeholder="Write hotel name" name="hotelName" id ="hotelName">
		<label for="country">Choose a country:</label>
		<select name="country" id="country">
			<option value=""></option>
			<c:forEach items="${countries}" var="country">
					<option value='<c:out value="${country}"/>'>${country}</option>
			</c:forEach>
		</select>
		<label for="stars">Amount of stars:</label>
		<select name="stars" id="stars">
			<option value=""></option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
		</select>
		<input type="submit" value="Search">
	</form>

	<h1>Hotels</h1>
	<table>
		<tr>
			<th>Name</th>
			<th>Country</th>
			<th>Stars</th>
			<th>Description</th>
		</tr>
		<c:forEach items="${hotels}" var="hotel">
			<tr data-href="./hotel/${hotel.name}">
				<td><c:out value="${hotel.name}"/></td>
				<td><c:out value="${hotel.country}"/></td>
				<td><c:out value="${hotel.stars}"/></td>
				<td><c:out value="${hotel.description}"/></td>
			</tr>
		</c:forEach>
	</table>
	<form action="/logout" method="post">
		<input value="Logout" type="submit">
	</form>
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			$(document.body).on("click","tr[data-href]",function () {
				window.location.href= this.dataset.href;
			})
		})
	</script>
</body>
</html>