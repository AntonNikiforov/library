
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="library" uri="/WEB-INF/tld/taglib.tld" %>

<fmt:setLocale value="${sessionScope.lang.name}"/>
<fmt:setBundle basename="locale" var="locale"/>

<!DOCTYPE html>
<html lang="en"><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Search Page</title>

    <!-- Bootstrap core CSS -->
    <link href="../../view/css/bootstrap.css" rel="stylesheet">
    <link href="../../view/css/bootstrapValidator.css" rel="stylesheet">
    <link href="../../view/css/pagination.css" rel="stylesheet">

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

<div class="container jumbotron well-lg"  style="margin-bottom: 100px">

    <div class="form-group">
            <button type="button" class="btn btn-default btn-group-justified" data-toggle="modal" data-target="#SignUpModal">
                Add new user
            </button>
    </div>
<!--
    <div class="list-group">
        <a class="list-group-item" href="#">
            <div class="media">
                <div class="pull-left">
                    <img class="media-object" src="../../view/img/index.svg" alt="...">
                </div>
                <div class="media-body">
                    <h3>User Name and Surname</h3>
                </div>
            </div>
        </a>

    </div>
-->
    <library:users list="${requestScope.list}" page="${requestScope.page}"/>
<!--
    <ul class="pagination">
        <li class="active">
            <span>1 <span class="sr-only">(current)</span></span>
        </li>
        <li>
            <form role="form">
                <button type="submit">2</button>
            </form>
        </li>
        <li>
            <form role="form">
                <button type="submit">3</button>
            </form>
        </li>
    </ul>
-->
    <!-- Modals -->
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

<script src="../../view/js/signUpValidation.js"></script>

</body></html>