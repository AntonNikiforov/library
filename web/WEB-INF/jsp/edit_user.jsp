
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Modal -->
<div class="modal fade" id="EditUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <!--<div class="modal-dialog modal-sm">-->
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="UserForm" method="post" class="form-horizontal" action="edit_user">

                <input type="hidden" name="id" value="${requestScope.user.id}">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="EditLabel">
                        <fmt:message key="edit" bundle="${locale}"/>
                    </h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="email" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="email" placeholder="${requestScope.user.email}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="password" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <input type="password" class="form-control" name="password" placeholder="${requestScope.user.password}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="user_name" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="name" placeholder="${requestScope.user.name}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="surname" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="surname" placeholder="${requestScope.user.surname}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="language" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <select class="form-control" name="lang_id">
                                <c:forEach var="lang" items="${requestScope.lang_list}">
                                    <c:choose>
                                        <c:when test="${lang eq requestScope.user.lang}">
                                            <option value="${lang.id}" selected>
                                                    ${lang.name}
                                            </option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${lang.id}">
                                                    ${lang.name}
                                            </option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                <c:if test="${sessionScope.admin}">
                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="role" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <select class="form-control" name="role_id">
                                <c:forEach var="role" items="${requestScope.role_list}">
                                    <c:choose>
                                        <c:when test="${role eq requestScope.user.role}">
                                            <option value="${role.id}" selected>
                                                    ${role.name}
                                            </option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${role.id}">
                                                    ${role.name}
                                            </option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </c:if>

                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        <fmt:message key="close" bundle="${locale}"/>
                    </button>
                    <!-- Do NOT use name="submit" or id="submit" for the Submit button -->
                    <button type="submit" class="btn btn-primary">
                        <fmt:message key="edit" bundle="${locale}"/>
                    </button>

                </div>
            </form>
        </div>
    </div>
</div>
