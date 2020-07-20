<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="head.jsp" />
<link rel="stylesheet" href="<c:url value="/resources/statics/css/hotelRoomBooking.css" />" type="text/css">
<jsp:include page="navbar.jsp" />
<c:choose>
	<c:when test="${not empty resultOperation}">
		<h1 class="text-center">${resultOperation}</h1>
	</c:when>
</c:choose>


	<div id="booking" class="section">
		<div class="section-center">
			<div class="container">
				<div class="row">
					<div class="col-md-7 col-md-push-5">
						<div class="booking-cta">
							<h1>Make your reservation</h1>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi facere, soluta magnam consectetur molestias itaque
								ad sint fugit architecto incidunt iste culpa perspiciatis possimus voluptates aliquid consequuntur cumque quasi.
								Perspiciatis.
							</p>
						</div>
					</div>
					<div class="col-md-4 col-md-pull-7">
						<div class="booking-form">
							<form action="" method="post">
								<div class="form-group">
									<span class="form-label">Your Destination</span>
									<h1>Hotel: ${hotel.name}</h1>
									<div>Country: ${hotel.country}</div>
									<div>Stars: ${hotel.stars}</div>
									<div>Description: ${hotel.description}</div>
									<h1>Room</h1>
									<div>Room name: ${room.name}</div>
									<div>Description: ${room.description}</div>
									<div>Price: ${room.price}</div><br>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<span class="form-label">Check In</span>
											<input class="form-control" type="date" name="beginDate"  required>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<span class="form-label">Check out</span>
											<input class="form-control" type="date"  name="endDate" required>
										</div>
									</div>
								</div>
								<div class="form-btn">
									<button class="submit-btn">Check availability</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<jsp:include page="footerEndBody.jsp" />