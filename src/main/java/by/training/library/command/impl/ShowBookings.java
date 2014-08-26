package by.training.library.command.impl;

import by.training.library.command.Command;
import by.training.library.command.CommandException;
import by.training.library.controller.Page;
import by.training.library.controller.SessionScope;
import by.training.library.entity.Booking;
import by.training.library.service.BookService;
import by.training.library.service.BookingService;
import by.training.library.service.UserService;
import by.training.library.service.exception.ServiceException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ShowBookings implements Command {

    public static final String PAGE = "page";
    public static final String USER_ID = "user_id";
    public static final String BOOK_ID = "book_id";
    public static final String TYPE = "type";

    public static final String MESSAGE = "msg";
    public static final String RESULT_LIST = "list";
    public static final String TYPE_LIST = "type_list";

    @Override
    public String execute(HttpServletRequest request) throws CommandException {

        if (SessionScope.getUserId(request) == null) return Page.START_PAGE;

        try {
            Integer page = request.getParameter(PAGE) == null? 1 : Integer.parseInt(request.getParameter(PAGE));

            String userId = request.getParameter(USER_ID);
            String bookId = request.getParameter(BOOK_ID);
            String type = request.getParameter(TYPE);

            List<Booking> list;
            if (userId != null) {
                UserService service = UserService.getInstance();
                if (type == null) {
                    list = service.getAllBookings(Integer.parseInt(userId));
                } else {
                    list = service.getAllOpenBookings(Integer.parseInt(userId));
                }
            } else if (bookId != null) {
                BookService service = BookService.getInstance();
                if (type == null) {
                    list = service.getAllBookings(Integer.parseInt(bookId));
                } else {
                    list = service.getAllOpenBookings(Integer.parseInt(bookId));
                }
            } else {
                BookingService service = BookingService.getInstance();
                list = service.getAllBookings();
            }

            BookingService service = BookingService.getInstance();

            request.setAttribute(RESULT_LIST, list);
            request.setAttribute(PAGE, page);
            request.setAttribute(USER_ID, userId);
            request.setAttribute(BOOK_ID, bookId);
            request.setAttribute(TYPE, type);
            request.setAttribute(TYPE_LIST, service.getAllTypes());

            return Page.BOOKINGS;

        } catch (IllegalArgumentException e) {
            request.setAttribute(MESSAGE, "wrong request");
            return Page.ERROR_PAGE;
        } catch (ServiceException e) {
            throw new CommandException(e);
        }
    }
}
