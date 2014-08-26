package by.training.library.command.impl;

import by.training.library.command.Command;
import by.training.library.command.CommandException;
import by.training.library.controller.Page;
import by.training.library.controller.SessionScope;
import by.training.library.entity.Book;
import by.training.library.service.BookService;
import by.training.library.service.exception.ServiceException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ShowBooks implements Command {

    public static final String QUERY = "q";
    public static final String PAGE = "page";

    public static final String MESSAGE = "msg";
    public static final String RESULT_LIST = "list";
    public static final String GENRE_LIST = "genre_list";

    @Override
    public String execute(HttpServletRequest request) throws CommandException {

        if (SessionScope.getUserId(request) == null) return Page.START_PAGE;

        try {
            Integer page = request.getParameter(PAGE) == null? 1 : Integer.parseInt(request.getParameter(PAGE));

            String query = request.getParameter(QUERY);
            if (query == null) query = "";

            BookService service = BookService.getInstance();
            List<Book> list;
            if ("".equals(query)) {
                list = service.getAll();
            } else {
                list = service.searchByName(query);
            }
            request.setAttribute(RESULT_LIST, list);
            request.setAttribute(PAGE, page);
            request.setAttribute(QUERY, query);
            request.setAttribute(GENRE_LIST, service.getAllGenres());

            return Page.BOOKS;

        } catch (ServiceException e) {
            throw new CommandException(e);
        }
    }
}
