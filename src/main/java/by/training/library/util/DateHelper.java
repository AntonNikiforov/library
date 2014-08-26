package by.training.library.util;

public class DateHelper {

    public static java.sql.Date getCurrentDate() {

        return new java.sql.Date(new java.util.Date().getTime());
    }


}
