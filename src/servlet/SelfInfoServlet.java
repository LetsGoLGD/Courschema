package servlet;



import bean.CourseBean;
import bean.UserBean;
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
import java.util.List;

@WebServlet(name = "SelfInfoServlet")
public class SelfInfoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String username = (String) request.getSession().getAttribute("username");
        UserService us = new UserServiceImpl();
        List<UserBean> info = us.info(username);
        UserBean ub = info.get(0);
        request.getSession().setAttribute("name",ub.getName());
        request.getSession().setAttribute("gender",ub.getGender());
        request.getSession().setAttribute("mail",ub.getMail());
        request.getSession().setAttribute("stu_year",ub.getGrade());
        request.getSession().setAttribute("major",ub.getDepartment());
        request.getSession().setAttribute("id",ub.getId());
        request.getRequestDispatcher("self_info.jsp").forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }

}