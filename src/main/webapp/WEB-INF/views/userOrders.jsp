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
	<h1>User: ${user.username}</h1>
	<p>First name: ${user.firstname}</p>
	<p>Last name: ${user.lastname}</p>
	<p>Email: ${user.email}</p>


	<h1>Orders</h1>
	<table>
		<tr>
			<th>User</th>
			<th>Hotel name</th>
			<th>Room name</th>
			<th>Date Begin</th>
			<th>Date End</th>
			<th>Price</th>
		</tr>
		<c:forEach items="${orders}" var="order">
			<tr>
				<td><c:out value="${order.user.username}"/></td>
				<td><c:out value="${order.room.hotel.name}"/></td>
				<td><c:out value="${order.room.name}"/></td>
				<td><c:out value="${order.dateBegin}"/></td>
				<td><c:out value="${order.dateEnd}"/></td>
				<td><c:out value="${order.price}"/>$</td>
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