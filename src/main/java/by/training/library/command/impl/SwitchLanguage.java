package by.training.library.command.impl;

import by.training.library.command.Command;
import by.training.library.command.CommandException;
import by.training.library.controller.Page;
import by.training.library.controller.SessionScope;
import by.training.library.entity.Lang;
import by.training.library.service.UserService;
import by.training.library.service.exception.ServiceException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SwitchLanguage implements Command {

    public static final String LANG_ID = "locale";

    @Override
    public String execute(HttpServletRequest request) throws CommandException {

        Integer langId = Integer.valueOf(request.getParameter(LANG_ID));

        UserService service = UserService.getInstance();
        try {
            Lang lang = service.readLang(langId);

            SessionScope.setLocale(request, lang);

            Integer currentUserId = SessionScope.getUserId(request);
            if (currentUserId == null) {
                return Page.START_PAGE;
            } else {
                return Page.USER_PAGE;
            }

        } catch (ServiceException e) {
            throw new CommandException(e);
        }
    }
}
