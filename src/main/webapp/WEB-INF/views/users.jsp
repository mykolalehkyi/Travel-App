<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="head.jsp" />
<link rel="stylesheet" href="<c:url value="/resources/statics/css/TableStyleClick.css" />" type="text/css">
<jsp:include page="navbar.jsp" />
<div class="container">
	<h2>Filter by</h2>
	<form action="" method="get" class="form-inline">
		<label for="userName">Write user name:</label>
		<input type="text" placeholder="Write user name" name="userName" id ="userName" class="form-control">
		<input type="submit" value="Search" class="btn-primary ml-1">
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
	<script>
		$(document).ready(function(){
			$(document.body).on("click","tr[data-href]",function () {
				window.location.href= this.dataset.href;
			})
		})
	</script>
</div>
<jsp:include page="footerEndBody.jsp" />