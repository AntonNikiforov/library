
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-default" role="navigation">
    <div class="container container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="start">Brand</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <c:choose>
        <c:when test="${not empty sessionScope.id}">
            <ul class="nav navbar-nav">
                <li><a href="users">
                    <fmt:message key="users" bundle="${locale}"/>
                </a></li>
                <li><a href="books">
                    <fmt:message key="books" bundle="${locale}"/>
                </a></li>
                <li><a href="bookings">
                    <fmt:message key="bookings" bundle="${locale}"/>
                </a></li>
            </ul>
            <form class="navbar-form navbar-left" role="search" method="post" action="books">
                <div class="form-group input-group">
                    <input type="text" class="form-control" value="${requestScope.q}" name="q">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit">
                            <fmt:message key="search" bundle="${locale}"/>
                        </button>
                    </span>
                </div>
            </form>
        </c:when>
    </c:choose>
            <ul class="nav navbar-nav navbar-right">
        <c:choose>
            <c:when test="${not empty sessionScope.id}">
                <li><a href="user">
                    <fmt:message key="profile" bundle="${locale}"/>
                </a></li>
                <li><a href="sign_out">
                    <fmt:message key="sign_out" bundle="${locale}"/>
                </a></li>
            </c:when>
            <c:otherwise>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <fmt:message key="language" bundle="${locale}"/> <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="switch_lang?locale=1">English</a></li>
                        <li><a href="switch_lang?locale=2">Русский</a></li>
                    </ul>
                </li>
            </c:otherwise>
        </c:choose>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
