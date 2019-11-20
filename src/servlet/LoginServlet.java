package servlet;


import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(username+" "+password);
        UserService userservice = new UserServiceImpl();
        int result = 0;
        result = userservice.login(username, password);
        PrintWriter out = response.getWriter();
        if (result == 1) {
            System.out.println("visiting database successfully");
            request.setAttribute("msg","Sussess.");
            request.getRequestDispatcher("schema.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "The username or password is wrong.");
            out.println("<script>alert('Username or password is wrong'); window.location='login.jsp' </script>");
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }
}