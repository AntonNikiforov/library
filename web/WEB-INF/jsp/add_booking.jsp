
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Modal -->
<div class="modal fade" id="AddBookingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <!--<div class="modal-dialog modal-sm">-->
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="BookingForm" method="post" class="form-horizontal" action="add_booking">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="EditLabel">
                        <fmt:message key="add" bundle="${locale}"/>
                    </h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="user_id" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="user_id" placeholder="${requestScope.booking.user.id}" value="${requestScope.user.id}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="book_id" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="book_id" placeholder="${requestScope.booking.book.id}" value="${requestScope.book.id}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="type" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <select class="form-control" name="type_id">
                                <c:forEach var="type" items="${requestScope.type_list}">
                                    <c:choose>
                                        <c:when test="${type eq requestScope.booking.type}">
                                            <option value="${type.id}" selected>
                                                    ${type.name}
                                            </option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${type.id}">
                                                    ${type.name}
                                            </option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        <fmt:message key="close" bundle="${locale}"/>
                    </button>
                    <!-- Do NOT use name="submit" or id="submit" for the Submit button -->
                    <button type="submit" class="btn btn-primary">
                        <fmt:message key="add" bundle="${locale}"/>
                    </button>

                </div>
            </form>
        </div>
    </div>
</div>
