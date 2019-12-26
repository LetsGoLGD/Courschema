package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;
import service.UserServiceImpl;

@WebServlet(
        name = "AddReplyServlet"
)
public class UpdatePasswordServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        UserService ss = new UserServiceImpl();

        String emailAdd = request.getParameter("EmailAdd");
        String newPass = request.getParameter("newPass");

        if(newPass.length() == 0){
            System.out.println("reply length zero");
            response.getWriter().println("<script>alert('修改密码长度不能为0');  window.location='login.jsp' </script>");
            response.getWriter().flush();
            response.getWriter().close();
        } else {
            try {
                int re = ss.updatePassword(emailAdd, newPass);
                System.out.println("insert reply result" + re);
                if(re == 1){
                    System.out.println("change success");
                    response.getWriter().println("<script>alert('修改成功。');  window.location='login.jsp' </script>");
                } else {
                    System.out.println("change fail");
                    response.getWriter().println("<script>alert('修改失败。');  window.location='login.jsp' </script>");
                }
                response.getWriter().flush();
                response.getWriter().close();
            } catch (Exception var5) {
                var5.printStackTrace();
            }
        }

//        request.getRequestDispatcher("PostServlet").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}