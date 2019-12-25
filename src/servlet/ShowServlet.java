package servlet;



import bean.CourseBean;
import service.ShowService;
import service.ShowServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ShowServlet")
public class ShowServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String year = "";
        String department = "";
        String plan = "";
        year = request.getParameter("year")!=null?request.getParameter("year"): (String) request.getSession().getAttribute("year");
        department = request.getParameter("department")!=null?request.getParameter("department"): (String) request.getSession().getAttribute("department");
        plan = request.getParameter("plan")!=null?request.getParameter("plan"): (String) request.getSession().getAttribute("plan");
        request.getSession().setAttribute("year",year);
        request.getSession().setAttribute("department",department);
        request.getSession().setAttribute("plan",plan);
        ShowService ss = new ShowServiceImpl();
        List<CourseBean> showCourse = null;
        if(year!=null&&department!=null&&plan!=null){
            showCourse = ss.courseList(year,department,plan);
        }else{
           showCourse = ss.courseList(null,null,null);
        }
        request.getSession().setAttribute("List",showCourse);
        request.getRequestDispatcher("schema.jsp").forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }

}