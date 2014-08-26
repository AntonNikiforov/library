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
import java.util.ResourceBundle;

public class Login implements Command {

    public static final String EMAIL = "email";
    public static final String PASSWORD = "password";

    public static final String MESSAGE = "msg";

    @Override
    public String execute(HttpServletRequest request) throws CommandException {

        if (SessionScope.getUserId(request) != null) {
            return Command.USER;
        }

        String email = request.getParameter(EMAIL);
        String password = request.getParameter(PASSWORD);

        if (email == null ||  password == null) {
            return Page.START_PAGE;

        }

        try {
            //UserDao dao = new MySqlDaoFactory().getDao(UserDao.class);
            //CustomDao dao = new CustomDao();
            //UserDao dao = DaoFactory.getInstance().getUserDao();

            UserService service = UserService.getInstance();
            User user = service.login(email, password);//dao.login(email, Security.getHashCode(password));

            if (user == null) {
                request.setAttribute(MESSAGE, "check email and password");
                return Page.START_PAGE;

            // success
            } else {
                request.getSession().setAttribute(SessionScope.USER_ID, user.getId());
                request.getSession().setAttribute(SessionScope.LANG, user.getLang());
                request.getSession().setAttribute(SessionScope.ADMIN, user.isAdmin());

                return Command.USER;
            }
        } catch (ServiceException e) {
            throw new CommandException(e);
        }
    }
}
