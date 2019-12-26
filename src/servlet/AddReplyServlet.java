package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PostServiceImpl;

@WebServlet(
        name = "AddReplyServlet"
)
public class AddReplyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PostServiceImpl ss = new PostServiceImpl();

        String topicId = request.getParameter("topic_id");
        System.out.println("reply topic id " + topicId);
        String content = request.getParameter("replyContent");
        String userName = (String) request.getSession().getAttribute("username");

        if(content.length() == 0){
            System.out.println("reply length zero");
            response.getWriter().println("<script>alert('回复长度不能为0。');  window.location='PostServlet' </script>");
            response.getWriter().flush();
            response.getWriter().close();
        } else {
            try {
                int re = ss.addReply(topicId, userName, content);
                System.out.println("insert reply result" + re);
                if(re == 1){
                    System.out.println("reply success");
                    response.getWriter().println("<script>alert('回复成功。');  window.location='PostServlet' </script>");
                } else {
                    System.out.println("reply fail");
                    response.getWriter().println("<script>alert('回复失败。');  window.location='PostServlet' </script>");
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