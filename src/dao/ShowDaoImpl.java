package dao;

import bean.CourseBean;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ShowDaoImpl implements ShowDao {
    DBUtil dbutil = new DBUtil();
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    Statement statement = null;
    ResultSetMetaData metaData = null;
    @Override
    public List<CourseBean> showList(String year, String department, String plan,String type) throws Exception {
        if(department==null){
            department = "";
        }
        if(plan==null){
            plan = "";
        }
        if(year==null){
            year = "";
        }
        if(type==null){
            type = "";
        }
        List<CourseBean> cb = null;
        connection = dbutil.getConnection();
        String sql="select * from course join unit_course on course.id_course = unit_course.id_course order by abbre_course";
        preparedStatement=connection.prepareStatement(sql);
        resultSet=preparedStatement.executeQuery();
        cb=new ArrayList<CourseBean>();
        while (resultSet.next()){
            CourseBean C = new CourseBean();
            C.setId(resultSet.getInt(1));
            C.setName(resultSet.getString(2));
            C.setCode(resultSet.getString(3));
            C.setCredit(resultSet.getInt(4));
            C.setPeriod(resultSet.getInt(5));
            C.setYear(resultSet.getInt(7));
            C.setPlanOrder(resultSet.getInt(9));
            C.setAttr(resultSet.getString(12));
            if(C.getCode().contains(department)&&(plan==""||C.getPlanOrder()==Integer.parseInt(plan))
                    &&(year==""||C.getYear()==Integer.parseInt(year))&&(type==""||C.getAttr().equals(type))){
                cb.add(C);
            }
        }
        return cb;
    }
}
