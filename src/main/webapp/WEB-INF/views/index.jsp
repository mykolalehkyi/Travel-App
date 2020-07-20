<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="head.jsp" />
<link rel="stylesheet" href="<c:url value="/resources/statics/css/TableStyleClick.css" />" type="text/css">
<jsp:include page="navbar.jsp" />
<div class="container">
	<div >
	<h2 >Filter by</h2>
	<form action="" method="get" class="form-inline">
		<label for="hotelName">Write hotel name:</label>
		<input type="text" placeholder="Write hotel name" name="hotelName" id ="hotelName" class="form-control">
		<label for="country">	Choose a country:</label>
		<select name="country" id="country" class="fo	rm-control">
			<option value=""></option>
			<c:forEach items="${countries}" var="country">
					<option value='<c:out value="${country}"/>'>${country}</option>
			</c:forEach>
		</select>
		<label for="stars">	Amount of stars:</label>
		<select name="stars" id="stars" class="form-control">
			<option value=""></option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
		</select>
		<input type="submit" value="Search" class="btn-primary  ml-1">
	</form>
	</div>
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
	<script>
		$(document).ready(function(){
			$(document.body).on("click","tr[data-href]",function () {
				window.location.href= this.dataset.href;
			})
		})
	</script>
</div>
<jsp:include page="footerEndBody.jsp" />