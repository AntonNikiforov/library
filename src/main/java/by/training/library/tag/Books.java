package by.training.library.tag;

import by.training.library.entity.Book;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.List;

public class Books extends TagSupport {

    private List<Book> list;
    private Integer page;

    public List<Book> getList() {
        return list;
    }

    public void setList(List<Book> list) {
        if (list == null) throw new IllegalArgumentException();
        this.list = list;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        if (page <= 0) throw new IllegalArgumentException();
        this.page = page;
    }

    @Override
    public int doStartTag() throws JspException {

        int toIndex = page * 10;
        int fromIndex = toIndex - 10;

        int size = list.size();

        if (fromIndex > size) return SKIP_BODY;
        if (toIndex > size) toIndex = size;

        StringBuilder sb = new StringBuilder();

        sb.append("<div class=\"list-group\">\n\t");
        for (Book book : list.subList(fromIndex, toIndex)) {
            sb.append("<a class=\"list-group-item\" href=\"book?id=").append(book.getId()).append("\">\n\t\t")
                    .append("<div class=\"media\">\n\t\t\t")
                    .append("<div class=\"pull-left\">\n\t\t\t\t")
                    .append("<img class=\"media-object\" src=\"../../view/img/index.svg\" alt=\"...\">\n\t\t\t")
                    .append("</div>\n\t\t\t")
                    .append("<div class=\"media-body\">\n\t\t\t\t")
                    .append("<h3 class=\"media-heading\">").append(book.getName()).append("</h3>\n\t\t\t")
                    .append("<h4 >").append(book.getAuthor()).append("</h4>\n\t\t\t")
                    .append("</div>\n\t\t")
                    .append("</div>\n\t")
                    .append("</a>\n");
        }
        sb.append("</div>");

        sb.append(pagination());

        try {
            pageContext.getOut().write(sb.toString());
        } catch (IOException e) {
            throw new JspException(e);
        }

        return SKIP_BODY;
    }

    private String pagination() {
        if (page == null || page <= 0) page = 1;

        int num = list.size();
        num = ((num - 1) / (10)) + 1;

        StringBuilder sb = new StringBuilder();
        if (num > 1) {

            String query = (String) pageContext.getRequest().getAttribute("q");
            if (query == null) query = "";

            sb.append("<ul class=\"pagination\">");

            for (int i = 1; i <= num; ++i) {
                if (page == i) {
                    sb.append("<li class=\"active\"><span>")
                            .append(i)
                            .append(" <span class=\"sr-only\">(current)</span></span></li>");
                } else {
                    sb.append("<li>\n")
                            .append("<form role=\"form\" action=\"books\" method=\"post\">\n")
                            .append("<input type=\"hidden\" name=\"q\" value=\"").append(query).append("\">")
                            .append("<button type=\"submit\" name=\"page\" value=\"").append(i).append("\">")
                            .append(i).append("</button>\n</form>\n</li>");
                }
            }
            sb.append("</ul>");
        }
        return sb.toString();
    }
}
