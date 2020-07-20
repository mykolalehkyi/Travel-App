<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp" />
<jsp:include page="navbar.jsp" />
<div class="container">
    <h1 class="text-center">Management</h1>
    <h5>${resultOperation}</h5><br>
	<h4>Add hotel form</h4>
	<form action="/management/addHotel" method="post" class="form-group">
    <table>
      <tr>
        <td>Hotel name</td>
        <td><input type="text" name="hotelName"class="form-control"></td>
      </tr>
        <tr>
            <td>Country</td>
            <td><input type="text" name="country"class="form-control"></td>
        </tr>
        <tr>
            <td>Stars</td>
            <td><input type="text" name="stars"class="form-control"></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><input type="text" name="description"class="form-control"></td>
        </tr>
        <td><button type="submit" class="btn-primary">Add hotel</button></td>
      </tr>
    </table>
  </form>
  <br/>
    <h4>Add hotel room form</h4>
    <form action="/management/addHotelRoom" method="post" class="form-group">
        <table>
            <tr>
                <td>Select to which hotel add room</td>
                <td>
                    <select name="hotelName" id="hotelName"class="form-control">
                        <c:forEach items="${hotelsNames}" var="hotel">
                            <option value='<c:out value="${hotel}"/>'>${hotel}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Room name</td>
                <td><input type="text" name="name"class="form-control"></td>
            </tr>
            <tr>
                <td>Description</td>
                <td><input type="text" name="description"class="form-control"></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="text" name="price"class="form-control"></td>
            </tr>
            <td><button type="submit" class="btn-primary">Add room</button></td>
            </tr>
        </table>
    </form>
</div>
<jsp:include page="footerEndBody.jsp" />