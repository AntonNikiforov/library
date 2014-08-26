package by.training.library.command.impl;

import by.training.library.command.Command;
import by.training.library.command.CommandException;
import by.training.library.controller.Page;
import by.training.library.controller.SessionScope;
import by.training.library.entity.User;
import by.training.library.service.UserService;
import by.training.library.service.exception.ServiceException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ShowUsers implements Command {

    public static final String PAGE = "page";

    public static final String MESSAGE = "msg";
    public static final String RESULT_LIST = "list";

    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        if (SessionScope.getUserId(request) == null) return Page.START_PAGE;

        try {
            Integer page = request.getParameter(PAGE) == null? 1 : Integer.parseInt(request.getParameter(PAGE));

            UserService service = UserService.getInstance();
            List<User> list = service.getAllUsers();
            request.setAttribute(RESULT_LIST, list);
            request.setAttribute(PAGE, page);

            return Page.USERS;

        } catch (ServiceException e) {
            throw new CommandException(e);
        }
    }
}
