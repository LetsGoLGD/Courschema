package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PostServiceImpl;

@WebServlet(
        name = "AddPostServlet"
)
public class AddPostServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PostServiceImpl ss = new PostServiceImpl();

        String title = request.getParameter("title");
        String type = request.getParameter("group");
        String content = request.getParameter("content");
        String userName = (String) request.getSession().getAttribute("username");

        if(title.length() == 0 || content.length() == 0){
            System.out.println("reply length zero");
            response.getWriter().println("<script>alert('标题或内容不能为空。');  window.location='PostServlet' </script>");
            response.getWriter().flush();
            response.getWriter().close();
        } else {
            try {
                int re = ss.addPost(type, userName, content, title);
                System.out.println("insert post result" + re);
                if(re == 1){
                    System.out.println("Post success");
                    response.getWriter().println("<script>alert('发布成功。');  window.location='PostServlet' </script>");
                } else {
                    System.out.println("Post fail");
                    response.getWriter().println("<script>alert('发布失败。');  window.location='PostServlet' </script>");
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