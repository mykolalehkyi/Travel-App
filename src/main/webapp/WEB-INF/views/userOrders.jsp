<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="head.jsp" />
<link rel="stylesheet" href="<c:url value="/resources/statics/css/TableStyleClick.css" />" type="text/css">
<jsp:include page="navbar.jsp" />
<div class="container">
	<h1>User: ${user.username}</h1>
	<div>First name: ${user.firstname}</div>
	<div>Last name: ${user.lastname}</div>
	<div>Email: ${user.email}</div>


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
</div>
	<script>
		$(document).ready(function(){
			$(document.body).on("click","tr[data-href]",function () {
				window.location.href= this.dataset.href;
			})
		})
	</script>
<jsp:include page="footerEndBody.jsp" />