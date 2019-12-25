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

@WebServlet(name = "DeleteServlet")
public class DeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        int id = 0;
        int planId = 0;
        id = Integer.parseInt(request.getParameter("id"));
        planId = Integer.parseInt(request.getParameter("Planid"));
        UpdateService us = new UpdateServiceImpl();
        try {
            us.Delete(id,planId);
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