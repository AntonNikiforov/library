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
        
        String commandName = null;
        try {
            commandName = CommandHelper.getInstance().getCommandName(request);
            Command command = CommandHelper.getInstance().getCommand(commandName);
            pageName = command.execute(request, response);

            log.log(Level.INFO, "command name: " + commandName);
            log.log(Level.INFO, "command: " + command.getClass().getSimpleName());
            log.log(Level.INFO, "page: " + pageName);

        } catch (CommandException e) {
            pageName = Page.ERROR_PAGE;
            request.setAttribute("error_msg", e.getHiddenException().getMessage());
            e.printStackTrace();
        }

        request.getSession().setAttribute(SessionScope.PAGE, commandName);
        dispatch(request, response, pageName);

    }

    public void dispatch(HttpServletRequest request, HttpServletResponse response, String page) throws ServletException, IOException {
        try {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
            dispatcher.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error_msg", "404");
            request.setAttribute("page_name", page);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(Page.ERROR_PAGE);
            dispatcher.forward(request, response);
        }
    }
}
