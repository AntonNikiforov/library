package by.training.library.controller;

import by.training.library.command.Command;
import by.training.library.command.CommandException;
import by.training.library.command.CommandHelper;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Controller extends HttpServlet {

    public static final String MESSAGE = "msg";

    private final static Logger log = Logger.getLogger(Controller.class);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageName;

        try {
            Command command = CommandHelper.getInstance().getCommand(request);
            pageName = command.execute(request);

            log.log(Level.INFO, "request: " + request.getServletPath());
            log.log(Level.INFO, "command: " + command.getClass().getSimpleName());
            log.log(Level.INFO, "page: " + pageName);

        } catch (CommandException e) {
            pageName = Page.ERROR_PAGE;
            request.setAttribute(MESSAGE, e.getMessage());
            log.log(Level.WARN, e.getMessage());
        }

        dispatch(request, response, pageName);
    }

    public void dispatch(HttpServletRequest request, HttpServletResponse response, String page) throws ServletException, IOException {

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }
}
