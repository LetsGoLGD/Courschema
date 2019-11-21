package servlet;

import bean.unit_courseBean;
import service.unit_courseService;
import service.unit_courseServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "unit_courseServlet")
public class unit_courseServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("unit_course Serverlet begin");
        int year = 2019;
        int id_major =1;
        String plan_order = "2";
        year = Integer.parseInt(request.getParameter("unit_year"));
        id_major = Integer.parseInt(request.getParameter("unit_id_major"));
        plan_order = request.getParameter("unit_plan_order");
        unit_courseService unit_courseservice = new unit_courseServiceImpl();
        List<unit_courseBean> unit_coursebeanList = unit_courseservice.fetchunit_courseList(year,id_major,plan_order);
        request.setAttribute("unit_courseList",unit_coursebeanList);
        request.getRequestDispatcher("schema.jsp").forward(request,response);
    
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
