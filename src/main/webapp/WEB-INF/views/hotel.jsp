<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Travel App</title>
	<style>
		/*dfsfs*/
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
	<h2>${message}</h2>
	<h1>${hotel.name}</h1>
	<p>${hotel.country}</p>
	<p>${hotel.stars}</p>
	<p>${hotel.description}</p>
	<h1>Rooms</h1>
	<table>
		<tr>
			<th>Name</th>
			<th>Description</th>
			<th>Price</th>
			<th>Available?</th>
		</tr>
		<c:forEach items="${rooms}" var="room">
			<tr data-href="./${hotel.name}/${room.name}">
				<td><c:out value="${room.name}"/></td>
				<td><c:out value="${room.description}"/></td>
				<td><c:out value="${room.price}"/>$</td>
				<td><button>Book now</button></td>
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