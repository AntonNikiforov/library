package by.training.library.controller;

import by.training.library.entity.Lang;

import javax.servlet.http.HttpServletRequest;

public class SessionScope {

    public static final String USER_ID = "id";
    public static final String ADMIN = "admin";
    public static final String LANG = "lang";

    public static void setUserId(HttpServletRequest request, int id) {
        request.getSession().setAttribute(USER_ID, id);
    }

    public static Integer getUserId(HttpServletRequest request) {
        Object id = request.getSession().getAttribute(USER_ID);
        return (Integer) id;
    }

    public static void setAdmin(HttpServletRequest request, boolean admin) {
        request.getSession().setAttribute(ADMIN, admin);
    }

    public static Boolean isAdmin(HttpServletRequest request) {
        Object admin = request.getSession().getAttribute(ADMIN);
        return (Boolean) admin;
    }

    public static void setLocale(HttpServletRequest request, Lang lang) {
        request.getSession().setAttribute(LANG, lang);
    }

    public static Lang getLocale(HttpServletRequest request) {
        Object lang = request.getSession().getAttribute(LANG);
        return (Lang) lang;
    }
}

