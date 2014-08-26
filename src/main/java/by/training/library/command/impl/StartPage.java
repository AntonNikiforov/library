package by.training.library.command.impl;

import by.training.library.command.Command;
import by.training.library.command.CommandException;
import by.training.library.controller.Page;
import by.training.library.controller.SessionScope;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StartPage implements Command {

    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        if (SessionScope.getUserId(request) != null) {
            return Command.BOOKS;
        } else {
            return Page.START_PAGE;
        }
    }
}
