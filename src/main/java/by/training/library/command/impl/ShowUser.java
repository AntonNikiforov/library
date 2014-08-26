package by.training.library.command.impl;

import by.training.library.command.Command;
import by.training.library.command.CommandException;
import by.training.library.controller.Page;
import by.training.library.controller.SessionScope;
import by.training.library.entity.User;
import by.training.library.service.BookingService;
import by.training.library.service.UserService;
import by.training.library.service.exception.NoSuchUserException;
import by.training.library.service.exception.ServiceException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShowUser implements Command {

    public static final String USER_ID = "id";

    public static final String USER = "user";
    public static final String LANG_LIST = "lang_list";
    public static final String ROLE_LIST = "role_list";
    public static final String TYPE_LIST = "type_list";
    public static final String MESSAGE = "msg";

    @Override
    public String execute(HttpServletRequest request) throws CommandException {

        Integer currentUserId = SessionScope.getUserId(request);
        if (currentUserId == null) {
            return Page.START_PAGE;
        }

        try {
            Integer userId = request.getParameter(USER_ID) == null? currentUserId : Integer.parseInt(request.getParameter(USER_ID));
            userId = request.getAttribute(USER_ID) == null? userId : (Integer) request.getAttribute(USER_ID);

            UserService service = UserService.getInstance();

            User user = service.readUser(userId);

            request.setAttribute(USER, user);
            request.setAttribute(LANG_LIST, service.getAllLangs());
            request.setAttribute(ROLE_LIST, service.getAllRoles());

            BookingService bookingService = BookingService.getInstance();
            request.setAttribute(TYPE_LIST, bookingService.getAllTypes());

            return Page.USER_PAGE;

        } catch (IllegalArgumentException e) {
            request.setAttribute(MESSAGE, e.getMessage());
            return Page.ERROR_PAGE;
        } catch (NoSuchUserException e) {
            request.setAttribute(MESSAGE, e.getMessage());
            return Page.ERROR_PAGE;
        } catch (ServiceException e) {
            throw new CommandException(e);
        }
    }
}
