<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Travel App</title>
</head>
<body>

	<h1>Travel App</h1>
    <h2>${message}</h2><br>
    <h5>${resultOperation}</h5><br>
	<h4>Add hotel form</h4>
	<form action="./management/addHotel" method="post">
    <table>
      <tr>
        <td>Hotel name</td>
        <td><input type="text" name="hotelName"></td>
      </tr>
        <tr>
            <td>Country</td>
            <td><input type="text" name="country"></td>
        </tr>
        <tr>
            <td>Stars</td>
            <td><input type="text" name="stars"></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><input type="text" name="description"></td>
        </tr>
        <td><button type="submit">Add hotel</button></td>
      </tr>
    </table>
  </form>
  <br/>
    <h4>Add hotel room form</h4>
    <form action="./management/addHotelRoom" method="post">
        <table>
            <tr>
                <td>Select to which hotel add room</td>
                <td>
                    <select name="hotelName" id="hotelName">
                        <c:forEach items="${hotelsNames}" var="hotel">
                            <option value='<c:out value="${hotel}"/>'>${hotel}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Room name</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Description</td>
                <td><input type="text" name="description"></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="text" name="price"></td>
            </tr>
            <td><button type="submit">Add room</button></td>
            </tr>
        </table>
    </form>
</body>
</html>