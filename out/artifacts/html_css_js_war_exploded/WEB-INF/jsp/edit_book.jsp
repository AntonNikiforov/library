
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Modal -->
<div class="modal fade" id="EditBookModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <!--<div class="modal-dialog modal-sm">-->
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="BookForm" method="post" class="form-horizontal" action="edit_book">

                <input type="hidden" name="id" value="${requestScope.book.id}">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="EditLabel">
                        <fmt:message key="edit" bundle="${locale}"/>
                    </h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="book_name" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="name" placeholder="${requestScope.book.name}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="author" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="author" placeholder="${requestScope.book.author}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="year" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="year" placeholder="${requestScope.book.year}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="num" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="num" placeholder="${requestScope.book.num}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="genre" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <select class="form-control" name="genre_id">
                                <c:forEach var="genre" items="${requestScope.genre_list}">
                                    <c:choose>
                                        <c:when test="${genre eq requestScope.book.genre}">
                                            <option value="${genre.id}" selected>
                                                    ${genre.name}
                                            </option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${genre.id}">
                                                    ${genre.name}
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
                        <fmt:message key="edit" bundle="${locale}"/>
                    </button>

                </div>
            </form>
        </div>
    </div>
</div>