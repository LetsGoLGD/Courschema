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
        System.out.println("show let do get begin");
        String year = "";
        String department = "";
        String searchItem = "";
        year = request.getParameter("year");
        department = request.getParameter("year");
        searchItem = request.getParameter("year");
        ShowService ss = new ShowServiceImpl();
        List<CourseBean> showCourse = ss.courseList(year,department,searchItem);
        request.setAttribute("List",showCourse);
        request.getRequestDispatcher("page.jsp").forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }

}