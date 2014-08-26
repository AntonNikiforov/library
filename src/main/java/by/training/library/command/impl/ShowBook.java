package by.training.library.command.impl;

import by.training.library.command.Command;
import by.training.library.command.CommandException;
import by.training.library.controller.Page;
import by.training.library.controller.SessionScope;
import by.training.library.entity.Book;
import by.training.library.service.BookService;
import by.training.library.service.BookingService;
import by.training.library.service.exception.NoSuchBookException;
import by.training.library.service.exception.ServiceException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ShowBook implements Command {

    public static final String BOOK_ID = "id";

    public static final String BOOK = "book";
    public static final String NUM = "num";
    public static final String GENRE_LIST = "genre_list";
    public static final String TYPE_LIST = "type_list";
    public static final String MESSAGE = "msg";

    @Override
    public String execute(HttpServletRequest request) throws CommandException {

        if (SessionScope.getUserId(request) == null) return Page.START_PAGE;

        try {
            Integer bookId;
            if (request.getParameter(BOOK_ID) != null || request.getAttribute(BOOK_ID) != null) {
                if (request.getParameter(BOOK_ID) != null) {
                    bookId = Integer.valueOf(request.getParameter(BOOK_ID));
                } else {
                    bookId = (Integer) request.getAttribute(BOOK_ID);
                }
            } else {
                request.setAttribute(MESSAGE, "wrong request");
                return Page.ERROR_PAGE;
            }

            //CustomDao dao = new CustomDao();
            BookService service = BookService.getInstance();
            Book book = service.readBook(bookId);

            //CommentDao cDao = new CommentDao();
            //List<Comment> list = cDao.getCommentsByBook(book);
            //request.setAttribute(COMMENTS, list);

            int numInLibNow = book.getNum() - service.getAllOpenBookings(bookId).size();

            request.setAttribute(BOOK, book);
            request.setAttribute(GENRE_LIST, service.getAllGenres());
            request.setAttribute(NUM, numInLibNow);

            BookingService bookingService = BookingService.getInstance();
            request.setAttribute(TYPE_LIST, bookingService.getAllTypes());
            //return "/book.jsp";
            return Page.BOOK_PAGE;

        } catch (NoSuchBookException e) {
            request.setAttribute(MESSAGE, e.getMessage());
            return Command.BOOKS;
        } catch (ServiceException e) {
            throw new CommandException(e);
        }
    }
}
