package servlet;



import bean.CourseBean;
import service.ShowService;
import service.ShowServiceImpl;
import service.UpdateService;
import service.UpdateServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "AddServlet")
public class AddServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String courseName = request.getParameter("courseName");
        String shortName = request.getParameter("shortName");
        String credit = request.getParameter("credit");
        String semester = request.getParameter("semester");
        String major = request.getParameter("major");
        System.out.println(courseName+" "+shortName+" "+credit+" "+semester+" "+major);
        UpdateService us = new UpdateServiceImpl();
        PrintWriter out = response.getWriter();
        out.println("<script>alert('所选课程不存在。'); window.location='login.jsp' </script>");
        try {
            us.add(courseName,shortName,credit,semester,major);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("AdjustServlet").forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }

}