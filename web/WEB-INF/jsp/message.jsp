
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${not empty requestScope.msg}">

<div class="container">
    <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <strong>Warning!</strong> ${requestScope.msg}
    </div>
</div>

</c:if>

