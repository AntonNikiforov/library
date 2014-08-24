
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sing in</title>

    <!---->
    <link href="view/css/bootstrap.min.css" rel="stylesheet">
    <link href="view/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="view/css/footer.css" rel="stylesheet">

</head>
<body>

<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:setBundle basename="locale" var="locale"/>

<div id="wrap">

    <%@include file="header.jsp"%>

    <%@include file="message.jsp"%>

    <div class="container jumbotron well-lg" style="max-width: 500px;">

        <form action="sign_in" method="post"
              class="form-horizontal" role="form" lang="en">

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">
                    <fmt:message key="email" bundle="${locale}" />
                </label>
                <div class="col-sm-10">
                    <input name="email" value=""
                           type="email" class="form-control" id="inputEmail3" placeholder="">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">
                    <fmt:message key="password" bundle="${locale}"/>
                </label>
                <div class="col-sm-10">
                    <input name="password"
                           type="password" class="form-control" id="inputPassword3" placeholder="">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">
                        <fmt:message key="sign_in" bundle="${locale}" />
                    </button>
                </div>
            </div>
        </form>
    </div>

    <div id="push"></div>
</div>

<div id="footer">
    <div class="container">
        <p class="muted credit text-center">footer ёpta</p>
    </div>
</div>

<script src="view/js/jQuery.js"></script>
<script src="view/js/bootstrap.min.js"></script>
</body>
</html>