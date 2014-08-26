package by.training.library.tag;

import by.training.library.controller.SessionScope;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class Pagination extends TagSupport {

    private Integer num;
    private Integer page;

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer numAtAll) {
        this.num = numAtAll;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    @Override
    public int doStartTag() throws JspException {

        if (num <= 0) {
            return SKIP_BODY;
        }

        if (page == null || page <= 0) page = 1;

        num = ((num - 1) / (10)) + 1;

        if (num > 1) {
            try {
                JspWriter out = pageContext.getOut();

                StringBuilder sb = new StringBuilder();
                sb.append("<ul class=\"pagination\">");

                for (int i = 1; i <= num; ++i) {
                    if (page == i) {
                        sb.append("<li class=\"active\"><span>")
                                .append(i)
                                .append(" <span class=\"sr-only\">(current)</span></span></li>");
                    } else {
                        sb.append("<li>\n")
                                .append("<form role=\"form\" action=\"").append(pageContext.getRequest().getAttribute("action")).append("\" method=\"post\">\n")
                                .append("<button type=\"submit\" name=\"page\" value=\"").append(i).append("\">")
                                .append(i).append("</button>\n</form>\n</li>");
                    }
                }
                sb.append("</ul>");
                out.write(sb.toString());

            } catch (IOException e) {
                throw new JspException(e.getMessage(), e);
            }
        }
        return SKIP_BODY;
    }
}
