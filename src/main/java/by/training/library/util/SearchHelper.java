package by.training.library.util;

public class SearchHelper {

    public static String getRegex(String q) {
        String[] parts = q.split(" ");

        String regexp = "";
        try {
            for (String part : parts) {
                regexp += "|(" + part.toLowerCase() + ")";
            }
            regexp = regexp.substring(1);
        } catch (Exception e) {
            regexp = "()";
        }
        return regexp;
    }
}
