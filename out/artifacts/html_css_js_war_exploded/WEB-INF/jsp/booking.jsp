
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

    <title>Start Page</title>

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

<c:if test="${sessionScope.admin}">
    <div class="btn-group pull-right">
<c:choose>
    <c:when test="${not empty requestScope.booking.dateOfReturn}">
        <button type="button" class="btn btn-default" disabled>
            <fmt:message key="close" bundle="${locale}"/>
        </button>
    </c:when>
    <c:otherwise>
        <a type="button" class="btn btn-default" href="close_booking?id=${requestScope.booking.id}">
            <fmt:message key="close" bundle="${locale}"/>
        </a>
    </c:otherwise>
</c:choose>
        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#EditBookingModal">
            <fmt:message key="edit" bundle="${locale}"/>
        </button>
        <a type="button" class="btn btn-danger" href="delete_booking?id=${requestScope.booking.id}">
            <fmt:message key="delete" bundle="${locale}"/>
        </a>
    </div>
</c:if>


    <div class="panel panel-default">
        <div class="panel-body">
            <p class="page-header">
<c:choose>
    <c:when test="${empty requestScope.booking.dateOfReturn}">
                <span class="label label-primary">Open</span>
    </c:when>
    <c:otherwise>
                <span class="label label-success">Close</span>
    </c:otherwise>
</c:choose>
                # <small>${requestScope.booking.id}</small>
            </p>
            <p class="lead"><small>Book: </small><a href="book?id=${requestScope.booking.book.id}">${requestScope.booking.book.name}</a></p>
            <p class="lead"><small>User: </small><a href="user?id=${requestScope.booking.user.id}">${requestScope.booking.user.name} ${requestScope.booking.user.surname}</a></p>
            <p class="lead"><small>Type: </small>${requestScope.booking.type.name}</p>
            <p class="lead">Was issued ${requestScope.booking.dateOfIssue} and
                <c:choose>
                    <c:when test="${empty requestScope.booking.dateOfReturn}">
                has not yet returned
                    </c:when>
                    <c:otherwise>
                returned ${requestScope.booking.dateOfReturn}
                    </c:otherwise>
                </c:choose>
            </p>

        </div>
    </div>


</div>

<!-- Modals -->
<%@include file="edit_booking.jsp"%>

<!-- Footer -->
<%@include file="footer.jsp"%>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="../../view/js/jquery.js"></script>
<script src="../../view/js/bootstrap.js"></script>
<script src="../../view/js/bootstrapValidator.js"></script>

<script src="../../view/js/editBookingValidation.js"></script>

</body></html>