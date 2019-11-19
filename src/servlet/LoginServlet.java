package servlet;


import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserService userservice = new UserServiceImpl();
        int result = 0;
        result = userservice.login(username, password);
        if (result == 1) {
            System.out.println("visiting database successfully");
            request.getRequestDispatcher("BookServlet").forward(request, response);
        } else {
            request.setAttribute("msg", "The username or password is wrong.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }

}