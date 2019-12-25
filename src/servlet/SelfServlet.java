package servlet;



import bean.CourseBean;
import service.ShowService;
import service.ShowServiceImpl;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "SelfServlet")
public class SelfServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String username = (String) request.getSession().getAttribute("username");
        UserService ss = new UserServiceImpl();
        List<CourseBean> showSelf = null;
        try {
            showSelf = ss.show(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        assert showSelf != null;
        String []abbr_name = new String[showSelf.size()];
        String []course_name = new String[showSelf.size()];
        for(int i = 0; i < showSelf.size(); i++){
            abbr_name[i] = showSelf.get(i).getAbbr_name();
            course_name[i] = showSelf.get(i).getCourse_name();
        }

        request.getSession().setAttribute("abbr_namme", abbr_name);
        request.getSession().setAttribute("course_name", course_name);
        request.getSession().setAttribute("List",showSelf);
        request.getRequestDispatcher("schema.jsp").forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }

}