
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:setLocale value="${sessionScope.lang.name}"/>
<fmt:setBundle basename="locale" var="locale"/>

<!DOCTYPE html>
<html lang="en"><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>User Page</title>

    <!-- Bootstrap core CSS -->
    <link href="../../view/css/bootstrap.css" rel="stylesheet">
    <link href="../../view/css/bootstrapValidator.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../view/css/sticky-footer-navbar.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../view/js/ie-emulation-modes-warning.js"></script>
    <script src="../../view/js/ie10-viewport-bug-workaround.js"></script>

</head>
<body>

<!-- Fixed navbar -->
<%@include file="header.jsp"%>

<%@include file="message.jsp"%>


<div class="jumbotron container well">

<c:if test="${requestScope.user.id eq sessionScope.id or sessionScope.admin}">
    <div class="btn-group pull-right">
        <div class="btn-group">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                Options
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                <li role="presentation">
                    <form method="post" action="bookings">
                        <input type="hidden" name="user_id" value="${requestScope.user.id}">
                        <input type="hidden" name="type" value="open">
                        <button type="submit" class="btn btn-link">
                            Open booking
                        </button>
                    </form>
                </li>
                <li role="presentation">
                    <form method="post" action="bookings">
                        <input type="hidden" name="user_id" value="${requestScope.user.id}">
                        <button type="submit" class="btn btn-link">
                            All booking
                        </button>
                    </form>
                </li>
            <c:if test="${sessionScope.admin}">
                <li class="divider"></li>
                <li>
                    <button type="button" class="btn btn-link" data-toggle="modal" data-target="#AddBookingModal">
                        New booking
                    </button>
                </li>
            </c:if>
            </ul>
        </div>

        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#EditUserModal">
            <fmt:message key="edit" bundle="${locale}"/>
        </button>
        <a type="button" class="btn btn-danger" href="delete_user?id=${requestScope.user.id}">
            <fmt:message key="delete" bundle="${locale}"/>
        </a>
    </div>
</c:if>


    <div class="panel panel-default">
        <div class="panel-body">
            <h2 class="page-header">${requestScope.user.name} ${requestScope.user.surname} <small> # ${requestScope.user.id}</small></h2>
            <p class="lead"><fmt:message key="email" bundle="${locale}"/>: <small>${requestScope.user.email}</small></p>
        </div>
    </div>


</div>

<!-- Modals -->
<%@include file="edit_user.jsp"%>
<%@include file="add_booking.jsp"%>

<!-- Footer -->
<%@include file="footer.jsp"%>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="../../view/js/jquery.js"></script>
<script src="../../view/js/bootstrap.js"></script>
<script src="../../view/js/bootstrapValidator.js"></script>

<script src="../../view/js/editUserValidation.js"></script>
<script src="../../view/js/addBookingValidation.js"></script>

</body></html>