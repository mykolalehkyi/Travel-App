<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Nicolas
  Date: 20.07.2020
  Time: 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="<c:url value='/' />"><img style="height: 40px; width: 40px;vertical-align:middle;" src="<c:url value="/resources/statics/images/plane.gif" />" alt=""><strong> Travel App</strong></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value='/' />">Home <span class="sr-only">(current)</span></a>
            </li>
            <sec:authorize access="hasRole('MANAGER')">
                <li class="nav-item active">
                    <a class="nav-link" href="<c:url value='/management' />">Management</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="<c:url value='/management/users' />">Users</a>
                </li>
            </sec:authorize>
            <li class="nav-item ">
                <a class="nav-link" href="<c:url value='/' />">${message}</a>
            </li>
            <li class="nav-item active">
                <form action="<c:url value='/logout' />" method="post">
                    <input value="Logout" type="submit" class="nav-link" style="border: none; background: none; cursor: pointer;">
                </form>
            </li>
        </ul>
    </div>
</nav>