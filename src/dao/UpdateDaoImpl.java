package dao;

import bean.CourseBean;
import util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UpdateDaoImpl implements UpdateDao {
    DBUtil dbutil = new DBUtil();
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    Statement statement = null;
    ResultSetMetaData metaData = null;
    @Override
    public List<CourseBean> showList(String course, String department, String year,String plan) throws Exception {
        List<CourseBean> cb = null;
        connection = dbutil.getConnection();
        String sql0="update ********* from Course";
        preparedStatement=connection.prepareStatement(sql0);
        preparedStatement.execute();
        String sql="select ********* from Course";
        preparedStatement=connection.prepareStatement(sql);
        resultSet=preparedStatement.executeQuery();
        cb=new ArrayList<CourseBean>();
        while (resultSet.next()){
            CourseBean C = new CourseBean();
            //attributes
            cb.add(C);
        }
        return cb;
    }

    @Override
    public void Delete(int id, int planId) throws Exception {
        connection = dbutil.getConnection();
        String sql0="select * from plan_course where id_plan = ? and id_course = ?;";
        preparedStatement=connection.prepareStatement(sql0);
        preparedStatement.setInt(1,planId);
        preparedStatement.setInt(2,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.next()){
            System.out.println("Exists id="+id+",plan="+planId);
        }else{
            System.out.println("does not exist id="+id+",plan="+planId);
        }
        sql0="delete from plan_course where id_plan = ? and id_course = ?;";
        preparedStatement=connection.prepareStatement(sql0);
        preparedStatement.setInt(1,planId);
        preparedStatement.setInt(2,id);
        int x = preparedStatement.executeUpdate();
        System.out.println(x);
    }

    @Override
    public int add(String courseName, String shortName, String credit, String semester, String major,
            Object year,Object department,Object plan) throws Exception {
        connection = dbutil.getConnection();
        String sql0="select * from course where name_course = ? and abbr_course = ?;";
        preparedStatement=connection.prepareStatement(sql0);
        preparedStatement.setString(1,courseName);
        preparedStatement.setString(2,shortName);
        resultSet = preparedStatement.executeQuery();
        if(!resultSet.next()){
            System.out.println("does not exist");
            return 0;
        }

        return 1;
    }

}
