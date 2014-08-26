
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

    <div class="jumbotron">

        <h2 class="text-center">
            KEEP<br>CALM<br><small>AND</small><br>READ<br>ON
        </h2>

        <!-- Buttons trigger modals -->
        <p class="text-center" style="margin-top: 50px;">
            <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#SignInModal">
                <fmt:message key="sign_in" bundle="${locale}"/>
            </button>
            <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#SignUpModal">
                <fmt:message key="sign_up" bundle="${locale}"/>
            </button>
        </p>

        <!-- Modals -->
        <%@include file="sign_in.jsp"%>
        <%@include file="sign_up.jsp"%>

    </div>


<!-- Footer -->
<%@include file="footer.jsp"%>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="../../view/js/jquery.js"></script>
<script src="../../view/js/bootstrap.js"></script>
<script src="../../view/js/bootstrapValidator.js"></script>

<script src="../../view/js/signInValidation.js"></script>
<script src="../../view/js/signUpValidation.js"></script>

</body></html>