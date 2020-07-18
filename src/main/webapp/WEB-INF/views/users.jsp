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
		<label for="username">Write user name:</label>
		<input type="text" placeholder="Write user name" name="username" id ="username">
		<input type="submit" value="Search">
	</form>

	<h1>Users</h1>
	<table>
		<tr>
			<th>Username</th>
			<th>First name</th>
			<th>Last name</th>
			<th>Email</th>
		</tr>
		<c:forEach items="${users}" var="user">
			<tr data-href="./user/${user.username}">
				<td><c:out value="${user.username}"/></td>
				<td><c:out value="${user.firstname}"/></td>
				<td><c:out value="${user.lastname}"/></td>
				<td><c:out value="${user.email}"/></td>
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