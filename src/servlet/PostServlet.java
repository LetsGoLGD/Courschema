//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.PostServiceImpl;

@WebServlet(
        name = "ShowServlet"
)
public class PostServlet extends HttpServlet {
    public PostServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostServiceImpl ss = new PostServiceImpl();

        try {
            request.setAttribute("List", ss.getTopics());
        } catch (Exception var5) {
            var5.printStackTrace();
        }

        request.getRequestDispatcher("bbs.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
