<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="head.jsp" />
<link rel="stylesheet" href="<c:url value="/resources/statics/css/TableStyleClick.css" />" type="text/css">
<jsp:include page="navbar.jsp" />
<div class="container">
	<h1>Hotel: ${hotel.name}</h1>
	<div>Country: ${hotel.country}</div>
	<div>Stars: ${hotel.stars}</div>
	<div>Description: ${hotel.description}</div>
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
				<td><button class="btn-primary">Book now</button></td>
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