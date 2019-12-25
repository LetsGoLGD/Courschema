package servlet;


import bean.CourseBean;
import service.UpdateService;
import service.UpdateServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UpdateServlet")
public class UpdateServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String course = request.getParameter("course");
        String department = request.getParameter("department");
        String year = request.getParameter("year");
        String plan = request.getParameter("plan");
        UpdateService us = new UpdateServiceImpl();
        List<CourseBean> showCourse = us.courseInfo(course,department,year,plan);
        request.setAttribute("List",showCourse);
        request.getRequestDispatcher("course.jsp").forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }
}