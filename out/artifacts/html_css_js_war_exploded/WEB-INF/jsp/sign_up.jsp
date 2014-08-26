
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Modal -->
<div class="modal fade" id="SignUpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <!--<div class="modal-dialog modal-sm">-->
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="SignUpForm" method="post" class="form-horizontal" action="sign_up">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="SignUpLabel">
                        <fmt:message key="sign_up" bundle="${locale}"/>
                    </h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="email" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="email" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="password" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <input type="password" class="form-control" name="password" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="user_name" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="name" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-4 control-label">
                            <fmt:message key="surname" bundle="${locale}"/>
                        </label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="surname" />
                        </div>
                    </div>

                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        <fmt:message key="close" bundle="${locale}"/>
                    </button>
                    <!-- Do NOT use name="submit" or id="submit" for the Submit button -->
                    <button type="submit" class="btn btn-primary">
                        <fmt:message key="sign_up" bundle="${locale}"/>
                    </button>

                </div>
            </form>
        </div>
    </div>
</div>
