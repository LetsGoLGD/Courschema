package servlet;



import bean.CourseBean;
import service.ShowService;
import service.ShowServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowServlet")
public class ShowServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String year = "";
        String department = "";
        String plan = "";
        String type = "";
        year = request.getParameter("year");
        department = request.getParameter("department");
        plan = request.getParameter("plan");
        type = request.getParameter("type");
        ShowService ss = new ShowServiceImpl();
        List<CourseBean> showCourse = ss.courseList(year,department,plan,type);
        request.setAttribute("List",showCourse);
        request.getRequestDispatcher("schema.jsp").forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }

}